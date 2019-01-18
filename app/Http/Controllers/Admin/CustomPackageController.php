<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Admin\SysPublic;
use App\Http\Model\Admin\Package_det;
use App\Http\Model\Admin\Package;
use App\Http\Model\Admin\Product;
use App\Http\Model\Admin\Customer;
use function foo\func;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Validator;
use DB;



class CustomPackageController extends CommonController
{

    public function index()
    {
        $code = SysPublic::getautocode('CPackage');
        return view("admin.custompackage.index",compact("code"));
    }

    public function pack_check_print($pack_bill){

        $data = Package::where(function ($query) use ($pack_bill){
            $query -> where("pack_bill",$pack_bill)
            ->where("pstate",1);

        })->first();

        $data['moddate'] = date('Y-m-d',$data['moddate']);

        $detail = Package_det::where("pack_id",$data['id'])->get();

        $total=0;

        foreach ($detail as $v){
            $total += $v['box_num'];
        }
       
        return view('admin.custompackage.packCheckPrint',compact('data','detail','total'));
    }


    public function show_detail(){
        $pack_id = Input::except('_token');

        $data = Package_det::where('pack_id',$pack_id)->get();
        $data = $data->toarray();
        $data = json_encode($data);
        return $data;
    }

    //模糊查询产品编号
    public function  select_pcode(){
        $input = Input::except('_token');
        $select_str = '%'.$input['keywords'].'%';

        $data = Product::where("pcode",'like',$select_str)->get(['pcode','id']);

        $data = $data->toarray();
        $data = json_encode($data);
        return $data;
    }


    //模糊查询客户编号
    public function  select_cust_code(){
        $input = Input::except('_token');
        $keywords = $input['keywords'];

//        $data = Customer::
//        where("cust_code",'like',"%$keywords%")->get(['cust_id','cust_code','cust_nameCn']);

        $data = Customer::where(function ($query) use ($keywords){
            $query->where("cust_code",'like',"$keywords")
            ->orWhere("cust_nameCn",'like',"$keywords");
            })
            ->where('cust_iscust',1)
            ->get(['cust_id','cust_code','cust_nameCn']);

        $data = $data->toarray();
        $data = json_encode($data);
        return $data;
    }

    //查询客户
    public function  find_cust(){
        $data = Customer::where('cust_iscust',1)
            ->paginate(20);
//        dd($data);
        return view('admin.custompackage.find_cust',compact('data'));
    }
    //关键字查询客户
    public function custkeyword(){
        $input = Input::except('_token');

        $keywords = $input['keywords'];
        $data=Customer::where(function ($query) use ($keywords){
            $query->where("cust_code",'like',"%$keywords%")
                ->orWhere("cust_nameCn",'like',"%$keywords%")
                ->orWhere("cust_NameEn",'like',"%$keywords%");
             })
            ->where('cust_iscust',1)
            ->paginate(20);
        $data->appends($input)->links();
        return view('admin.custompackage.find_cust',compact('data'));
    }


    //查询物料
    public function  find_pcode(){
        $data = Product::get(['pcode','pname','pmodel','pstyle','moddate','modman']);

        return $data;
    }
    //模糊查询物料
    public function  pkeyword(){
        $input = Input::except('_token');
        $keywords = $input['keywords'];
        $data = Product::where("pcode",'like',"%$keywords%")
            ->orWhere("pname",'like',"%$keywords%")
            ->get(['pcode','pname','pmodel','pstyle','moddate','modman']);

        return $data;
    }

    //获取物料的详细信息
    public function get_pinfo(){
        $input = Input::except('_token');
        $pcode = $input['pcode'];

        $data = Product::where("pcode",$pcode)->get();

        $data = $data->toarray();
        $data = json_encode($data);
        return $data;
    }

    //检查插入的物料
    public function check_detail(){
        $input = Input::except('_token');
        $pcode = $input['pcode'];
        $re = Product::where("pcode",$pcode)->get();
        $re = $re->toarray();

        if(count($re)){
            array_push($re,["status"=>0,"msg"=>"插入成功"]);
            $data = json_encode($re);
        }else {
            $data = [
                'status' => 1,
                'msg' => '产品不存在！',
            ];
        }
        return $data;
    }

    public function save_pack(){

        DB::beginTransaction(); //开启事务
        try{
            //验证装箱表是否存在
            $pack_bill = Input::get("pack_bill");
            $is_exist = Package::where('pack_bill',$pack_bill)->get();

            if(count($is_exist)>=1){
                throw new \Exception('装箱表已存在，请刷新页面','0');
            }


            //创建装箱表
            $input = Input::except("_token","detail_json");
//            dd($input);
            $re = Package::create($input);

            if(!$re){
                throw new \Exception("装箱表插入失败！","0");
            }

            //得到装箱表id
            $pack_id = Package::where("pack_bill",$pack_bill)->get(["id"]);
            $pack_id = $pack_id->toarray();
            if(count($pack_id)==1) {
                $pack_id = $pack_id[0]["id"];
            }else{
                throw new \Exception("装箱表不存在！","0");
            }
            //插入详单
            $detail = Input::get('detail_json');

            foreach ($detail as $v){
                //获取产品信息
                $pinfo = Product::where("pcode",$v['pcode'])->get(['pname','pstyle','moddate','modman']);
                if(count($pinfo)<=0){
                    $msg = $v['pcode'].'不存在';
                    throw new \Exception($msg,'0');
                }
                $pinfo = $pinfo->toarray();

                $pname = $pinfo[0]['pname'];
                $pstyle = $pinfo[0]['pstyle'];
                $box_num = $v['box_num'];
                $moddate =  $pinfo[0]['moddate'];
                $modman =  $pinfo[0]['modman'];

                //插入信息到详单
                $re = Package_det::create(['pack_id'=>$pack_id,'pcode'=>$v['pcode'],'pname'=>$pname,'pstyle'=>$pstyle,'box_num'=>$box_num,'moddate'=>$moddate,'modman'=>$modman]);

                if(!$re){
                    $msg = $v['pcode'].'插入失败';
                    throw new \Exception($msg,'0');
                }
            }
            DB::commit();//提交

            $data=[
                "msg" => "操作完成",
                "status" => 1
            ];
            return $data;
        }catch( \Exception $e){
            DB::rollback();//事务回滚

            $msg = $e->getMessage();
            $status = $e->getCode();
            $data=[
                "msg" => $msg,
                "status" => $status
            ];
            return $data;
        }
    }

    //展示
    public function show(){

        $data = Package::leftjoin('cust_customer','cust_customer.cust_code','=','package.cust_no')
         ->orderby("package.id","desc")
            ->select('package.*','cust_customer.cust_nameCn')->paginate(20);

//        dd($data);
        return view('admin.custompackage.show')->with("data",$data);
    }

    //审核
    public function check(){

        $input = Input::except('_token');

        $id = $input['id'];
        $pstate = $input["pstate"];

        $re =  Package::where("id",$id)->update(['pstate'=>$pstate]);

        if($re){
            $data=[
                "msg"=>'操作完成',
                "status"=>1
            ];
        }else{
            $data=[
                "msg"=>'操作失败',
                "status"=>0
            ];
        }
        return $data;

    }

    //关键字查询
    public  function search(){

        $input = Input::except('_token');

        if ($input['keywords'] <> '') {
            $keywords = $input['keywords'];
        } else {
            $keywords = '';
        }

        $data = Package::leftjoin('cust_customer','cust_customer.cust_code','=','package.cust_no')
            ->where("package.pack_bill",'like',"%$keywords%")
            ->orWhere("cust_customer.cust_nameCn",'like',"%$keywords%")
            ->orderby("package.id","desc")
            ->select('package.*','cust_customer.cust_nameCn')->paginate(20);

//        $data = Package::where("pack_bill",'like',"%$keywords%")->orderby("id","desc")->paginate(8);

        $data->appends(['keywords' => $keywords])->links();
        return view('admin.custompackage.show')->with("data",$data);
    }









}

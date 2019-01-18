<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/12 0012
 * Time: 10:06
 */

namespace App\Http\Controllers\Admin;

use function foo\func;
use Illuminate\Support\Facades\Input;
use App\Http\Model\Admin\SysPublic;
use App\Http\Model\Admin\Customer;
use App\Http\Model\Admin\Stock;
use App\Http\Model\Admin\Stockdet;
use App\Http\Model\Admin\Stockoper;
use App\Http\Model\Admin\Storage;
use App\Http\Model\Admin\Product;
use App\Http\Requests;
use DB;

class StockController extends CommonController
{
    public function index(){
        $code = SysPublic::getautocode('Jstockno');//生成订单编号
        $stor=(new Storage)->getStorInfo();
        return view("admin.stock.index",compact('code','stor'));
    }
    //选择客户户列表
    public function  select_cust_code(){
        $input = Input::except('_token');
        $select_str = '%'.$input['keywords'].'%';

        $data = Customer::where("cust_code",'like',$select_str)->get(['cust_id','cust_code','cust_nameCn']);

        $data = $data->toarray();
        $data = json_encode($data);
        return $data;
    }
    //查询客户列表
    public function  find_cust(){
        $data = Customer::get(['cust_code','cust_nameCn','cust_NameEn']);

        return $data;
    }
    //关键字查询客户
    public function custkeyword(){
        $input = Input::except('_token');

        $keywords = $input['keywords'];
        $data = Customer::where('cust_code','like',"%$keywords%")
            ->orWhere('cust_nameCn','like',"%$keywords%")
            ->orWhere('cust_NameEn','like',"%$keywords%")->
            get(['cust_code','cust_nameCn','cust_NameEn']);

        return $data;
    }

    //选择操作列表
    public function  select_oper_id(){
        $input = Input::except('_token');
        $select_str = '%'.$input['keywords'].'%';
        $data = Stockoper::where('Oper_usable','1')
                ->where(function ($query) use ($select_str){
                    $query->where("Oper_name",'like',$select_str)
                        ->orWhere('Oper_code','like',$select_str);
        })->get(['Oper_code','Oper_name']);

        $data = $data->toarray();
        $data = json_encode($data);
        return $data;
    }

    //查询操作列表
    public function  find_oper(){
        $data = Stockoper::where('Oper_usable','1')->get(['Oper_code','Oper_name','Oper_way']);

        return $data;
    }

    //模糊查询产品
    public function  select_pcode(){
        $input = Input::except('_token');
        $select_str = '%'.$input['keywords'].'%';

        $data = Product::where("pcode",'like',$select_str)->where('psate','1')->get(['pcode','id']);

        $data = $data->toarray();
        $data = json_encode($data);
        return $data;
    }

    //查找产品
    public function  find_pcode(){
        $data = Product::where('psate','1')->get(['pcode','pname','pmodel','pstyle','moddate','modman']);

        return $data;
    }

    //模糊查询物料
    public function  pkeyword(){
        $input = Input::except('_token');
        $keywords = $input['keywords'];
        $data = Product::where('psate','1')
            ->where(function ($query) use ($keywords){
                $query ->where("pcode",'like',"%$keywords%")
                    ->orWhere("pname",'like',"%$keywords%");
            })

            ->get(['pcode','pname','pmodel','pstyle','moddate','modman']);

        return $data;
    }
    //选择仓库位置 返回仓库定位
    public function choice_stor(){
        $Stor_id = Input::get('Stor_id');

        //列
        $c = Storage::where("Stor_id",$Stor_id)->get();

        $c_name = $c[0]['Stor_name'];  //列名
        $c_id   = $c[0]['Stor_id'];    //列id
        $c_code = $c[0]['Stor_code'];  //code
        $c_p    = $c[0]['Sp_ParentNo'];//行id

        //行
        $r = Storage::where("Stor_id",$c_p)->get();

        $r_name = $r[0]['Stor_name'];  //行名
        $r_p    = $r[0]['Sp_ParentNo'];//仓库id

        //仓库
        $stor = Storage::where("Stor_id",$r_p)->get();

        $stor_name = $stor[0]['Stor_name'];  //仓库名


        //定位描述
        $pos_str = $stor_name.'-'.$r_name.'-'.$c_name;

        //返回data

        $data=[
            "pos_str"=>$pos_str,
            "stor_id"=>$c_id,
            "stor_code"=>$c_code
        ];
        return $data;




    }

    //获取产品信息
    public function get_pinfo(){
        $input = Input::except('_token');
        $pcode = $input['pcode'];

        $data = Product::where("pcode",$pcode)->get();

        $data = $data->toarray();
        $data = json_encode($data);
        return $data;
    }

    //验证产品
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


    //保存出入库信息
    public function save_stock(){
        DB::beginTransaction(); //开启事务

        try{



            $input = Input::except('_token');

            $is_exist = Stock::where('si_no',$input['si_no'])->get();

            if(count($is_exist)>=1){
                throw new \Exception('单号已存在，请刷新页面','0');
            }


            //通过操作查询出入库方向
            $si_way = Stockoper::where('Oper_code',$input['oper_id'])->get(['Oper_way']);

            $si_way = $si_way[0]['Oper_way']; //获取进出方向
            $modman =  session('user');//获取当前登录用户

            $re = Stock::create(['si_no'=>$input['si_no'],'cust_code'=>$input['cust_code'],
                                'oper_id'=>$input['oper_id'],'si_way'=>$si_way,
                                'si_date'=>$input['si_date'],'si_state'=>'01',
                                'moddate'=>$input['si_date'],'modman'=>$modman
            ]); //开始创建出入库表

            if(!$re){
              throw new \Exception('订单创建失败','0');
            }

            //循环插入详单
            $detail = Input::get('detail_json');

            foreach ($detail as $v){
                $re = Stockdet::create(['si_no'=>$input['si_no'],'pd_code'=>$v['pcode'],
                                        'pl_code'=>'00','stor_id'=>$v['stor_id'] ,
                                        'sid_num'=>$v['box_num']]);
                if(!$re){
                    throw new \Exception('详单插入有误','0');
                }
            }


            DB::commit();//提交

            $data=[
                "msg" => "操作完成",
                "status" => 1
            ];
            return $data;
        }catch (\Exception $e){
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


}
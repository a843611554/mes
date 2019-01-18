<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Admin\Box_basic_info;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Requests;
use App\Http\Model\Admin\Product;
use App\Http\Model\Admin\Bas_producebom;
use Illuminate\Support\Facades\Session;
//use Illuminate\Support\Facades\Redis;
use Illuminate\Validation\Rules\In;
use Validator;
use DB;

class ProducebomController extends CommonController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        if($input = Input::all()){
            $keywords = $input['keywords'];
            $data = Bas_producebom::leftjoin('product','product.pcode','=','bas_producebom.Pd_Code')
                ->groupby('bas_producebom.Pd_Code')
                ->where('product.Pstate',1)
                ->where(function ($query) use ($keywords){
                    $query->where('bas_producebom.Pd_Code','like',"%$keywords%")
                           ->orWhere('pname','like',"%$keywords%");
                })
                ->select('bas_producebom.Pd_Code',
                    DB::raw('
                            max(pname) as pname'),
                    DB::raw('
                            max(Pb_per) as Pb_per'),
                    DB::raw('
                            max(t_bas_producebom.modman) as modman'),
                    DB::raw('
                            max(t_bas_producebom.moddate) as moddate'))
                ->orderby('moddate','desc')
                ->paginate(20);

            $data->appends($input)->links();
            $request->flash();
            return view('admin.producebom.index',compact('data'));
        }else{
            $data = Bas_producebom::leftjoin('product','product.pcode','=','bas_producebom.Pd_Code')
                ->groupby('bas_producebom.Pd_Code')
                ->where('product.Pstate',1)
                ->select('bas_producebom.Pd_Code',
                        DB::raw('
                            max(pname) as pname'),
                        DB::raw('
                            max(Pb_per) as Pb_per'),
                        DB::raw('
                            max(t_bas_producebom.modman) as modman'),
                        DB::raw('
                            max(t_bas_producebom.moddate) as moddate'))
                ->orderby('moddate','desc')
                ->paginate(20);

//            dd($data);

            return view('admin.producebom.index',compact('data'));
        }
    }

    //显示物料生产清单
    public function show_child_pd($Pd_Code,Request $request){

        if($input=Input::all()){

            $keywords = $input['keywords'];

            $data = Bas_producebom::leftjoin('product', 'product.pcode', '=', 'bas_producebom.Pb_ChildCode')
                ->where('Pd_Code', $Pd_Code)
                ->where(function ($query) use ($keywords){
                    $query->where('bas_producebom.Pb_ChildCode','like',"%$keywords%")
                        ->orWhere('pname','like',"%$keywords%");
                })
            ->where('product.Pstate',1)
                ->select('product.pname', 'bas_producebom.*')
                ->paginate(20);

            $data->appends($input)->links();
            $request->flash();
            return view('admin.producebom.show_child_pd', compact('data'));
        }else {
            $data = Bas_producebom::leftjoin('product', 'product.pcode', '=', 'bas_producebom.Pb_ChildCode')
                ->where('Pd_Code', $Pd_Code)
                ->where('product.Pstate',1)
                ->select('product.pname', 'bas_producebom.*')
                ->paginate(20);

            return view('admin.producebom.show_child_pd', compact('data'));
        }
    }



    public function show_child_list(){
    $input = Input::all();
    $list = Bas_producebom::leftjoin('product', 'product.pcode', '=', 'bas_producebom.Pb_ChildCode')
        ->where('Pd_Code', $input['Pd_Code'])
        ->where('product.Pstate',1)
        ->select('product.pname', 'bas_producebom.*')
        ->get();
    if(count($list)>0){
        $data = [
            'status'=>'1',
            'list'=>$list
        ];
    }else{
        $data = [
            'status'=>'0',
            'msg'=>'无子物料'
        ];
    }
    return $data;

}


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.producebom.add');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input=Input::except('_token');
        DB::beginTransaction(); //开启事务
        try{
            //判断物料生产清单是否已经定义
            $Pd_Code = $input['Pd_Code'];
            $re_isset = Bas_producebom::where('Pd_Code',$Pd_Code)->get();
            if(count($re_isset)>0){
                throw new \Exception('物料清单已存在','0');
            }
            $child_pd_list = $input['child_pd_list'];
            foreach ($child_pd_list as $child_pd){
                $pd_isset = Product::where('pcode',$child_pd['Pb_ChildCode'])->where('pstate',1)->get();
                if(count($pd_isset)<=0){
                    throw new \Exception('子物料不存在','0');
                }//验证子物料是否存在

                $add['Pd_Code']=$input['Pd_Code'];
                $add['Pb_Per']=$input['Pb_Per'];
                $add['Pb_ChildCode']=$child_pd['Pb_ChildCode'];
                $add['Pb_ChildGross']=$child_pd['Pb_ChildGross'];
                $add['Pb_ChildNet']=$child_pd['Pb_ChildNet'];
                $add['Pb_ChildPer']=$child_pd['Pb_ChildPer'];
                $add['Pb_ChildMay']=(bool)$child_pd['Pb_ChildMay'];
                $add['Pb_Note']=$child_pd['Pb_Note'];
                $add['moddate']=time();
                $add['modman']=session('user');

                $re=Bas_producebom::create($add);
                if(!$re){
                    $msg = $child_pd['Pb_ChildCode'].'插入失败';
                    throw new \Exception($msg,'0');
                }

            }


            DB::commit();//提交

            $data=[
                "msg" => "操作完成",
                "status" => '1'
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

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  Pd_Code
     * @return \Illuminate\Http\Response
     */
    public function edit($Pd_Code)
    {
        $Pd_Info = Bas_producebom::leftjoin('product','product.pcode','=','bas_producebom.Pd_Code')
            ->groupby('bas_producebom.Pd_Code')
            ->where('product.Pstate',1)
            ->where('bas_producebom.Pd_Code',$Pd_Code)
            ->select('bas_producebom.Pd_Code',
                DB::raw('
                            max(pmodel) as Pd_Model'),
                DB::raw('
                            max(pstyle) as Pd_Style'),
                DB::raw('
                            max(pname) as Pd_Name'),
                DB::raw('
                            max(Pb_per) as Pb_per'),
                DB::raw('
                            max(t_bas_producebom.modman) as modman'),
                DB::raw('
                            max(t_bas_producebom.moddate) as moddate'))
            ->first();

        $Child_Pd_Info = Bas_producebom::leftjoin('product','product.pcode','=','bas_producebom.Pb_ChildCode')
            ->where('product.Pstate',1)
            ->where('bas_producebom.Pd_Code',$Pd_Code)
            ->select('bas_producebom.*','product.pname as Pb_Child_Name','product.pmodel as Pb_Child_Model','product.pstyle as Pb_Child_Style')
            ->get();
        


        return view('admin.producebom.edit',compact('Pd_Info','Child_Pd_Info'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $Pd_Code
     * @return \Illuminate\Http\Response
     */
    public function update($Pd_Code)
    {
        $input=Input::except('_token','_method');
//        dd($input);
        DB::beginTransaction(); //开启事务

        try{
            //删除旧数据
            $re=Bas_producebom::where('Pd_Code',$Pd_Code)->delete();
            if(!$re){
                throw new \Exception('更新失败','0');
            }


            $child_pd_list = $input['child_pd_list'];

            foreach ($child_pd_list as $child_pd){
                $pd_isset = Product::where('pcode',$child_pd['Pb_ChildCode'])->where('pstate',1)->get();
                if(count($pd_isset)<=0){
                    throw new \Exception('子物料不存在','0');
                }//验证子物料是否存在

                $add['Pd_Code']=$input['Pd_Code'];
                $add['Pb_Per']=(float)$input['Pb_Per'];
                $add['Pb_ChildCode']=$child_pd['Pb_ChildCode'];
                $add['Pb_ChildGross']=$child_pd['Pb_ChildGross'];
                $add['Pb_ChildNet']=$child_pd['Pb_ChildNet'];
                $add['Pb_ChildPer']=(float)$child_pd['Pb_ChildPer'];
                $add['Pb_ChildMay']=(bool)$child_pd['Pb_ChildMay'];
                $add['Pb_Note']=$child_pd['Pb_Note'];

                $add['moddate']=time();
                $add['modman']=session('user');

                $re=Bas_producebom::create($add);

                if(!$re){
                    $msg = $child_pd['Pb_ChildCode'].'更新失败';
                    throw new \Exception($msg,'0');
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

    /**
     * Remove the specified resource from storage.
     *
     * @param  string  $Pd_Code
     * @return \Illuminate\Http\Response
     */
    //删除整个清单需要使用Pd_Code
    public function destroy($Pd_Code)
    {
        $re = Bas_producebom::where('Pd_Code', $Pd_Code)->delete();
        if ($re) {
            $data = [
                'status' => 1,
                'msg' => '删除成功！',
            ];

        } else {
            $data = [
                'status' => 0,
                'msg' => '删除失败！',
            ];
        }
        return $data;
    }

    //删除子物料应该使用id
    public function del_child($id)
    {
        $re = Bas_producebom::where('id', $id)->delete(); //
        if ($re) {
            $data = [
                'status' => 1,
                'msg' => '删除成功！',
            ];

        } else {
            $data = [
                'status' => 0,
                'msg' => '删除失败！',
            ];
        }
        return $data;
    }

    //模糊查询产品编号
    public function  select_pcode(){
        $input = Input::except('_token');
        $keywords = $input['keywords'];

        $data = Product::where("pcode",'like',"%$keywords%")->where('Pstate','1')->get(['pcode','id']);

        return $data;
    }
    //获取物料信息
    public function get_pinfo(){
        $input = Input::except('_token');
        $pcode = $input['Pd_Code'];

        $data = Product::where("pcode",$pcode)->where('Pstate','1')->first();
//        dd($data);

        return $data;
    }

    //弹出窗口查找物料

    public function find_pcode(Request $request){
        if($input = Input::all()){
            isset($input['keywords'])?$keywords=$input['keywords']:$keywords='';
            $data = Product::where("pcode",'like',"%$keywords%")->where('Pstate','1')->paginate(20);
            $data->appends(['keywords'=>$keywords])->links();
            $request->flash();
            return view('admin.producebom.find_pcode',compact('data'));
        }else{
            return view('admin.producebom.find_pcode');
        }
    }
    //弹出窗口查找子物料

    public function find_child_pcode(Request $request){
        if($input = Input::all()){
            isset($input['keywords'])?$keywords=$input['keywords']:$keywords='';
            $data = Product::where("pcode",'like',"%$keywords%")->where('Pstate','1')->paginate(20);
            $data->appends(['keywords'=>$keywords])->links();
            $request->flash();
            return view('admin.producebom.find_child_pcode',compact('data'));
        }else{
            return view('admin.producebom.find_child_pcode');
        }
    }

    public function isset_bom(){
        $input=Input::all();
        $Pd_Code = $input['Pd_Code'];

        $re=Bas_producebom::where('Pd_Code',$Pd_Code)->get();
        if(count($re)>0){
            $data=[
                'status'=>'-1',
                'msg'=>'该物料生产清单已定义',
            ];
        }else{
            $data=[
                'status'=>'1',

            ];
        }
        return $data;
    }

    //弹出窗口添加子物料

    public function add_child_pd(Request $request){
        if($input = Input::all()){
            isset($input['keywords'])?$keywords=$input['keywords']:$keywords='';
            $data = Product::where("pcode",'like',"%$keywords%")->where('Pstate','1')->paginate(20);
            $data->appends(['keywords'=>$keywords])->links();
            $request->flash();
            return view('admin.producebom.add_child_pd',compact('data'));
        }else{
            return view('admin.producebom.add_child_pd');
        }
    }

//    //将提交的子物料暂时存入redis
//
//    public function put_redis(){
//        $input = Input::except('_token');
////        dd($input);
//
//        if(Redis::exists('arr_child_list')){
//            $arr_child_pd = unserialize(Redis::get('arr_child_list'));
//
//            $arr_child_pd[$input['Pb_ChildCode']]=$input;
////            dd($arr_child_pd);
//            Redis::set('arr_child_list',serialize($arr_child_pd));
////            dd(Redis::get('arr_child_list'));
//            $data=[
//                'status'=>"1",
//                'msg'=>'添加成功'
//            ];
//
//        }else{
//            $arr_child_pd = [$input['Pb_ChildCode']=>$input]; //以子物料的code为数组的键
//
//            Redis::set('arr_child_list',serialize($arr_child_pd));//序列化存储
//            $data=[
//                'status'=>"1",
//                'msg'=>'添加成功'
//            ];
////            dd(Redis::get('arr_child_list'));
//        }
//
//        return $data;
//    }
//
//    //获取列表，子物料页面展示
//
//    public function get_child_list(){
//        return unserialize(Redis::get('arr_child_list'));
//    }
//
//
//    public function del_child_pd($Pb_ChildCode){
//        $arr_child_pd = session('arr_child_pd');
//        unset($arr_child_pd[$Pb_ChildCode]);
//        session()->put('arr_child_pd',$arr_child_pd);
//        Session::save();
//        $data = [
//            'status' => 1,
//            'msg' => '删除成功！',
//        ];
//        return $data;
//
//    }

}

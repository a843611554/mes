<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Requests;
use Illuminate\Validation\Rules\In;
use Validator;
use DB;

use App\Http\Model\Admin\Dat_Storage;

class DatStorageController extends CommonController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($input=Input::all()){

            $data = Dat_Storage::where('Sp_ParentNo',$input['rack'])->orderby('Stor_code')->paginate(20);


            $storage = Dat_Storage::where('Sp_ParentNo', 0)->where('Stor_usable', '1')->get();
            $data->appends($input)->links();
            $request->flash();
            return view('admin.datstorage.index', compact('storage','data'));
        }else {
            $storage = Dat_Storage::where('Sp_ParentNo', 0)->where('Stor_usable', '1')->get();
            return view('admin.datstorage.index', compact('storage'));
        }
    }

    public function show_all(){
        $stor=Dat_Storage::where('Stor_usable', '1')->orderby('Stor_id')->get();

        return view('admin.datstorage.show_all',compact('stor'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $storage = Dat_Storage::where('Sp_ParentNo', 0)->where('Stor_usable', '1')->get();
        return view('admin.datstorage.add', compact('storage'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store()
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = Dat_Storage::where('Stor_id',$id)->first();
//        dd($data);
        return view('admin.datstorage.edit',compact('data'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update($id)
    {
        $rules = [
            'Stor_code' => ['required'],
            'Stor_name' => ['required'],
            'Stor_usable'=>['required'],
            'Sp_ParentNo'=>['required']
        ];
        $message = [
            'Stor_code.required' => '编号不能为空！',
            'Stor_name.required' => '名称不能为空！',
            'Stor_usable.required' => '可用状态不能为空！',
            'Sp_ParentNo.required' => '架位编号不能为空！',

        ];

        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                $input = Input::except('_token','_method');

//                $isset = Dat_Storage::where('Sp_ParentNo',$input['Sp_ParentNo'])
////                    ->where(function ($query) use ($input){
////                        $query->where('Stor_code',$input['Stor_code'])
////                            ->orWhere('Stor_name',$input['Stor_name']);
////                    })
//                    ->get();
//                if(count($isset)>0){
//                    return back()->with('errors', '编号或名称已经被使用');
//                }

                $input['Stor_usable']=(integer)$input['Stor_usable'];
                $re = Dat_Storage::where('Stor_id',$id)->update($input);
                if ($re) {
                    return redirect('admin/datstorage');
                } else {
                    return back()->with('errors', '更新失败，请检查！');
                }
            } else {
                return back()->withErrors($validator);
            }
        } else {
            return view('admin.datstorage.edit');
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $code
     * @return \Illuminate\Http\Response
     */
    public function destroy($code)
    {

        DB::beginTransaction(); //开启事务

        try{

                $child = Dat_Storage::Where('Sp_ParentNo', $code)->get(); //得到下一级所有子节点
                $re = Dat_Storage::where('Stor_code', $code)->delete(); //删除当前节点
                if(!$re){
                    throw new \Exception("删除失败","0");
                }
                if(count($child)>0) {
                    foreach ($child as $n) {  //遍历子节点
                        $code = $n['Stor_code'];
                        $child = Dat_Storage::Where('Sp_ParentNo', $code)->get(); //得到下一级所有子节点
                        $re = Dat_Storage::where('Stor_code', $code)->delete(); //删除当前子节点
                        if(!$re){
                            throw new \Exception("删除失败","0");
                        }
                        if(count($child)>0) { //如果还能得到下一级子节点（库号）
                            foreach ($child as $n) {  //遍历二级子节点
                                $code = $n['Stor_code'];
                                $re = Dat_Storage::where('Stor_code', $code)->delete(); //删除当前子节点
                                if(!$re){
                                    throw new \Exception("删除失败","0");
                                }
                            }
                        }
                    }
                }

            DB::commit();//提交
            $data=[
                "msg" => "删除成功",
                "status" => 1
            ];
            return $data;

        }catch( \Exception $e) {
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

    public function loadrack(){
        $input = Input::all();

        $data = Dat_Storage::where('Sp_ParentNo',$input['stor_code'])->get();

        return $data;

    }

    //通过树状图添加
    public function add(){
        $input=Input::all();
//        dd($input);
        $start_code=$input['start_code'];
        $end_code=$input['end_code'];
        $pcode=$input['pcode'];

        if(strlen((string)$start_code)!=strlen((string)$end_code) || $end_code<$start_code){
            $data = [
                'status'=>0,
                'msg'=>'输入格式不正确'
            ];
            return $data;
        }

        $length = strlen((string)$start_code); //编号长度

        DB::beginTransaction(); //开启事务

        try{
            for($i=$start_code;$i<=$end_code;$i++){
                $No_code = sprintf("%0".$length."d", $i); //自动补0

                $isset = Dat_Storage::where('Sp_ParentNo',$pcode)->where('Stor_code',$No_code)->get();
                if(count($isset)>0){
                    throw new \Exception("存在已定义的库","0");
                }

                $re = Dat_Storage::create(['Stor_code'=>$No_code,'Sp_ParentNo'=>$pcode,'Stor_name'=>$No_code]);
                if(!$re){
                    throw new \Exception("添加失败","0");
                }


            }
            DB::commit();//提交
            $data=[
                "msg" => "添加完成",
                "status" => 1
            ];
            return $data;

        }catch( \Exception $e) {
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



    //新建仓库
    public function add_stor(){
        $input=Input::all();
        if($input['Stor_code']==null){
            $data = [
                'status' => 0,
                'msg' => '仓库编号不能为空',
            ];
            return $data;
        }
        if($input['Stor_name']==null){
            $data = [
                'status' => 0,
                'msg' => '仓库名称不能为空',
            ];
            return $data;
        }

        $re = Dat_Storage::where('Stor_name',$input['Stor_name'])->get();
        if(count($re)>0){
            $data = [
                'status' => 0,
                'msg' => '仓库名已被使用！',
            ];
            return $data;
        }
        $re = Dat_Storage::where('Stor_code',$input['Stor_code'])->get();
        if(count($re)>0){
            $data = [
                'status' => 0,
                'msg' => '仓库编号已被使用！',
            ];
            return $data;
        }


        $re = Dat_Storage::create(['Stor_code'=>$input['Stor_code'],'Stor_name'=>$input['Stor_name'],'Sp_ParentNo'=>0,'Stor_usable'=>1]);
        if ($re) {
            $data = [
                'status' => 1,
                'msg' => '创建成功！仓库码为'.$input['Stor_code'],
            ];

        } else {
            $data = [
                'status' => 0,
                'msg' => '创建失败！',
            ];
        }
        return $data;
    }

    //新建架位
    public function add_rack(){
        $input=Input::all();

        $start_rack=$input['start_rack'];
        $end_rack=$input['end_rack'];
        $storage=$input['storage'];

        if(strlen((string)$start_rack)!=strlen((string)$end_rack) || $end_rack<$start_rack){
            $data = [
                'status'=>0,
                'msg'=>'输入格式不正确'
            ];
            return $data;
        }

        $length = strlen((string)$start_rack); //编号长度

        DB::beginTransaction(); //开启事务

        try{
            for($i=$start_rack;$i<=$end_rack;$i++){


                $rack_code = sprintf("%0".$length."d", $i); //自动补0

                $isset = Dat_Storage::where('Sp_ParentNo',$storage)->where('Stor_code',$rack_code)->get();
                if(count($isset)>0){
                    throw new \Exception("存在已定义的架位","0");
                }

                $re = Dat_Storage::create(['Stor_code'=>$rack_code,'Sp_ParentNo'=>$storage,'Stor_name'=>$rack_code.'架']);
                if(!$re){
                    throw new \Exception("添加失败","0");
                }


            }

            DB::commit();//提交
            $data=[
                "msg" => "添加完成",
                "status" => 1
            ];
            return $data;

        }catch( \Exception $e) {
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

    //新建库位
    public function add_No(){
        $input=Input::all();

        $start_No=$input['start_No'];
        $end_No=$input['end_No'];
        $rack=$input['rack'];

        if(strlen((string)$start_No)!=strlen((string)$end_No) || $end_No<$start_No){
            $data = [
                'status'=>0,
                'msg'=>'输入格式不正确'
            ];
            return $data;
        }

        $length = strlen((string)$start_No); //编号长度

        DB::beginTransaction(); //开启事务

        try{
            for($i=$start_No;$i<=$end_No;$i++){
                $No_code = sprintf("%0".$length."d", $i); //自动补0

                $isset = Dat_Storage::where('Sp_ParentNo',$rack)->where('Stor_code',$No_code)->get();
                if(count($isset)>0){
                    throw new \Exception("存在已定义的库","0");
                }

                $re = Dat_Storage::create(['Stor_code'=>$No_code,'Sp_ParentNo'=>$rack,'Stor_name'=>$No_code.'号']);
                if(!$re){
                    throw new \Exception("添加失败","0");
                }


            }
            DB::commit();//提交
            $data=[
                "msg" => "添加完成",
                "status" => 1
            ];
            return $data;

        }catch( \Exception $e) {
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

    function find_rack($stor_code){
        if($input=Input::all()){

            isset($input['keywords'])? $keywords = $input['keywords']:$keywords='';
            $data = Dat_Storage::where('Sp_ParentNo', $stor_code)
                ->where(function ($query) use ($keywords){
                    $query->where('Stor_name','like',"%$keywords%")
                        ->orWhere('Stor_code','like',"%$keywords%");
                })->orderby('Stor_code')
                ->paginate(20);
            $data->appends(['keywords'=>$keywords])->links();

            return view('admin.datstorage.find_rack', compact('data'));
        }else {
            $data = Dat_Storage::where('Sp_ParentNo', $stor_code)->orderby('Stor_code')->paginate(20);
            return view('admin.datstorage.find_rack', compact('data'));
        }
    }

    function find_stor($stor_code){
        if($input=Input::all()){

            isset($input['keywords'])? $keywords = $input['keywords']:$keywords='';
            $data = Dat_Storage::where('Sp_ParentNo', $stor_code)
                ->where(function ($query) use ($keywords){
                    $query->where('Stor_name','like',"%$keywords%")
                        ->orWhere('Stor_code','like',"%$keywords%");
                })->orderby('Stor_code')
                ->paginate(20);
            $data->appends(['keywords'=>$keywords])->links();

            return view('admin.datstorage.find_stor', compact('data'));
        }else {
            $data = Dat_Storage::where('Sp_ParentNo', $stor_code)->orderby('Stor_code')->paginate(20);
            return view('admin.datstorage.find_stor', compact('data'));
        }
    }
}

<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Model\Admin\Box_basic_info;
use App\Http\Model\Admin\Box_inspection;
use App\Http\Model\Admin\Depart;
use App\Http\Model\Admin\SysPublic;
use Validator;
use DB;

class MaterialboxController extends CommonController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($input = Input::all()){
            isset($input['depart_id'])?$depart_id=$input['depart_id']:$depart_id=null;
            isset($input['keywords'])?$keywords=$input['keywords']:$keywords=null;
            isset($input['stock_state'])?$stock_state=$input['stock_state']:$stock_state=null;
            isset($input['use_state'])?$use_state=$input['use_state']:$use_state=null;
//            dd($use_state);
            $data = Box_basic_info::leftjoin('depart','depart.id','=','box_basic_info.depart_id')
                ->where(function ($query) use ($depart_id){
                    if($depart_id){
                        $query->where('depart.id',$depart_id);
                    }
                })
                ->where(function ($query) use ($stock_state){
                    if($stock_state){
                        $query->where('box_basic_info.stock_state',$stock_state);
                    }
                })
                ->where(function ($query) use ($use_state){
                    if($use_state != null){ //防止 $use_state=0  却不进行条件查询
                        $query->where('box_basic_info.use_state',$use_state);
                    }
                })
                ->where(function ($query) use ($keywords){
                    if($keywords){
                        $query->where('box_basic_info.box_identify','like',"%$keywords%");
                    }
                })
                ->orderby('box_basic_info.moddate','desc')
                ->select('box_basic_info.*','depart.Dpt_Name')
                ->paginate(20);
            $data->appends($input)->links();
            $depart = (new Depart)->getDepartInfo();
            $request->flash();
            return view('admin.materialbox.index',compact('depart','data'));

        }else{

            $data = Box_basic_info::leftjoin('depart','depart.id','=','box_basic_info.depart_id')
                ->orderby('box_basic_info.moddate','desc')
                ->select('box_basic_info.*','depart.Dpt_Name')
                ->paginate(20);

            $depart = (new Depart)->getDepartInfo();
            return view('admin.materialbox.index',compact('depart','data'));
        }

    }

    public function auto_code(){
        $input = Input::all();

        if(isset($input['depart_id']) || $input['depart_id']!=''){
            $depart_id=$input['depart_id'];
        }else{
            $data = [
                'box_identify'=>'',
                'msg'=>'请先选择车间',
                'status'=>-1
            ];
            return $data;
        }

        if($depart_id=='3' || $depart_id=='4'){
            $max_code= Box_basic_info::where('depart_id',$depart_id)->max('box_identify');

            if($max_code){
                $new_code = $max_code+1;
            }else{
                if($depart_id=='3'){
                    $new_code='10001';
                }else{
                    $new_code='20001';
                }//如果当前车间还没有初始识别码
            }

        }else{
            $data = [
                'box_identify'=>'',
                'msg'=>'只能选择下料车间或者锻铸车间',
                'status'=>-2
            ];
            return $data;
        }


        if($new_code){
            $data = [
                'box_identify'=>$new_code,
                'msg'=>'识别码已生成',
                'status'=>1
            ];

        }else{
            $data = [
                'box_identify'=>'',
                'msg'=>'识别码生成失败',
                'status'=>0
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
        $depart = (new Depart)->getDepartInfo();

        return view('admin.materialbox.add',compact('depart'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'box_identify' => ['required'],
            'depart_id' => ['required'],
            'inspection_interval'=>['integer','min:1','nullable'],
            'box_L'=>['integer','min:1','nullable'],
            'box_W'=>['integer','min:1','nullable'],
            'box_H'=>['integer','min:1','nullable'],
        ];
        $message = [
            'box_identify.required' => '识别码不能为空！',
            'depart_id.required' => '车间不能为空！',
            'inspection_interval.integer'=>'检验周期要输入正整数',
            'inspection_interval.min'=>'检验周期要输入正整数',
            'box_L.integer'=>'长度要输入正整数',
            'box_L.min'=>'长度要输入正整数',
            'box_W.integer'=>'宽度要输入正整数',
            'box_W.min'=>'宽度要输入正整数',
            'box_H.integer'=>'高度要输入正整数',
            'box_H.min'=>'高度要输入正整数',

        ];

        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                DB::beginTransaction(); //开启事务
                try {
                    $input = Input::except('_token');

                    $is_set_code = Box_basic_info::where('box_identify', $input['box_identify'])->first();
                    if (count($is_set_code) > 0) {
                        $request->flash();
                        throw new \Exception('识别码已被占用');;
                    }

                    $input['modman'] = session('user');
                    $input['moddate'] = time();
                    $re = Box_basic_info::create($input);


                    $input2 = Input::all(); //对于inspection表插入操作
                    $re2 = Box_inspection::create(['box_identify' => $input2['box_identify'], 'weight_tare' => $input2['box_tare'],
                        'modman' => session('user'), 'moddate' => time()]);

                    if (!$re || !$re2) {
                        throw new \Exception('插入失败');
                    }
                    DB::commit();//提交
                    return redirect('admin/materialbox');
                }catch( \Exception $e){
                    DB::rollback();//事务回滚
                    $request->flash();
                    $msg = $e->getMessage();
                    return back()->with('errors', $msg);
                }



            } else {
                $request->flash();
                return back()->withErrors($validator);
            }
        } else {
            $request->flash();
            return view('admin.materialbox.add');
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
        $data = Box_basic_info::where('id',$id)->first();
        $depart = Depart::where('id',$data['depart_id'])->first();
        return view('admin.materialbox.edit',compact('data','depart'));
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
            'box_identify' => ['required'],
            'inspection_interval'=>['integer','min:1','nullable'],
            'box_L'=>['integer','min:1','nullable'],
            'box_W'=>['integer','min:1','nullable'],
            'box_H'=>['integer','min:1','nullable'],
        ];
        $message = [
            'box_identify.required' => '识别码不能为空！',
            'inspection_interval.integer'=>'检验周期要输入正整数',
            'inspection_interval.min'=>'检验周期要输入正整数',
            'box_L.integer'=>'长度要输入正整数',
            'box_L.min'=>'长度要输入正整数',
            'box_W.integer'=>'宽度要输入正整数',
            'box_W.min'=>'宽度要输入正整数',
            'box_H.integer'=>'高度要输入正整数',
            'box_H.min'=>'高度要输入正整数',

        ];

        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                $input = Input::except('_token','_method');

                DB::beginTransaction(); //开启事务
                try{
                    $input['modman'] = session('user');
                    $input['moddate'] = time();
                    $re = Box_basic_info::where('id',$id)->update($input);
                    if (!$re) {
                        throw new \Exception("更新失败");
                    }

                   //对于inspection表插入操作
                    $re2 = Box_inspection::create(['box_identify' => $input['box_identify'], 'weight_tare' => $input['box_tare'],
                        'modman' => session('user'), 'moddate' => time()]);

                    if (!$re2) {
                        throw new \Exception("称重记录表更新失败");
                    }

                    DB::commit();//提交

                    return redirect('admin/materialbox');
                }catch ( \Exception $e){
                    DB::rollback();//事务回滚
                    $msg = $e->getMessage();
                    return back()->with('errors',$msg);

                }
            } else {

                return back()->withErrors($validator);
            }
        } else {

            return view('admin.materialbox.edit');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DB::beginTransaction(); //开启事务

        try {
            $re = Box_basic_info::where('id', $id)->delete();
            if (!$re) {
                throw new \Exception('删除失败','0');
            }

            $box_identify = Box_basic_info::where('id', $id)->first();

            $box_identify = $box_identify['box_identify'];

            $count = Box_inspection::where('box_identify', $box_identify)->get();
            if(count($count)>0) {
                $re2=Box_inspection::where('box_identify', $box_identify)->delete(); //删除box_inspection信息
                if (!$re2) {
                    throw new \Exception('删除失败','0');
                }
            }

            $data=[
                "msg" => '删除成功',
                "status" => 1
            ];



            DB::commit();//提交
            return $data;

        }catch ( \Exception $e){
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

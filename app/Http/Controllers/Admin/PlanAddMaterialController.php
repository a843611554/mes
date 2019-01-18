<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Model\Admin\Plan;
use App\Http\Model\Admin\Planexec;
use App\Http\Model\Admin\Plan_add_material;
use Illuminate\Support\Facades\Input;
use App\Http\Requests;
use App\Http\Model\Admin\Depart;
use Validator;
use DB;

class PlanAddMaterialController extends CommonController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($input=Input::except('_token')){
            isset($input['depart_id'])?$depart_id=$input['depart_id']:$depart_id=null;
            isset($input['keywords'])?$keywords=$input['keywords']:$keywords=null;
            $data =  Plan_add_material::leftjoin('plan','plan.plan_code','=','plan_add_material.plan_code')
                ->leftjoin('depart','plan.shopid','=','depart.id')
                ->leftjoin('product','plan.product_id','=','product.id')
                ->where(function ($query) use ($depart_id){
                    if($depart_id){
                        $query->where('plan.shopid',$depart_id);
                    }
                })
                ->where(function ($query) use ($keywords){
                    if($keywords){
                        $query->where('plan_add_material.plan_code','like',"%$keywords%");
                    }
                })
                ->orderby('plan_add_material.moddate','desc')
                ->select('plan.*','plan_add_material.*','depart.Dpt_Name','product.pname','product.pcode')
                ->paginate(20);
            $data->appends($input)->links();
            $request->flash();

        }else{
           $data =  Plan_add_material::leftjoin('plan','plan.plan_code','=','plan_add_material.plan_code')
                    ->leftjoin('depart','plan.shopid','=','depart.id')
                    ->leftjoin('product','plan.product_id','=','product.id')
                    ->orderby('plan_add_material.moddate','desc')
                    ->select('plan.*','plan_add_material.*','depart.Dpt_Name','product.pname','product.pcode')
                    ->paginate(20);
        }

        $depart = (new Depart)->getDepartInfo();
        return view('admin.plan_add_material.index',compact('data','depart'));
    }

    function cancel($id){ //作废
        $moddate = time();
        $modman = session('user');
        $re = Plan_add_material::where('id',$id)->update(['state'=>0,'moddate'=>$moddate,'modman'=>$modman]);

        if($re){
            $data=[
                'status'=>'1',
                'msg'=>'已作废'
            ];
        }else{
            $data=[
                'status'=>'0',
                'msg'=>'作废失败'
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
        return view('admin.plan_add_material.add');
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
            'plan_code' => ['required'],

            'add_material_num'=>['integer','min:1'],
        ];
        $message = [
            'plan_code.required' => '计划编码不能为空！',

            'add_material_num.min'=>'补料数量应大于1',
            'add_material_num.integer'=>'补料数量必须为正整数',
        ];

        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()){//如果规则验证通过

                $plan = Plan::where('plan_code',$input['plan_code'])->first();
                $order_num = $plan['order_num']; //计划数量

                //该计划已加料数量
                $add_material_sum = Plan_add_material::where('plan_code',$input['plan_code'])->where('state','1')->sum('add_material_num');

                if($input['add_material_num']+$add_material_sum>($order_num*0.1)){
                    $request->flash();
                    return back()->with('errors', '累计补料数量不能超过计划数量的10%');
                }

               $re = Plan_add_material::create(['plan_code'=>$input['plan_code'],'add_material_num'=>$input['add_material_num'],
                                                'state'=>'1','moddate'=>time(),'modman'=>session('user')]);

               if($re){
                   return redirect('admin/plan_add_material');
               }else{
                   $request->flash();
                   return back()->with('errors', '添加失败，请检查！');
               }



            } else {
                $request->flash();
                return back()->withErrors($validator);
            }
        } else {
            $request->flash();
            return view('admin.plan_add_material.add');
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
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update($id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Requests;
use App\Http\Model\Admin\Repair_alert_type;
use App\Http\Model\Admin\Dict;
use Validator;
use DB;

class AlertController extends CommonController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Repair_alert_type::leftjoin(DB::raw('(select * from t_dict where dic_cat="alert_type") as c '),DB::raw('c.dic_item_code'), '=', 'repair_alert_type.type_code')
                    ->orderby('repair_alert_type.atd_id')
                    ->select('repair_alert_type.*',DB::raw('c.dic_item_name as alert_type_name') )
                    ->paginate(20);

        $alert_type = Dict::where('dic_cat','alert_type')->get();


        return view('admin.alert.index',compact('data','alert_type'));

    }

    public function search(Request $request){
        $input = Input::except('_token');


        if(isset($input['keywords'])){
            $keywords = $input['keywords'];
        }else{
            $keywords = '';
        }

        if($input['type_code'] == ''){
            $type_code = '';
            $data = Repair_alert_type::leftjoin(DB::raw('(select * from t_dict where dic_cat="alert_type") as c '),DB::raw('c.dic_item_code'), '=', 'repair_alert_type.type_code')
                ->where('repair_alert_type.atd_id','like',"%$keywords%")
                ->orWhere('repair_alert_type.alert_typedet','like',"%$keywords%")
                ->orderby('repair_alert_type.atd_id')
                ->select('repair_alert_type.*',DB::raw('c.dic_item_name as alert_type_name') )
                ->paginate(20);


        }else{
            $type_code = $input['type_code'];

            $data = Repair_alert_type::leftjoin(DB::raw('(select * from t_dict where dic_cat="alert_type") as c '),DB::raw('c.dic_item_code'), '=', 'repair_alert_type.type_code')
                ->where('repair_alert_type.type_code',$type_code)
                ->where(function ($query) use ($keywords){
                    $query ->where('repair_alert_type.atd_id','like',"%$keywords%")
                        ->orWhere('repair_alert_type.alert_typedet','like',"%$keywords%");
                })
                ->orderby('repair_alert_type.atd_id')
                ->select('repair_alert_type.*',DB::raw('c.dic_item_name as alert_type_name') )
                ->paginate(20);

        }


        $data->appends(['keywords'=>$keywords,'type_code'=>$type_code])->links();
        $request->flash();
        $alert_type = Dict::where('dic_cat','alert_type')->get();
        return view('admin.alert.index',compact('data','alert_type'));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $alert_type = Dict::where('dic_cat','alert_type')->get();
        return view('admin.alert.add',compact('alert_type'));
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
            'type_code' => ['required'],
            'alert_typedet' => ['required'],
        ];
        $message = [
            'type_code.required' => '异常类型不能为空！',
            'alert_typedet.required' => '异常明细不能为空！',

        ];

        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                $input = Input::except('_token');

                $input['modman'] = session('user');
                $input['moddate'] = time();

                $re = Repair_alert_type::create($input);
                if ($re) {
                    return redirect('admin/alert');
                } else {
                    $request->flash();
                    return back()->with('errors', '添加失败，请检查！');
                }
            } else {
                $request->flash();
                return back()->withErrors($validator);
            }
        } else {
            $request->flash();
            return view('admin.alert.add');
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
        $alert_type = Dict::where('dic_cat','alert_type')->get();
        $field = Repair_alert_type::where('atd_id',$id)->first();
//        dd($field);
        return view('admin.alert.edit',compact('alert_type','field'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update($id)
    {
        $rules = [
            'type_code' => ['required'],
            'alert_typedet' => ['required'],
        ];
        $message = [
            'type_code.required' => '异常类型不能为空！',
            'alert_typedet.required' => '异常明细不能为空！',

        ];

        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                $input = Input::except('_token','_method');

                $input['modman'] = session('user');
                $input['moddate'] = time();

                $re = Repair_alert_type::where('atd_id',$id)->update($input);
                if ($re) {
                    return redirect('admin/alert');
                } else {

                    return back()->with('errors', '添加失败，请检查！');
                }
            } else {

                return back()->withErrors($validator);
            }
        } else {

            return view('admin.alert.edit');
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
        $re = Repair_alert_type::where('atd_id', $id)->delete();
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
}

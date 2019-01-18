<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Requests;
use App\Http\Model\Admin\Device;
use App\Http\Model\Admin\Section;
use App\Http\Model\Admin\Depart;
use App\Http\Model\Admin\Customer;
use Validator;
use DB;

class DeviceController extends CommonController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Device::leftjoin('section','section.s_id','=','device.sect_id')
                        ->leftjoin('depart','section.depart_id','depart.id')
                        ->select('device.*','section.sect_name','depart.Dpt_Name')
                        ->paginate(20);
//        dd($data);
        $depart = (new Depart())->getDepartInfo();
        return view('admin.device.index',compact('data','depart'));
    }

    public function get_section(){
        $depart_id = Input::get('depart_id');

        $data = Section::where('depart_id',$depart_id)->get();

        return $data;
    }

    public function search(Request $request){
        $input = Input::except('_token');

        isset($input['keywords']) ? $keywords = $input['keywords'] : $keywords = '';
        isset($input['depart_id']) ? $depart_id = $input['depart_id'] : $depart_id = null;
        isset($input['section']) ? $section_id = $input['section'] : $section_id = '';

        $data = Device::leftjoin('section','section.s_id','=','device.sect_id')
            ->leftjoin('depart','section.depart_id','depart.id')
            ->where(function ($query) use ($keywords){
                if($keywords) {
                    $query->where('device_code', 'like', "%$keywords%")
                            ->orWhere('device_name', 'like', "%$keywords%");
                }
            })
            ->where(function ($query) use ($depart_id){
                if($depart_id) {
                    $query->where('depart.id', '=', $depart_id);
                }
            })
            ->where(function ($query) use ($section_id){
                if($section_id) {
                    $query->where('device.sect_id', '=', $section_id);
                }
            })
            ->select('device.*','section.sect_name','depart.Dpt_Name')
            ->paginate(20);

        $data->appends($input)->links();
        $request->flash();
        $depart = (new Depart())->getDepartInfo();
        $section = Section::where('depart_id',$depart_id)->get();
        return view('admin.device.index',compact('data','depart','section'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $depart = (new Depart())->getDepartInfo();


        $vender_info = Customer::where('cust_isprov',1)->get(['cust_nameCn','cust_LinkMan','cust_tel']);
//        dd($vender_info);
        return view('admin.device.add',compact('depart','vender_info'));
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

            'sect_id' => ['required'],
            'vender' => ['required'],
            'device_code' => ['required'],
            'device_name' => ['required'],

        ];
        $message = [

            'sect_id.required' => '分区不能为空！',
            'vender.required' => '厂家不能为空！',
            'device_code.required' => '设备编号不能为空！',
            'device_name.required' => '设备名称不能为空！',

        ];

        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                $input = Input::except('_token');

                $input['modman'] = session('user');
                $input['moddate'] = time();

                $re = Device::create($input);
                if ($re) {
                    return redirect('admin/device');
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
            return view('admin.device.add');
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

        $field =  Device::leftjoin('section','section.s_id','=','device.sect_id')
            ->leftjoin('depart','section.depart_id','depart.id')
            ->where('device.id',$id)
            ->select('device.*','section.sect_name','depart.Dpt_Name')
            ->first();
        $depart = (new Depart())->getDepartInfo();

        $dep = Section::where('s_id',$field['sect_id'])->first(['depart_id']);
        $section = Section::where('depart_id',$dep['depart_id'])->get();
        $vender_info = Customer::where('cust_isprov',1)->get(['cust_nameCn','cust_LinkMan','cust_tel']);

        return view('admin.device.edit',compact('field','depart','dep','vender_info','section'));
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

            'sect_id' => ['required'],
            'vender' => ['required'],
            'device_code' => ['required'],
            'device_name' => ['required'],

        ];
        $message = [

            'sect_id.required' => '分区不能为空！',
            'vender.required' => '厂家不能为空！',
            'device_code.required' => '设备编号不能为空！',
            'device_name.required' => '设备名称不能为空！',

        ];

        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                $input = Input::except('_token','_method');

                $input['modman'] = session('user');
                $input['moddate'] = time();

                $re = Device::where('id',$id)->update($input);
                if ($re) {
                    return redirect('admin/device');
                } else {
                    $input->flash();
                    return back()->with('errors', '添加失败，请检查！');
                }
            } else {
                $input->flash();
                return back()->withErrors($validator);
            }
        } else {
            $input->flash();
            return view('admin.device.add');
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
        $re = Device::where('id', $id)->delete();
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

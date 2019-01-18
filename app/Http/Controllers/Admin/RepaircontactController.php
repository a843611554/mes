<?php

namespace App\Http\Controllers\Admin;
use App\Http\Model\Admin\Username;
use function foo\func;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Model\Admin\Repaircontact;
use App\Http\Model\Admin\Dict;
use App\Http\Model\Admin\Depart;
use App\Http\Model\Admin\Humstuff;
use App\Http\Model\Admin\Section;
use App\Http\Model\Admin\Repair_alert_type;
use App\Http\Model\Admin\Device;
use App\Http\Model\Admin\User2;
use Validator;
use DB;

class RepaircontactController extends CommonController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data=Repaircontact::leftjoin('user2','user2.id','=','repair_contact.user2_id')
            ->leftjoin('hum_stuff','hum_stuff.Stf_Id','=','user2.Stf_Id')
            ->leftjoin('depart','depart.id','=','repair_contact.depart')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="alert_type") as c '),DB::raw('c.dic_item_code'), '=', 'repair_contact.alert_type')
            ->leftjoin('repair_alert_type','repair_alert_type.atd_id','=','repair_contact.alert_typedet')
            ->leftjoin('section','section.s_id','=','repair_contact.section')
            ->leftjoin('device','device.id','=','repair_contact.device')
            ->orderby('repair_contact.user2_id')
            ->orderby('repair_contact.work_date','desc')
            ->select('repair_contact.*','user2.user_name','user2.cn_name','hum_stuff.Stf_Mobile','depart.Dpt_Name',DB::raw('c.dic_item_name as alert_type_name'),'repair_alert_type.alert_typedet',
                        'section.sect_name','device.device_name')
            ->paginate(20);
//        dd($data);

        for ($i=0 ; $i<count($data);$i++){

            $date = DB::table('hum_state')->where('user2_id', $data[$i]['user2_id'])->max('moddate'); //获得最后一次记录状态的时间

            $state = DB::table('hum_state')->where('user2_id', $data[$i]['user2_id'])->where('moddate', $date)->pluck('state');

            if(count($state)>=1) {
                $data[$i]['state'] = $state[0];
            }else{

                $data[$i]['state'] = 0;
            }
        }

        $depart = (new Depart)->getDepartInfo();

        $alert_type = Dict::where('dic_cat','alert_type')->get();

//        dd($data);
        return view('admin.repaircontact.index',compact('data','depart','alert_type'));

    }

    public function get_section(){
        $depart_id = Input::get('depart_id');

        $data = Section::where('depart_id',$depart_id)->get();

        return $data;
    }
    public function get_device(){
        $section_id = Input::get('section_id');

        $data = Device::where('sect_id',$section_id)->get();

        return $data;
    }
    public function get_alert_typedet(){
        $alert_type = Input::get('alert_type');

        $data = Repair_alert_type::where('type_code',$alert_type)->get();

        return $data;
    }

    public function search(Request $request){

        $input = Input::except('_token');

        isset($input['depart_id']) ? $depart_id = $input['depart_id']: $depart_id = null;
        isset($input['section']) ? $section = $input['section']: $section = null;
        isset($input['device']) ? $device = $input['device']: $device = null;
        isset($input['alert_type']) ?  $alert_type = $input['alert_type']: $alert_type = null;
        isset($input['keywords']) ?  $keywords = $input['keywords']: $keywords = '';
//        isset($input['alert_typedet']) ? $alert_typedet = $input['alert_typedet']: $alert_typedet = null;

        $data=Repaircontact::leftjoin('user2','user2.id','=','repair_contact.user2_id')
            ->leftjoin('hum_stuff','hum_stuff.Stf_Id','=','user2.Stf_Id')
            ->leftjoin('depart','depart.id','=','repair_contact.depart')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="alert_type") as c '),DB::raw('c.dic_item_code'), '=', 'repair_contact.alert_type')
            ->leftjoin('repair_alert_type','repair_alert_type.atd_id','=','repair_contact.alert_typedet')
            ->leftjoin('section','section.s_id','=','repair_contact.section')
            ->leftjoin('device','device.id','=','repair_contact.device')
            ->where(function ($query) use ($depart_id){
                if($depart_id) {
                    $query->where('repair_contact.depart', '=', $depart_id);
                }
            })
            ->where(function ($query) use ($section){
                if($section) {
                    $query->where('repair_contact.section', '=', $section);
                }
            })
            ->where(function ($query) use ($device){
                if($device) {
                    $query->where('repair_contact.device', '=', $device);
                }
            })
            ->where(function ($query) use ($alert_type){
                if($alert_type) {
                    $query->where('repair_contact.alert_type', '=', $alert_type);
                }
            })
            ->where(function ($query) use ($keywords){
                if($keywords) {
                    $query->where('user2.cn_name', 'like', "%$keywords%")
                    ->orWhere('user2.user_name','like',"%$keywords%");
                }
            })
            ->orderby('repair_contact.user2_id')
            ->orderby('repair_contact.work_date','desc')
            ->select('repair_contact.*','user2.user_name','user2.cn_name','hum_stuff.Stf_Mobile','depart.Dpt_Name',DB::raw('c.dic_item_name as alert_type_name'),'repair_alert_type.alert_typedet',
                'section.sect_name','device.device_name')
            ->paginate(20);

        for ($i=0 ; $i<count($data);$i++){

            $date = DB::table('hum_state')->where('user2_id', $data[$i]['user2_id'])->max('moddate'); //获得最后一次记录状态的时间

            $state = DB::table('hum_state')->where('user2_id', $data[$i]['user2_id'])->where('moddate', $date)->pluck('state');

            if(count($state)>=1) {
                $data[$i]['state'] = $state[0];
            }else{

                $data[$i]['state'] = 0;
            }
        }

        $depart = (new Depart)->getDepartInfo();
        $alert_typedet = Repair_alert_type::where('type_code',$alert_type)->get();
        $alert_type = Dict::where('dic_cat','alert_type')->get();
        $device = Device::where('sect_id',$section)->get();
//        dd($alert_typedet);
        $section = Section::where('depart_id',$depart_id)->get();

        $data->appends($input)->links();

        $request->flash();

        return view('admin.repaircontact.index',compact('data','depart','alert_type','section','alert_typedet','device'));


    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $depart = (new Depart)->getDepartInfo();
        $alert_type = Dict::where('dic_cat','alert_type')->get();

        return view('admin.repaircontact.add',compact('depart','alert_type'));

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
            'user2_id' => ['required'],
            'depart' => ['required'],
            'alert_type' => ['required'],
            'start_work' => ['required'],
            'end_work' => ['required'],
            'work_date'=>['filled'],
            'start_work_date'=>['filled'],
            'end_work_date'=>['filled'],
        ];
        $message = [
            'user2_id.required' => '员工号不能为空！',
            'depart.required' => '车间不能为空！',
            'alert_type.required' => '异常类型不能为空！',
            'start_work.required' => '上班时间不能为空！',
            'end_work.required' => '下班时间不能为空！',
            'word_date.filled' => '排班日期不能为空！',
            'start_word_date.filled' => '排班开始日期不能为空！',
            'end_word_date.filled' => '排班结束日期排班不能为空！',
        ];

        $input = Input::all();

        $validator = Validator::make($input, $rules, $message);

        if ($validator->passes()) {//如果规则验证通过
            $input = Input::except('_token');
        }else{
            $request->flash();
            return back()->withErrors($validator);
        }

        $user2_id = $input['user2_id'];
//        $depart = $input['depart'];
        isset($input['section'])?$section = $input['section']:$section=null;
//        $device = $input['device'];
//        $alert_type = $input['alert_type'];
        isset($input['alert_typedet'])?$alert_typedet = $input['alert_typedet']:$alert_typedet=null;
//        $man = Repaircontact::where('user2_id',$user2_id)->get();

//        if(count($man)>0){
//            foreach ($man as $m){
//                if($m['depart'] == $depart && $m['section'] == $section &&
//                    $m['alert_type'] == $alert_type &&$m['alert_typedet'] == $alert_typedet&&
//                    $m['device']==$device  ){
//                    $request->flash();
//                    return back()->with('errors', '该员工已负责此维修工作');
//                }
//            }
//        }
        if($input['work_date_type']=='0') { //选择了单一天数
            $input['work_date'] = strtotime($input['work_date']);
            $input['modman'] = session('user');
            $input['moddate'] = time();


            $is_set_date = Repaircontact::where('work_date', $input['work_date'])
                                            ->where('user2_id',$input['user2_id'])
                                            ->where(function ($query) use ($input){
                                                $query->whereBetween('start_work',[$input['start_work'],$input['end_work']])
                                                        ->orWhereBetween('end_work',[$input['start_work'],$input['end_work']])
                                                        ->orwhere(function($query) use ($input){
                                                            $query->where('start_work','<',$input['start_work'])
                                                                  ->where('end_work','>',$input['end_work']);
                                                        });
                                            })

                                            ->get();

            if(count($is_set_date)>0){
                return back()->with('errors', '该员工在当天已经有了排班计划');
            }

            $input= array_diff_key($input, ['work_date_type' => null]);
//            dd($input);

//        dd($input);
            $re = Repaircontact::create($input);

            if ($re) {
                return redirect('admin/repaircontact');
            } else {
                $request->flash();
                return back()->with('errors', '出错了，请重试');
            }
        }else{
            $start_work_date = strtotime($input['start_work_date']);
            $end_work_date = strtotime($input['end_work_date']);
            $work_date_type=$input['work_date_type'];
            $input= array_diff_key($input, ['work_date_type' => null,'end_work_date'=>null,'start_work_date'=>null]);
            //清除不需要插入表内的字段

            if($end_work_date<$start_work_date){
                return back()->with('errors', '结束日期要大于开始日期');
            }

            DB::beginTransaction(); //开启事务
            try{
                if($work_date_type=='1'){//连续
                    for($work_date=$start_work_date;$work_date<=$end_work_date;$work_date+=60*60*24){
                        $input['work_date']=$work_date;
                        $input['modman'] = session('user');
                        $input['moddate'] = time();

                        $is_set_date = Repaircontact::where('work_date', $input['work_date'])
                            ->where('user2_id',$input['user2_id'])
                            ->where(function ($query) use ($input){
                                $query->whereBetween('start_work',[$input['start_work'],$input['end_work']])
                                    ->orWhereBetween('end_work',[$input['start_work'],$input['end_work']])
                                    ->orwhere(function($query) use ($input){
                                        $query->where('start_work','<',$input['start_work'])
                                            ->where('end_work','>',$input['end_work']);
                                    });
                            })

                            ->get();

                        if(count($is_set_date)>0){
                            return back()->with('errors', '该员工在时间段内已经有了排班计划');
                        }


                        $re = Repaircontact::create($input);
                         if(!$re){
                             throw new \Exception('创建失败');
                         }
                    }

                }else{//隔天
                    for($work_date=$start_work_date;$work_date<=$end_work_date;$work_date+=60*60*24*2){
                        $input['work_date']=$work_date;
                        $input['modman'] = session('user');
                        $input['moddate'] = time();

                        $is_set_date = Repaircontact::where('work_date', $input['work_date'])
                            ->where('user2_id',$input['user2_id'])
                            ->where(function ($query) use ($input){
                                $query->whereBetween('start_work',[$input['start_work'],$input['end_work']])
                                    ->orWhereBetween('end_work',[$input['start_work'],$input['end_work']])
                                    ->orwhere(function($query) use ($input){
                                        $query->where('start_work','<',$input['start_work'])
                                            ->where('end_work','>',$input['end_work']);
                                    });
                            })

                            ->get();

                        if(count($is_set_date)>0){
                            return back()->with('errors', '该员工在时间段内已经有了排班计划');
                        }

                        $re = Repaircontact::create($input);
                        if(!$re){
                            throw new \Exception('创建失败');
                        }
                    }
                }
                DB::commit();//提交
                return redirect('admin/repaircontact');
            }catch (\Exception $e){
                DB::rollback();//事务回滚
                $msg = $e->getMessage();
                return back()->with('errors', $msg);
            }
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


    //批量增加排班
    public function add_scheduling($id){
        $data=Repaircontact::leftjoin('user2','user2.id','=','repair_contact.user2_id')
            ->leftjoin('hum_stuff','hum_stuff.Stf_Id','=','user2.Stf_Id')
            ->leftjoin('depart','depart.id','=','repair_contact.depart')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="alert_type") as c '),DB::raw('c.dic_item_code'), '=', 'repair_contact.alert_type')
            ->leftjoin('repair_alert_type','repair_alert_type.atd_id','=','repair_contact.alert_typedet')
            ->leftjoin('section','section.s_id','=','repair_contact.section')
            ->leftjoin('device','device.id','=','repair_contact.device')
            ->where('repair_contact.id',$id)
            ->select('repair_contact.*','user2.user_name','user2.cn_name','hum_stuff.Stf_Mobile','depart.Dpt_Name',DB::raw('c.dic_item_name as alert_type_name'),'repair_alert_type.alert_typedet',
                'section.sect_name','device.device_name')
            ->first();
        $alert_type = Dict::where('dic_cat','alert_type')->get();
        $section = Section::where('depart_id',$data['depart'])->get();
        $device = Device::where('sect_id',$data['section'])->get();
        $alert_typedet = Repair_alert_type::where('type_code',$data['alert_type'])->get();
        $depart = (new Depart)->getDepartInfo();
        return view('admin.repaircontact.add',compact('data','alert_type','section','device','alert_typedet','depart'));
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data=Repaircontact::leftjoin('user2','user2.id','=','repair_contact.user2_id')
                ->leftjoin('hum_stuff','hum_stuff.Stf_Id','=','user2.Stf_Id')
                ->leftjoin('depart','depart.id','=','repair_contact.depart')
                ->leftjoin(DB::raw('(select * from t_dict where dic_cat="alert_type") as c '),DB::raw('c.dic_item_code'), '=', 'repair_contact.alert_type')
                ->leftjoin('repair_alert_type','repair_alert_type.atd_id','=','repair_contact.alert_typedet')
                ->leftjoin('section','section.s_id','=','repair_contact.section')
                ->leftjoin('device','device.id','=','repair_contact.device')
                ->where('repair_contact.id',$id)
                ->select('repair_contact.*','user2.user_name','user2.cn_name','hum_stuff.Stf_Mobile','depart.Dpt_Name',DB::raw('c.dic_item_name as alert_type_name'),'repair_alert_type.alert_typedet',
                    'section.sect_name','device.device_name')
                ->first();
//        dd($data);
        $alert_type = Dict::where('dic_cat','alert_type')->get();
        $section = Section::where('depart_id',$data['depart'])->get();
        $device = Device::where('sect_id',$data['section'])->get();
        $alert_typedet = Repair_alert_type::where('type_code',$data['alert_type'])->get();
        $depart = (new Depart)->getDepartInfo();

        return view('admin.repaircontact.edit',compact('data','alert_type','section','device','alert_typedet','depart'));
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
            'depart' => ['required'],
            'alert_type' => ['required'],
            'start_work' => ['required'],
            'end_work' => ['required'],
            'work_date'=>['required'],


        ];
        $message = [
            'depart.required' => '车间不能为空！',
            'alert_type.required' => '异常类型不能为空！',
            'start_work.required' => '上班时间不能为空！',
            'end_work.required' => '下班时间不能为空！',
            'work_date.required' => '日期不能为空！',


        ];

        $input = Input::all();

        $validator = Validator::make($input, $rules, $message);

        if ($validator->passes()) {//如果规则验证通过
            $input = Input::except('_token','_method');
        }else{

            return back()->withErrors($validator);
        }

//        $depart = $input['depart'];
        isset($input['section'])?$section = $input['section']:$section=null;
//        $device = $input['device'];
//        $alert_type = $input['alert_type'];
        isset($input['alert_typedet'])?$alert_typedet = $input['alert_typedet']:$alert_typedet=null;
//        $man = Repaircontact::where('id',$id)->get();

//        if(count($man)>0){
//            foreach ($man as $m){
//                if($m['depart'] == $depart && $m['section'] == $section &&
//                    $m['alert_type'] == $alert_type &&$m['alert_typedet'] == $alert_typedet&&
//                    $m['device']==$device   ){
//
//                    return back()->with('errors', '该员工已负责此维修工作');
//                }
//            }
//        }
            $input['work_date'] = strtotime($input['work_date']);
            $input['modman'] = session('user');
            $input['moddate'] = time();

        $is_set_date = Repaircontact::where('work_date', $input['work_date'])
            ->where('user2_id',$input['user2_id'])
            ->where(function ($query) use ($input){
                $query->whereBetween('start_work',[$input['start_work'],$input['end_work']])
                    ->orWhereBetween('end_work',[$input['start_work'],$input['end_work']])
                    ->orwhere(function($query) use ($input){
                        $query->where('start_work','<',$input['start_work'])
                            ->where('end_work','>',$input['end_work']);
                    });
            })

            ->get();

        if(count($is_set_date)>0){
            return back()->with('errors', '该员工在时间段内已经有了排班计划');
        }
//        dd($input);
            $re = Repaircontact::where('id', $id)->update($input);

            if ($re) {
                return redirect('admin/repaircontact');
            } else {

                return back()->with('errors', '出错了，请重试');
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
        $re = Repaircontact::where('id', $id)->delete();
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

    public function add_user2(){

        $depart = (new Depart)->getDepartInfo();

        return view('admin.repaircontact.add_user2',compact('depart'));
    }

    public function find_user2(){
        $keywords = Input::get('keywords');

        $input = Input::except('_token');
        isset( $input['Dpt_DptCode'])? $depart_id=$input['Dpt_DptCode']:$depart_id=null;

        $data = Username::leftjoin('depart','depart.id','=','user2.shopid')
                       ->leftjoin('hum_stuff','hum_stuff.Stf_Id','=','user2.Stf_Id')
                        ->where(function ($query) use ($depart_id){
                                if($depart_id){
                                    $query->where('user2.shopid',$depart_id);
                                }
                            })
                        ->where(function ($query) use ($keywords){
                           $query ->where('user2.user_name','like',"%$keywords%")
                               ->orWhere('user2.cn_name','like',"%$keywords%");
                        })
                        ->select('user2.id','user2.user_name','user2.cn_name','user2.shopid','hum_stuff.Stf_Mobile','depart.Dpt_Name')->paginate(10);
        $data->appends($input)->links();
        $depart = (new Depart)->getDepartInfo();
//        dd($data);;
        return view('admin.repaircontact.add_user2',compact('data','depart'));
    }
}

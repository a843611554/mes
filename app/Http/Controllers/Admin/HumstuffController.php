<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Model\Admin\Humstuff;
use App\Http\Model\Admin\Depart;
use Illuminate\Support\Facades\Input;
use Illuminate\Validation\Rules\In;
use Validator;

class HumstuffController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $data = Humstuff::leftjoin('depart','hum_stuff.Dpt_DptCode','=','depart.id')
            ->select('depart.Dpt_Name','hum_stuff.*')
            ->paginate(20);

//        dd($data);
        return view('admin.humstuff.index',compact('data'));
    }

    public function search(){
        $input = Input::all();


        if ($input['keywords'] <> '') {
            $keywords = $input['keywords'];
        } else {
            $keywords = '';
        }

        $data = Humstuff::leftjoin('depart','hum_stuff.Dpt_DptCode','=','depart.id')
            ->where('Stf_Id','like',"%$keywords%")
            ->orWhere('Stf_NameCn','like',"%$keywords%")
            ->orWhere('Stf_nameEn','like',"%$keywords%")
            ->select('depart.Dpt_Name','hum_stuff.*')
            ->paginate(20);

        $data->appends(['keywords'=>$keywords])->links();

        return view("admin.humstuff.index",compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $depart = (new Depart)->getDepartInfo();
        return view('admin.humstuff.add',compact('depart'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
//        dd($input = Input::all());
        Validator::extend('mobile', function($attribute, $value, $parameters)
        {
            return preg_match('/^1[34578][0-9]{9}$/', $value);
        });
        $rules = [
            'Stf_NameCn' => 'required|max:10|string',
            'Stf_sex'=>'required|in:F,M',
            'Dpt_DptCode' => 'required',
//            'Stf_Photo' => 'required',
            'Stf_Mobile' => 'required|mobile',
//            'Stf_HomePhone' => 'nullable|mobile',
//            'Stf_Brithday' => 'required|date',
//            'Stf_NaPlace' => 'required|string',
//            'Stf_Folk' => 'required|string',
//            'Sto_BookId' => 'required|in:农业,非农业',
//            'Stf_CarId' => 'required',
//            'Stf_Adress' => 'required',
//            'Sto_Marriage' => 'required|in:0,1',
//            'Stf_InFac' => 'required|date',
            'Wt_WorkType' => 'required|in:0,1',
//            'Stf_Wagebase' => 'required',
            'Stf_OS' => 'required|in:0,1',
//            'Stf_Email' => 'required|email',
//            'Edu_Level' => 'required',
//            'Deg_Degree' => 'present',
//            'Sto_GradSchool' => 'present',
//            'Sto_GradDate' => 'present',
//            'Stf_SubjectMain' => 'present',
//            'Stf_SubjectSub' => 'present',
//            'Sto_OldCommpany' => 'present',
//            'Sto_OldDuty' => 'present',
            'Stf_CheckedBit' => 'required|in:0,1',

        ];
        $message1 = [
            "required" => ":attribute 不能为空！",
            "present" => ":attribute 字段不存在！",
            "min" => ":attribute 至少为 :min 位！",
            "max" => ":attribute 不能超过 :max 位！",
            "email"=>":attribute 格式不正确！",
            "string"=>":attribute 只能输入字符",
            "in"=>":attribute 必须选择！",
            "date"=>":attribute 日期格式不正确",
            "mobile"=>":attribute 格式不正确"
        ];
        $message2 =[
            "Stf_NameCn"=>"姓名",
            "Stf_sex"=>"性别",
            "Dpt_DptCode"=>"所属部门",
//            "Stf_Photo"=>"员工照片",
            "Stf_Mobile"=>"手机号",
//            "Stf_HomePhone"=>"家庭电话",
//            "Stf_Brithday"=>"出生日期",
//            "Stf_NaPlace"=>"籍贯",
//            "Stf_Folk"=>"民族",
//            "Sto_BookId"=>"户口性质",
//            "Stf_CarId"=>"身份证号",
//            "Stf_Adress"=>"家庭住址",
//            "Sto_Marriage"=>"婚姻状态",
//            "Stf_InFac"=>"进入单位时间",
            "Wt_WorkType"=>"工作性质",
//            "Stf_Wagebase"=>"基本工资",
            "Stf_OS"=>"系统操作权限",
//            "Stf_Email"=>"电子邮件",
//            "Edu_Level"=>"学历",
//            "Deg_Degree"=>"学位",
//            "Sto_GradSchool"=>"毕业学校",
//            "Sto_GradDate"=>"毕业时间",
//            "Stf_SubjectMain"=>"主修专业",
//            "Stf_SubjectSub"=>"辅修专业",
//            "Sto_OldCommpany"=>"原工作单位",
//            "Sto_OldDuty"=>"原工作职称",
            "Stf_CheckedBit"=>"是否考勤",
        ];

        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules,$message1,$message2);

            if ($validator->passes()) {//如果规则验证通过
                $input = Input::except('_token');
                //dd($input);

                $input['Sto_EnterDate']=time();
                $input['ModDate']=time();
                $input['ModMan']=session('user');
                $re = Humstuff::create($input);
                if ($re) {
                    return redirect('admin/humstuff');
                } else {

                    return back()->with('errors', '添加失败，请检查！');
                }
            } else {
                $request->flash();
                return back()->withErrors($validator);
            }
        } else {
            return view('admin.humstuff.add');
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
        $field = Humstuff::where('Stf_Id',$id)->first();
        $depart = (new Depart)->getDepartInfo();
        return view('admin.humstuff.edit',compact('field','depart'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        Validator::extend('mobile', function($attribute, $value, $parameters)
        {
            return preg_match('/^1[34578][0-9]{9}$/', $value);
        });
        $rules = [
            'Stf_NameCn' => 'required|max:10|string',
            'Stf_sex'=>'required|in:F,M',
            'Dpt_DptCode' => 'required',
//            'Stf_Photo' => 'required',
            'Stf_Mobile' => 'required|mobile',
//            'Stf_HomePhone' => 'nullable|mobile',
//            'Stf_Brithday' => 'required|date',
//            'Stf_NaPlace' => 'required|string',
//            'Stf_Folk' => 'required|string',
//            'Sto_BookId' => 'required|in:农业,非农业',
//            'Stf_CarId' => 'required',
//            'Stf_Adress' => 'required',
//            'Sto_Marriage' => 'required|in:0,1',
//            'Stf_InFac' => 'required|date',
            'Wt_WorkType' => 'required|in:0,1',
//            'Stf_Wagebase' => 'required',
            'Stf_OS' => 'required|in:0,1',
//            'Stf_Email' => 'required|email',
//            'Edu_Level' => 'required',
//            'Deg_Degree' => 'present',
//            'Sto_GradSchool' => 'present',
//            'Sto_GradDate' => 'present',
//            'Stf_SubjectMain' => 'present',
//            'Stf_SubjectSub' => 'present',
//            'Sto_OldCommpany' => 'present',
//            'Sto_OldDuty' => 'present',
            'Stf_CheckedBit' => 'required|in:0,1',

        ];
        $message1 = [
            "required" => ":attribute 不能为空！",
            "present" => ":attribute 字段不存在！",
            "min" => ":attribute 至少为:min位！",
            "max" => ":attribute 不能超过:max位！",
            "email"=>":attribute 格式不正确！",
            "string"=>":attribute 只能输入字符",
            "in"=>":attribute 必须选择！",
            "date"=>":attribute 日期格式不正确",
            "mobile"=>":attribute 格式不正确"
        ];
        $message2 =[
            "Stf_NameCn"=>"姓名",
            "Stf_sex"=>"性别",
            "Dpt_DptCode"=>"所属部门",
//            "Stf_Photo"=>"员工照片",
            "Stf_Mobile"=>"手机号",
//            "Stf_HomePhone"=>"家庭电话",
//            "Stf_Brithday"=>"出生日期",
//            "Stf_NaPlace"=>"籍贯",
//            "Stf_Folk"=>"民族",
//            "Sto_BookId"=>"户口性质",
//            "Stf_CarId"=>"身份证号",
//            "Stf_Adress"=>"家庭住址",
//            "Sto_Marriage"=>"婚姻状态",
//            "Stf_InFac"=>"进入单位时间",
            "Wt_WorkType"=>"工作性质",
//            "Stf_Wagebase"=>"基本工资",
            "Stf_OS"=>"系统操作权限",
//            "Stf_Email"=>"电子邮件",
//            "Edu_Level"=>"学历",
//            "Deg_Degree"=>"学位",
//            "Sto_GradSchool"=>"毕业学校",
//            "Sto_GradDate"=>"毕业时间",
//            "Stf_SubjectMain"=>"主修专业",
//            "Stf_SubjectSub"=>"辅修专业",
//            "Sto_OldCommpany"=>"原工作单位",
//            "Sto_OldDuty"=>"原工作职称",
            "Stf_CheckedBit"=>"是否考勤",
        ];

        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules,$message1,$message2);

            if ($validator->passes()) {//如果规则验证通过
                $input = Input::except('_token','_method');
                //dd($input);

                $input['ModDate']=time();
                $input['ModMan']=session('user');
                $input['Stf_InFac'] = strtotime($input['Stf_InFac']);
                $input['Sto_GradDate'] = strtotime($input['Sto_GradDate']);
                $input['Stf_Regular'] = strtotime($input['Stf_Regular']);
                $re = Humstuff::where('Stf_Id',$id)->update($input);
                if ($re) {
                    return redirect('admin/humstuff');
                } else {

                    return back()->with('errors', '修改失败，请检查！');
                }
            } else {
                $request->flash();
                return back()->withErrors($validator);
            }
        } else {
            return view('admin.humstuff.add');
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
        $re = Humstuff::where('Stf_Id', $id)->delete();
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
    //保存上传的文件
    public function upload_stf_photo(Request $request){
        $file = $request->file('file');
        if ($file->isValid()) {
            $entension = $request->file('file')->getClientOriginalExtension();
            $image = $request->file('file');
            $newName = date('YmdHis') . mt_rand(100, 999) . '.' . $entension;
            $image->move(public_path('stuff_photo'), $newName);

            $df = response()->json(['pstate' => 'success', 'filepath' => 'stuff_photo/' . $newName]);

        }
        return $df;
    }
    //删除上传的文件
    public function del_stf_photo(){
        $src = Input::get('src');

        $path = public_path($src);

        $re = unlink($path);

        if($re){
            $data = [
                'status' => 1,
                'msg' => '照片已删除！'
            ];
        }else{
            $data = [
                'status' => 0,
                'msg' => '删除失败！'
            ];
        }

        return $data;
    }
}

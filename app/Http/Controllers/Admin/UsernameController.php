<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Admin\Company;
use App\Http\Model\Admin\Groupdet;
use App\Http\Model\Admin\Depart;
use App\Http\Model\Admin\Username;
use App\Http\Model\Admin\Workcenter;
use App\Http\Model\Admin\Humstuff;
use App\User;
use  Validator;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Http\Requests;
use Illuminate\Support\Facades\Input;


class UsernameController extends CommonController
{
    public function index()
    {
        $username = Username::leftjoin('company', 'user2.company_id', '=', 'company.id')
            ->leftjoin('workcenter', 'user2.wc_id', '=', 'workcenter.id')
            ->leftjoin('depart', 'user2.shopid', '=', 'depart.id')
            ->where('user2.pstate',1)->orderBy('user2.id', 'desc')
            ->select('user2.*','company.company_name','workcenter.wc_name','depart.Dpt_Name')
            ->paginate(30);
//dd($username);
        return view('admin.username.userlist')->with('data', $username);
    }

    public function edit($user_id)
    {
        $data = Company::all();
        $work = Workcenter::all();
        $field = Username::find($user_id);
        $workshop = (new Depart)->getDepartInfo();
        return view('admin.username.edit', compact('field', 'data', 'work', 'workshop'));
    }

    public function update($user_id)
    {
     //   echo $user_id;
  //      $input = Input::all();
        $input = Input::except('_token', '_method');
   //     dd($input);
        if ($input['user_pass'] != '' || $input['user_pass_confirmation'] != '') {
            $rules = [
                'user_pass' => 'required|confirmed|between:6,20'
            ];
            $message = [
                'user_pass.confirmed' => '用户密码与确认密码不一致',
                'user_pass.required' => '用户密码不能为空',
                'user_pass.between' => '用户密码在6到20位之间'
            ];
            $validator = Validator::make($input, $rules, $message);
            if ($validator->passes()) {
                $groupuser = $input['groupuser'];
                $input = Input::except('_token', '_method', 'user_pass_confirmation','groupuser');

                if (Input::has('isgroup')) {
                    $input['isgroup'] = '1';
                    $input['shop_role']='1';//如果是组用户一定是登录用户；
                } else {
                    $input['isgroup'] = '0';
                }

                $input['password']=bcrypt($input['user_pass']);
                $up = Username::where('id', $user_id)->update($input);
                if ($input['isgroup'] == 1 and $groupuser!='') {
                    $det_res = $this->groupuseradd($input['user_name'], $groupuser);
                    if ($det_res) {
                        return redirect('admin/username');
                    } else {
                        return back()->withErrors('明细数据添加失败！');
                    }
                }
             //   dd($up);
                if ($up) {
                    return redirect('admin/username');
                } else {
                    return back()->withErrors('主数据添加失败！');
                }
            } else {
                return back()->withErrors($validator);
            }

        } else {

            $groupuser = $input['groupuser'];
            $input = Input::except('_token', '_method', 'user_pass_confirmation','user_pass','groupuser');

            if (Input::has('isgroup')) {
                $input['isgroup'] = '1';
                $input['shop_role']='1';//如果是组用户一定是登录用户；
            } else {
                $input['isgroup'] = '0';
            }
            //  dd($input);
            $up = Username::where('id', $user_id)->update($input);
            if ($input['isgroup'] == 1 and $groupuser!='') {
                $det_res = $this->groupuseradd($input['user_name'], $groupuser);
                if ($det_res) {
                    return redirect('admin/username');
                } else {
                    return back()->withErrors('明细数据添加失败！');
                }
            }
            //   dd($up);
            if ($up) {
                return redirect('admin/username');
            }



        }

    }

    public function destroy($user_id)
    {
        $re = Username::where('id', $user_id)->update(['pstate' => 0]);

        if ($re) {
            $data = [
                'status' => 0,
                'msg' => '用户删除成功！',
            ];
        } else {
            $data = [
                'status' => 1,
                'msg' => '用户删除失败，请稍后重试！',
            ];
        }
        return $data;
    }

    public function create()
    {
        $company = Company::all();
        $workcenter = Workcenter::all();
        $workshop = (new Depart)->getDepartInfo();
        return view('admin.username.useradd')->with('data', $company)->with('work', $workcenter)->with('workshop', $workshop);
    }

    public function store()
    {
        if ($input = Input::except('_token')) {
            $rules = [
                'user_name' => 'required',
                'user_pass' => 'required|between:6,20|confirmed',
                'company_id' => 'required',
                'wc_id' => 'required'

            ];
            $message = [
                'user_name.required' => '用户名不能为空',
                'user_pass.required' => '用户密码不能为空',
                'user_pass.between' => '用户密码6到20位之间',
                'user_pass.confirmed' => '用户密码与确认密码不一致',
                'wc_id.required' => '工作中心不能为空',
                'company_id.required' => '公司不能为空',
            ];
            $Validator = Validator::make($input, $rules, $message);
            if ($Validator->passes()) {
                $groupuser = $input['groupuser'];
                $inputs = Input::except('_token', 'user_pass_confirmation', 'groupuser');
                if (Input::has('isgroup')) {
                    $inputs['isgroup'] = '1';

                } else {
                    $inputs['isgroup'] = '0';
                }
                $inputs['pstate'] = 1;
                $veruser = Username::where('user_name', $inputs['user_name'])->get();
                //           dd($veruser);
                if ($veruser->isempty()) {
                    $inputs['password'] = bcrypt($input['user_pass']);
                //    dd($inputs);
                    $re = Username::create($inputs);
                 //   $token=  $re->createToken('MyApp')->accessToken;
                    if ($inputs['isgroup'] == 1) {
                        $det_res = $this->groupuseradd($inputs['user_name'], $groupuser);
                        if ($det_res) {
                            return redirect('admin/username');
                        } else {
                            return back()->withErrors('明细数据添加失败！');
                        }
                    }
                    if ($re) {
                        return redirect('admin/username');
                    } else {
                        return back()->withErrors('主数据添加失败！');
                    }
                } else {
                    return back()->withErrors('用户名已存在');
                }


            } else {
                return back()->withErrors($Validator);
            }

        }

    }

    public function getuserdata($userkey)
    {
        if ($userkey == '-1') {

            $groupuser = Username::where('isgroup', '<>', '1')->select('user_name', 'cn_name')->get();

        }else{

            $groupuser = Username::where('isgroup', '<>', '1')
                ->Where(function ($query) use ($userkey) {
                    $query->where('user_name','like', '%' . $userkey. '%')
                        ->orwhere('cn_name', 'like', '%' . $userkey . '%');
                })->select('user_name', 'cn_name')->get();

        }
        $detuser = $groupuser->tojson();

        return $detuser;
    }

    //添加组用户明细人员  丁峰  3-09
    public function groupuseradd($gmanager, $guser)
    {
        $status = false;
        //       $data = DB::table('user2_groupdet')->where('group_user', $gmanager)->whereRaw('FIND_IN_SET(duser_name, "' . $guser . '")')->get();
        $arruser = explode(',', $guser);
        DB::table('user2_groupdet')->where('group_user', $gmanager)->delete();

        foreach ($arruser as $v) {

            $db = DB::table('user2_groupdet')->insert([
                'group_user' => $gmanager,
                'duser_name' => $v,
                'pstate' => '1',
                'createman' => session('user'),
                'createdate' => time(),
            ]);
            if ($db) {
                $status = true;
            }

        }

        return $status;
    }

    //用户查询
    public function user2key()
    {
        $input = Input::all();
        $keywords=$input['keywords'];
        $username = Username::leftjoin('company', 'user2.company_id', '=', 'company.id')->leftjoin('workcenter', 'user2.wc_id', '=', 'workcenter.id')->leftjoin('depart', 'user2.shopid', '=', 'depart.id')
            ->where('user2.pstate',1)
            ->Where(function ($query) use ($keywords) {
                $query->where('user_name','like', '%' . $keywords. '%')
                    ->orwhere('cn_name', 'like', '%' . $keywords . '%');
            })->select('user2.*', 'company.company_name','workcenter.wc_name','depart.Dpt_Name')->orderBy('id', 'desc')->paginate(30);

        return view('admin.username.userlist')->with('data', $username);
    }

//普通用户修改个人密码接口

    public function modcomuserpass()
    {
        $df = '{"errorcode":"500","success":"false"}';//原密码错误哦
        $rules = [
            'user_npass' => ['required', 'min:6', 'max:20'],
            // 'password_c'=> ['required','min:6','max:20','regex:/^[a-zA-Z0-9!"#$%&\'()*+,-.\/:;<=>?^_`~{|}\]]+$/','confirmed'],
        ];
        $message = [
            'user_npass.required' => '密码不能为空！',
            'user_npass.min' => '密码字符要大于6！',
        ];
        if ($input = Input::all()) {
            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                $user = Username::where('user_name', $input['user_name'])->where('pstate', 1)->first();
                $_password =$user->user_pass;
                if ($input['user_opass'] == $_password) {
                    $user->user_pass = $input['user_npass'];
                    $user->password=bcrypt($input['user_npass']);
                    $user->update();
                    $df = '{"errorcode":"200","success":"true"}';//组用户添加成功

                } else {
                    $df = '{"errorcode":"201","success":"false"}';//原密码错误哦
                }
            } else {
                $df = '{"errorcode":"202","success":"false"}';//密码不符合规则
                // echo 'no';
            }
            return $df;
        }else{
            return $df;
        }


    }

//组用户添加用户弹出窗体使用
    public function searchuser($user_id)
    {
        $name=Username::where('id',$user_id)->first();
        $userid=$user_id;
        $data=Groupdet::join('user2','user2_groupdet.duser_name','=','user2.user_name')->where('group_user','=',$name['user_name'])->get();
        $group='';
        return view('admin.username.searchuser',compact('data','group','userid'));
    }

    public function finduser($user_id)
    {
        $userid=$user_id;
        $username=Username::where('id',$userid)->first();
        $name=$username['user_name'];
        $keywords=$_POST['keywords'];
        $data=Groupdet::join('user2','user2_groupdet.duser_name','=','user2.user_name')->where('group_user','=',$name)->get();
        $d=Groupdet::where('group_user','=',$name)->pluck('duser_name')->toArray();
        $g=Username::where('user_name','like','%'.$keywords.'%')->where('pstate', 1)->orderBy('id','desc')->pluck('user_name')->toArray();
        $f=array_diff($g,$d);
        $r=array_values($f);
        $e=Username::whereIn('user_name',$f)->get()->pluck('cn_name')->toArray();
        $u=array_reverse($e);
        $group=Username::where('user_name','like','%'.$keywords.'%')->where('pstate', 1)->orderBy('id','desc')->get();
        return view('admin.username.searchuser',compact('data','group','userid'))->with('r',$r)->with('u',$u);

    }


    //选择员工
    public function find_humstuff(){
        if($input = Input::all()){

            isset($input['keywords'])?$keywords=$input['keywords']:$keywords=null;

            $data=Humstuff::where(function ($query) use ($keywords){
                $query->where('Stf_NameCn','like',"%$keywords%");
            })->paginate(20);

            return view('admin.username.find_humstuff',compact('data'));
        }else{
            return view('admin.username.find_humstuff');
        }


    }

}

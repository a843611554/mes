<?php

namespace App\Http\Controllers\Admin;
use App\Http\Model\Admin\User;
use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Input;

require_once resource_path().'/org/code/Code.class.php';
session_start();
class LoginController extends CommonController
{
    public function login()
    {

       if ($input=Input::all()){
           $code = new \Code;
           $_code= $code->get();

        if (strtoupper($input['code'])!=$_code){
            return back()->with('msg','验证码错误！');
        }
           $user=User::leftjoin('company','user.company_id','=','company.id')->where('user_name',$input['user_name'])->first();
           if ($user->user_name != $input['user_name'] || Crypt:: decrypt($user->user_pass)!=$input['user_pass']){
               return back()->with('msg','用户名密码错误！');
           }

           session(['user'=>$user->user_name,'company'=>$user->company_id]);

           return redirect('admin/index');
       }else{

           session(['user'=>null]);
           return view('admin/login');
       }

    }

    public function code()
    {
		//echo resource_path();
        $code = new \Code;
        $code->make();
    }

    public function getcode()
    {
       // print_r($_SESSION);
        $code = new \Code;
        echo $code->get();
    }

    public function quit()
    {
    session(['user'=>null]);
    return redirect('admin/login');
    }



}

<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Admin\Company;
use App\Http\Model\Admin\User;
use Illuminate\Support\Facades\Crypt;
use  Validator;
use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\Input;

class IndexController extends CommonController
{
    //
    public function index()
    {

        return view('admin/index');
    }

    public function info()
    {
        return view('admin/info');
    }

    public function pass()
    {
        $rules = [
            'password' => ['required', 'min:6', 'max:20', 'regex:/^[a-zA-Z0-9!"#$%&\'()*+,-.\/:;<=>?^_`~{|}\]]+$/', 'confirmed'],
            // 'password_c'=> ['required','min:6','max:20','regex:/^[a-zA-Z0-9!"#$%&\'()*+,-.\/:;<=>?^_`~{|}\]]+$/','confirmed'],
        ];
        $message = [
            'password.required' => '密码不能为空！',
            'password.min' => '密码字符要大于6！',
            'password.confirmed' => '密码不一致',
        ];
        if ($input = Input::all()) {
            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                $user = User::where('user_name',session('user'))->first();
                $_password = Crypt::decrypt($user->user_pass);
                if ($input['password_o'] == $_password) {
                    $user->user_pass = Crypt::encrypt($input['password']);
                    $user->update();
                    // echo "<script>alert('密码更新成功！')</script>";
                    return back()->with('errors', '密码更新成功！');

                } else {
                    return back()->with('errors', '原密码错误！');
                }
            } else {
                return back()->withErrors($validator);
                // echo 'no';
            }
        } else {

            return view('admin/pass');
        }

    }
//更改key以后数据库密码同时需要更新，此函数为更新admin密码
    public function test()
    {
        $user = User::first();
        $user->user_pass = Crypt::encrypt('123456');
        $user->update();
        echo('ok');
}
    public function pstate()
    {
        $pstate=Company::get('pstate');
        dd($pstate);
    }

}

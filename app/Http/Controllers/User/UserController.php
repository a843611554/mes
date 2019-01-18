<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Model\User;
use Validator;
use DB;
class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = User::orderBy('user_id', 'asc')->get();
//        $data = $data->toArray();


        return view("user.index")->with("data",$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view("user.add");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'username' => 'required|unique:user|max:12',
            'password' => 'required|min:6',
        ]);
//        dump($request->all());
        $user = new User;
        $user->username =$request->get("username");
        $user->password =$request->get("password");

        if ($user->save()) {
            return redirect('/user'); // 保存成功，跳转到 用户信息 页
        } else {
            // 保存失败，跳回页面，保留用户的输入，并给出提示
            return redirect()->back()->withInput()->withErrors();
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
        return"显示id为".$id."的用户";
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = User::find($id)->toarray();
        return view("user.edit")->with("data",$data);
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

        $user = User::find($id);

        $user->username = $request->get("username");

        if ($user->save()) {
            return redirect('/user')->withErrors("修改成功"); // 保存成功，跳转到 用户信息 页
        } else {
            // 保存失败，跳回来路页面，保留用户的输入，并给出提示
            return redirect()->back()->withInput()->withErrors('修改失败！');
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
        if(User::find($id)->delete()){
            return redirect()->back()->withInput()->withErrors('删除成功！');
        }else{
            return redirect()->back()->withInput()->withErrors('删除失败！');
        }


    }
}

<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Admin\Mobile;
use App\Http\Model\Admin\Template;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Requests;
use Validator;
use DB;
class MobileController extends CommonController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $data = Mobile::leftjoin('sms_template','sms_mobile.temp_id','=','sms_template.id')
            ->select('sms_mobile.*','sms_template.temp_name')->orderBy('id', 'desc')->paginate(8

            );
        return view("admin.mobile.index")->with('data', $data);

    }
    public function search()
    {

        $input = Input::all();


        if ($input['keywords'] <> '') {
            $keywords = $input['keywords'];
        } else {
            $keywords = '';
        }

        $data = Mobile::leftjoin('sms_template','sms_mobile.temp_id','=','sms_template.id')
            ->select('sms_mobile.*','sms_template.temp_name')
            ->where('sms_mobile.mobile','like',"%$keywords%")
            ->orWhere('sms_template.temp_name','like',"%$keywords%")
            ->orderBy('id', 'desc')->paginate(8);

        $data->appends(['keywords' => $keywords])->links();

        return view("admin.mobile.index")->with('data', $data);




    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data = Template::all();
        return view('admin/mobile/add')->with("data",$data);
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
            'mobile' => ['required'],
            'hum_name' => ['required'],
            'temp_id' => ['required']


        ];
        $message = [
            'mobile.required' => '电话不能为空！',
            'hum_name.required' => '姓名不能为空！',
            'temp_id.required' => '板块不能为空！'

        ];

        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                $input = Input::except('_token');
                //dd($input);
                $re = Mobile::create($input);
                if ($re) {
                    return redirect('admin/mobile');
                } else {
                    return back()->with('errors', '添加失败，请检查！');
                }
            } else {
                return back()->withErrors($validator);
            }
        } else {
            return view('admin.mobile.add');
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

        $field = Mobile::leftjoin('sms_template','sms_mobile.temp_id','=','sms_template.id')
            ->select('sms_mobile.*','sms_template.temp_name')
            ->where("sms_mobile.id",'=',$id)
            ->first();

        $temp = Template::all();

        return view('admin.mobile.edit', compact('field','temp'));
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

        $input = Input::except('_method', '_token');
        $re = Mobile::where('id', $id)->update($input);

        if ($re) {
            return redirect('admin/mobile');
        } else {
            return back()->with('errors', '更新失败，请检查！');
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
        $re = Mobile::where('id', $id)->delete();
        if ($re) {
            $data = [
                'status' => 0,
                'msg' => '电话删除成功！',
            ];

        } else {
            $data = [
                'status' => 1,
                'msg' => '电话删除失败！',
            ];


        }
        return $data;
    }
}


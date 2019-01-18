<?php

namespace App\Http\Controllers\Admin;

use function foo\func;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Model\Admin\Section;
use App\Http\Model\Admin\Depart;
use Validator;

class SectionController extends CommonController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Section::leftjoin('depart','section.depart_id','=','depart.id')
                ->select('depart.Dpt_Name','section.*')->paginate(20);

        $depart = (new Depart)->getDepartInfo();
        return view('admin.section.index',compact('data','depart'));
    }
    public function search(Request $request)
    {
        $input = Input::all();
        if ($input['keywords'] <> '') {
            $keywords = $input['keywords'];
        } else {
            $keywords = '';
        }
        if($input['depart_id'] == ''){
            $depart_id = '';
            $data = Section::leftjoin('depart','section.depart_id','=','depart.id')
                ->where('s_id','like',"%$keywords%")
                ->orWhere('sect_name','like',"%$keywords%")
                ->select('depart.Dpt_Name','section.*')->paginate(20);

        }else{
            $depart_id = $input['depart_id'];

            $data = Section::leftjoin('depart','section.depart_id','=','depart.id')
                ->where('depart_id',$depart_id)
                ->where(function ($query) use ($keywords){
                    $query->where('s_id','like',"%$keywords%")
                        ->orWhere('sect_name','like',"%$keywords%");
                })
                ->select('depart.Dpt_Name','section.*')->paginate(20);
        }


        $data->appends(['keywords'=>$keywords,'depart_id'=>$depart_id])->links();
        $depart = (new Depart)->getDepartInfo();
        $request->flash();
        return view('admin.section.index',compact('data','depart'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $depart = (new Depart)->getDepartInfo();
        return view('admin.section.add',compact('depart'));
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
            'depart_id' => ['required'],
            'sect_name' => ['required'],
        ];
        $message = [
            'depart_id.required' => '车间不能为空！',
            'sect_name.required' => '区域名称不能为空！',

        ];

        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                $input = Input::except('_token');

                $input['modman'] = session('user');
                $input['moddate'] = time();

                $re = Section::create($input);
                if ($re) {
                    return redirect('admin/section');
                } else {
                    return back()->with('errors', '添加失败，请检查！');
                }
            } else {
                return back()->withErrors($validator);
            }
        } else {
            return view('admin.section.add');
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

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $depart = (new Depart)->getDepartInfo();
        $field = Section::where('s_id',$id)->first();
        return view('admin.section.edit',compact('depart','field'));

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
            'depart_id' => ['required'],
            'sect_name' => ['required'],
        ];
        $message = [
            'depart_id.required' => '车间不能为空！',
            'sect_name.required' => '区域名称不能为空！',

        ];

        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                $input = Input::except('_token','_method');

                $input['modman'] = session('user');
                $input['moddate'] = time();

                $re = Section::where('s_id',$id)->update($input);
                if ($re) {
                    return redirect('admin/section');
                } else {
                    return back()->with('errors', '添加失败，请检查！');
                }
            } else {
                return back()->withErrors($validator);
            }
        } else {
            return view('admin.section.edit');
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
        $re = Section::where('s_id', $id)->delete();
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

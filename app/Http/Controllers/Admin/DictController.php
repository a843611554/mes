<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Admin\Dict;
use App\Http\Model\Admin\Navs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Requests;
use Validator;
use DB;

class DictController extends CommonController
{
    //
    public function index()
    {
        //   $data = Category::tree();
         $data = Dict::orderBy('dic_order', 'asc')->paginate(20);
      //  $data = DB::table('Navs')->orderBy('nav_order', 'desc')->get();
        return view('admin.dict.index')->with('data', $data);
    }

    public function changeorder()
    {
        $input = Input::all();
        $link = Dict::find($input['dic_id']);
        $link->dic_order = $input['dic_order'];
        $re = $link->update();
        if ($re) {
            $data = [
                'status' => 0, 'msg' => '导航排序更新成功！'
            ];
        } else {
            $data = [
                'status' => 1, 'msg' => '导航排序更新失败，请检查！'
            ];
        }
        return $data;
    }


    public function create()
    {

        return view('admin/dict/add');
    }

//post 方法用于添加分类提交
    public function store()
    {

        $rules = [
            'dic_cat' => ['required'],
            'dic_cat_name' => ['required'],
            'dic_item_code' => ['required'],
            'dic_item_name' => ['required'],
            // 'password_c'=> ['required','min:6','max:20','regex:/^[a-zA-Z0-9!"#$%&\'()*+,-.\/:;<=>?^_`~{|}\]]+$/','confirmed'],
        ];
        $message = [
            'dic_cat.required' => '类别编号不能为空！',
            'dic_cat_name.required' => '类别名称不能为空！',
            'dic_item_code.required' => '项目编号不能为空！',
            'dic_item_name.required' => '项目名称不能为空！',
        ];
        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                $input = Input::except('_token');
                //dd($input);
                $re = Dict::create($input);
                if ($re) {
                    return redirect('admin/dict');
                } else {
                    return back()->with('errors', '添加失败，请检查！');
                }
            } else {
                return back()->withErrors($validator);
            }
        } else {
            return view('admin/dict/add');
        }

    }


//delete admin/link/{link}删除函数
    public function destroy($nav_id)
    {
        $re = Dict::where('dic_id', $nav_id)->delete();
        if ($re) {
            $data = [
                'status' => 0,
                'msg' => '词典删除成功！',
            ];
            //   return redirect('admin/category');
        } else {
            $data = [
                'status' => 1,
                'msg' => '导航删除失败！',
            ];

            //  return back()->with('errors', '删除失败，请稍后再试！');
        }
        return $data;
    }

//put admin/link/{nav_id}/edit
    public function edit($dic_id)
    {
        $field = Dict::find($dic_id);

        return view('admin.dict.edit', compact('field'));
    }

    public function update($dic_id)
    {
        $input = Input::except('_method', '_token');
        $re = Dict::where('dic_id', $dic_id)->update($input);

        if ($re) {
            return redirect('admin/dict');
        } else {
            return back()->with('errors', '更新失败，请检查！');
        }
    }


}

<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Admin\Depart;
use App\Http\Model\Admin\Dict;
use App\Http\Model\Admin\Plan;
use App\Http\Model\Admin\Planexec;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Requests;
use phpDocumentor\Reflection\Types\Parent_;
use Validator;
use DB;

class PlanController extends CommonController
{


 /*   function __construct(){
    parent::__construct(new Plan());

    }
*/
    public function index()
    {
        //   $data = Category::tree();
        $data = Plan::leftjoin('product', 'product.id', '=', 'plan.product_id')
            ->leftjoin('depart', 'depart.id', '=', 'plan.shopid')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="plan_type") as c '), DB::raw('c.dic_item_code'), '=', 'plan.plan_type')
            ->orderBy('plan_date', 'desc')
            ->select('plan.*', 'product.pcode', 'product.pname', 'depart.Dpt_Name', DB::raw('c.dic_item_name as plan_type_name'))->paginate(20);
        //  $data = DB::table('Navs')->orderBy('nav_order', 'desc')->get();
        return view('admin.plan.index')->with('data', $data);
    }


    public function create()
    {
        $workshop = (new Depart)->getDepartInfo();
        $plantype = Dict::where('dic_cat', 'plan_type')->get();
        $planname = '';
        return view('admin/plan/add', compact('workshop', 'plantype', 'planname'));
    }

//post 方法用于添加分类提交
    public function store()
    {
        $workshop = (new Depart)->getDepartInfo();
        $plantype = Dict::where('dic_cat', 'plan_type')->get();
        $rules = [
            'plan_name' => ['required'],
            'plan_date' => ['required'],
            'shopid' => ['required'],
            'product_id' => ['required'],
            'plan_type' => ['required'],
            // 'password_c'=> ['required','min:6','max:20','regex:/^[a-zA-Z0-9!"#$%&\'()*+,-.\/:;<=>?^_`~{|}\]]+$/','confirmed'],
        ];
        $message = [
            'plan_name.required' => '计划名称不能为空！',
            'plan_date.required' => '计划日期不能为空！',
            'shopid.required' => '所属车间不能为空！',
            'product_id.required' => '产品不能为空！',
            'plan_type.required' => '计划类别不能为空！',
        ];
        if ($input = Input::all()) {

            $validator = Validator::make($input, $rules, $message);

            if ($validator->passes()) {//如果规则验证通过
                $plandate = $input['plan_date'];
                $input = Input::except('_token', 'product_name');
                $input['plan_date'] = strtotime($input['plan_date']);
                $input['plan_code'] = time() . rand(pow(10, 3), pow(10, 4) - 1);
                $input['delivery_date'] = strtotime($input['delivery_date']);
                $input['moddate'] = time();
                $input['modman'] = session('user');
                $planname = $input['plan_name'];

                $shopid = $input['shopid'];
                $plan_type = $input['plan_type'];
                //dd($input);
                $re = Plan::create($input);
                if ($re) {
                    return view('admin/plan/add', compact('workshop', 'plantype', 'planname', 'plandate', 'shopid', 'plan_type'));
                } else {
                    return back()->with('errors', '添加失败，请检查！');
                }
            } else {
                return back()->withErrors($validator);
            }
        } else {
            return view('admin/plan/add');
        }

    }


//delete admin/link/{link}删除函数
    public function destroy($nav_id)
    {
        $pre = Plan::where('id', $nav_id)->where('pstate', '1')->get();
        if ($pre->isEmpty()) {
            $re = Plan::where('id', $nav_id)->delete();
            if ($re) {
                $data = [
                    'status' => 0,
                    'msg' => '计划删除成功！',
                ];
                //   return redirect('admin/category');
            } else {
                $data = [
                    'status' => 1,
                    'msg' => '计划删除失败！',
                ];

                //  return back()->with('errors', '删除失败，请稍后再试！');
            }
        } else {
            $data = [
                'status' => 1,
                'msg' => '该计划已被审核，无法删除，请反审核后重试！',
            ];

            //  return back()->with('errors', '删除失败，请稍后再试！');
        }
        return $data;
    }

//put admin/link/{nav_id}/edit
    public function edit($dic_id)
    {
      //  parent::_construct(new Plan());
        $field = Plan::leftjoin('product', 'plan.product_id', '=', 'product.id')->select('plan.*', 'product.pname')->find($dic_id);
        $workshop = (new Depart)->getDepartInfo();
        $plantype = Dict::where('dic_cat', 'plan_type')->get();
        $planname = '';
//dd($field);
        return view('admin.plan.edit', compact('field', 'workshop','plantype','planname'));
    }

    public function update($dic_id)
    {
        parent::update($dic_id);
        $input = Input::except('_method', '_token', 'product_name');
        //  dd($input);
        //   dd($input);
        $input['plan_date'] = strtotime($input['plan_date']);

        $input['delivery_date'] = strtotime($input['delivery_date']);

        $re = Plan::where('id', $dic_id)->update($input);

        if ($re) {
            return redirect('admin/plan');
        } else {
            return back()->with('errors', '更新失败，请检查！');
        }
    }

    public function findkey()
    {
        $input = Input::all();
        if ($input['keywords'] <> '') {
            $keywords = $input['keywords'];
        } else {
            $keywords = '';
        }
        //  $data = Plan::where('plan_name','like','%'.$keywords.'%')->orderBy('plan_date', 'desc')->paginate(20);
        $data = Plan::leftjoin('product', 'product.id', '=', 'plan.product_id')
            ->leftjoin('depart', 'depart.id', '=', 'plan.shopid')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="plan_type") as c '), DB::raw('c.dic_item_code'), '=', 'plan.plan_type')
            ->where('plan.plan_name', 'like', '%' . $keywords . '%')
            ->orderBy('plan.plan_date', 'desc')
            ->select('plan.*', 'product.pcode', 'product.pname', 'depart.Dpt_Name', DB::raw('c.dic_item_name as plan_type_name'))->paginate(20);
        $data->appends(['keywords' => $keywords])->links();
        return view('admin.plan.index')->with('data', $data);
    }

    public function planchecklist()
    {
        //   $data = Category::tree();
        $data = Plan::leftjoin('product', 'product.id', '=', 'plan.product_id')->orderBy('plan.plan_date', 'desc')->select('plan.*', 'product.pcode', 'product.pname')->paginate(20);
        //  $data = DB::table('Navs')->orderBy('nav_order', 'desc')->get();
        return view('admin.plan.check')->with('data', $data);
    }

    public function plancheckfind()
    {
        $input = Input::all();
        if ($input) {
            if ($input['keywords'] <> '') {
                $keywords = $input['keywords'];
            }
        } else {
            $keywords = '';
        }

        //   $data = Category::tree();
        $data = Plan::leftjoin('product', 'product.id', '=', 'plan.product_id')->orderBy('plan.plan_date', 'desc')->where('plan_name', 'like', '%' . $keywords . '%')->select('plan.*', 'product.pcode', 'product.pname')->paginate(20);
        //  $data = DB::table('Navs')->orderBy('nav_order', 'desc')->get();
        $data->appends(['keywords' => $keywords])->links();
        return view('admin.plan.check')->with('data', $data);
    }

    public function plancheck($pid)
    {
        $re = Plan::where('id', $pid)->update(['pstate' => '1']);
        if ($re) {
            $data = [
                'status' => 0,
                'msg' => '计划审核成功！',
            ];
            //   return redirect('admin/planchecklist');
        } else {
            $data = [
                'status' => 1,
                'msg' => '计划审核失败！',
            ];
        }
        return $data;
    }

    public function planuncheck($pcode)
    {//反审核需查验是否生成了路径跟踪卡
        $redata = Planexec::where('plan_code', $pcode)->first();
        if (!$redata) {
            $re = Plan::where('plan_code', $pcode)->update(['pstate' => '0']);
            if ($re) {
                $data = [
                    'status' => 0,
                    'msg' => '计划反审核成功！',
                ];
                return $data;
                //  return redirect('admin/planchecklist');
            } else {
                $data = [
                    'status' => 1,
                    'msg' => '计划反审核失败！',
                ];
                return $data;
                //  return back()->with('errors', '反审核失败，请检查！');
            }
        } else {
            $data = [
                'status' => 1,
                'msg' => '反审核失败，原因：该计划已被执行计划使用，无法反审核，请检查！',
            ];
            return $data;
            //   return back()->with('errors', '反审核失败，原因：该计划已被执行计划使用，无法反审核，请检查！');
        }

    }

    public function plancheckdisable($pcode)
    {
        $redata = Planexec::where('plan_code', $pcode)->first();
        if (!$redata) {
            $re = Plan::where('plan_code', $pcode)->update(['pstate' => '-1']);
            if ($re) {
                $data = [
                    'status' => 0,
                    'msg' => '计划作废成功！',
                ];
                return $data;
                //  return redirect('admin/planchecklist');
            } else {
                $data = [
                    'status' => 1,
                    'msg' => '计划作废失败！',
                ];
                return $data;
                //  return back()->with('errors', '反审核失败，请检查！');
            }
        } else {
            $data = [
                'status' => 1,
                'msg' => '作废失败，原因：该计划已被执行计划使用，无法作废，请检查！',
            ];
            return $data;
            //   return back()->with('errors', '反审核失败，原因：该计划已被执行计划使用，无法反审核，请检查！');
        }

    }
}

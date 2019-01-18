<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Admin\Art;
use App\Http\Model\Admin\Depart;
use App\Http\Model\Admin\Dict;
use App\Http\Model\Admin\Plan;
use App\Http\Model\Admin\Category_sub_sub;
use App\Http\Model\Admin\Engine;
use App\Http\Model\Admin\Product;
use App\Http\Model\Admin\PublicFunction;
use App\Http\Model\Admin\SysPublic;
use App\Http\Model\Admin\User;
use Illuminate\Http\Request;
use App\Http\Model\Admin\Customer;
use App\Http\Requests;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;


class PublicController extends CommonController
{
    public function popart()
    {
        $data = '';//Customer::orderBy('cust_name','asc')->paginate(20);
        return view('admin/public/pop_art', compact('data'));


    }

    public function popfindart()
    {
        $input = Input::all();
        $data = Art::where('Art_name', 'like', '%' . $input['keywords'] . '%')->where('Art_used', 1)->orderBy('Art_name', 'asc')->paginate(20);
        //  dd($data);
        return view('admin/public/pop_art', compact('data'));

    }


    public function keyart()
    {
        $input = Input::all();
        $data = Art::where('art.Art_name', 'like', '%' . $input['art_name'] . '%')->orwhere('art.Art_code', 'like', '%' . $input['art_name'] . '%')->orderBy('art.Art_name', 'asc')->limit(30)->get()->toArray();
        $data = json_encode($data);
        return $data;
    }


    //弹出选择产品pop窗体
    public function popproduct()
    {
        $data = '';//Customer::orderBy('cust_name','asc')->paginate(20);
        return view('admin/public/pop_product', compact('data'));

    }

    public function popfindproduct()
    {
        $input = Input::all();
        $keyword = $input['keywords'];
        $data = Product::leftjoin('category', 'product.category', '=', 'category.cate_id')
            ->leftjoin('art', 'product.art_id', '=', 'art.id')
            ->select('product.*', 'art.Art_name', 'art.Art_code', 'category.cate_title')
            ->where('product.pstate', '=', '1')
            ->Where(function ($query) use ($keyword) {
                $query->where('product.pname', 'like', '%' . $keyword . '%')
                    ->orwhere('product.pcode', 'like', '%' . $keyword . '%');
            })->orderBy('product.pcode', 'asc')->paginate(20);
        return view('admin/public/pop_product', compact('data'));

    }

    public function keyproduct()
    {
        $input = Input::all();
        $data = Product::where('product.pname', 'like', '%' . $input['product_name'] . '%')->orwhere('product.pcode', 'like', '%' . $input['product_name'] . '%')->orderBy('product.pcode', 'asc')->limit(30)->get()->toArray();
        $data = json_encode($data);
        return $data;
    }
    public function popplanexec($plan_type)

    {

        $data = '';//Customer::orderBy('cust_name','asc')->paginate(20);
        $ptype=Dict::where('dic_cat','plan_type')->get();

        return view('admin/public/pop_planexec', compact('data','ptype','plan_type'));

    }

    public function popfindplanexec()
    {
        $input = Input::all();

        $ptype=Dict::where('dic_cat','plan_type')->get();
        $user=User::where('user_name',Session('user'))->select('user_name',DB::raw('IFNULL(plan_type,"") as plan_type'))->first();
        if ($user['plan_type']=='%' ){
            $plan_type=$input['ptype'];

        }else{
            $plan_type=$user['plan_type'];
        }
        $keyword = $input['keywords'].'%';
        session(['plan_type' => $plan_type]);
        $data=Plan::join('product','product.id','=','plan.product_id')->join('art','art.id','=','product.art_id')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="plan_type") as c '),DB::raw('c.dic_item_code'),'=','plan.plan_type')
            ->where('plan.pstate','<>',3)
            ->where('plan.plan_type','like',$plan_type)
            ->Where(function ($query) use ($keyword) {
                $query->where('plan_code', 'like', '%' . $keyword . '%')
                    ->orwhere('product.pname', 'like', '%' . $keyword . '%');
            })
            ->select('plan.*','product.id as productid','product.pcode','product.pname','product.category','product.pmodel','product.pstyle','product.art_id','art.Art_code','art.Art_name',DB::raw('c.dic_item_name as plan_type_name'))
            ->orderBy('plan_code','desc')->paginate(20);
        $data->appends(['keywords' => $keyword,'plan_type'=>$plan_type,'ptype'=>$plan_type])->links();
        return view('admin/public/pop_planexec', compact('data','ptype'));

    }

    public function GetParentList()
    {
        $depart = Depart::all();
        $PublicFunction=new PublicFunction;
        $targetitems='';
        $data=$PublicFunction->getplist($depart,4,'id','Parentid');
        return $data;
    }

    public function GetChildList()
    {
        $depart = Depart::all();
        $PublicFunction=new PublicFunction;
     //   $targetitems='';
        $data=$PublicFunction->getclist($depart,1,'id','Parentid');
        return $data;
    }

    public function getautocode($modelname)
    {
        $data=SysPublic::getautocode('Frm_Package');
        return $data;
    }

//外协执行计划pop厂家
    public function popassistfactory()
    {
        $data = '';//Customer::orderBy('cust_name','asc')->paginate(20);

        return view('admin/public/pop_assistfactory', compact('data'));
    }

    public function popfindassistfactory()
    {
        $input = Input::all();
        $keyword = $input['keywords'].'%';
        $data=Customer::where('cust_Enabled',1)
            ->Where(function ($query) use ($keyword) {
                $query->where('cust_nameCn', 'like', '%' . $keyword . '%')
                    ->orwhere('cust_hpcode', 'like', '%' . $keyword . '%');
            })
            ->orderBy('cust_hpcode','asc')->paginate(20);
        $data->appends(['keywords' => $keyword])->links();
        return view('admin/public/pop_assistfactory', compact('data'));
    }
}

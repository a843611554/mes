<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Admin\Artwork;
use App\Http\Model\Admin\Plan;
use App\Http\Model\Admin\Plan_operater;
use App\Http\Model\Admin\Plan_add_material;
use App\Http\Model\Admin\Planexec;
use App\Http\Model\Admin\Planexec_det;
use App\Http\Model\Admin\User;
use App\Http\Model\Admin\Bas_producebom;
use App\Http\Model\Admin\Product;
use App\Http\Model\Admin\Art;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests;
use Illuminate\Support\Facades\Input;


class PlanexecController extends CommonController
{

    public function index()
    {


        $user = User::where('user_name', Session('user'))->select('user_name', DB::raw('IFNULL(plan_type,"") as plan_type'))->first();
        if ($user['plan_type'] == '%') {
            $plan_type = '%';
        } else {
            $plan_type = $user['plan_type'];
        }
        //    dd($plan_type);
        $planexec = Planexec::leftjoin('product', 'product.id', '=', 'plan_exec.pid')
            ->leftjoin('plan', 'plan.plan_code', '=', 'plan_exec.plan_code')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="plan_type") as c '), DB::raw('c.dic_item_code'), '=', 'plan.plan_type')
            ->where(function ($query) use ($plan_type){
                $query->where('plan.plan_type', 'like', $plan_type)
                      ->orWhere('plan_exec.plan_code',null); //如果生成了半成品计划执行，那么就不会存在plan_code
            })
            ->orderBy('id', 'desc')->select('plan_exec.*', 'plan.plan_type', DB::raw('c.dic_item_name as plan_type_name'), 'product.pcode')->paginate(20);



//        dd($planexec);

        return view('admin.planexec.index')->with('data', $planexec);
    }

    //加载今日任务信息
    public function todayexec(){
        $plan = Plan::leftjoin(DB::raw('(select * from t_dict where dic_cat="plan_type") as c '), DB::raw('c.dic_item_code'), '=', 'plan.plan_type')
            ->leftjoin("product",'product.id','=','plan.product_id')
            ->select('plan.*','product.pname', DB::raw('c.dic_item_name as plan_type_name'))->get();


            $todayexec = array();
            for ($i=0;$i<count($plan);$i++){
                $num = 0;
                $num = Planexec::where('plan_code',$plan[$i]['plan_code'])->sum('material_num'); //获取计划已生产的数量
                $add_material_num=Plan_add_material::where('plan_code',$plan[$i]['plan_code'])->where('state','1')->sum('add_material_num');
//                if (!$add_material) {
//                    $add_material_num =0;
//                }//获取加料数量
//                dd($add_material_num);
                if($num < $plan[$i]['order_num']+$add_material_num

                    && date('Y-m-d',$plan[$i]['delivery_date'])>= date('Y-m-d',time()) ){  //交付日期要在今日日期之后


                    $surplus = $plan[$i]['order_num']+$add_material_num-$num; //计算剩余数量

                    //获取此计划，插入剩余数量信息
                    array_add($plan[$i],'surplus',$surplus);
                    //获取加料数量
                    array_add($plan[$i],'add_material_num',$add_material_num);
                    //将符合条件并且已插入剩余数量的信息插入$todayexec数组
                    array_push($todayexec,$plan[$i]);

                }
            }
        if(count($todayexec)<=0){
            $data =[
                "msg" => "今日无计划任务！",
                "status" => 0
            ];
        }else{

            $data =[
                "status" => 1,
                "todayexec" =>$todayexec
            ];
        }
        return $data;
    }

    public function addtodayexec($plan_code){

        $data = Plan::leftjoin('product','plan.product_id','=','product.id')
            ->leftjoin('art','product.art_id','=','art.id')
         ->where('plan.plan_code',$plan_code)->select("plan.*","product.pcode","product.pname","art.id as art_id","art.Art_code","art.Art_name")->first();
        return view("admin.planexec.add",compact('data'));
    }
//外协索引页函数
    public function assist_index()
    {
        $planexec = Planexec::leftjoin('product', 'product.id', '=', 'plan_exec.pid')
            ->leftjoin('plan', 'plan.plan_code', '=', 'plan_exec.plan_code')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="plan_type") as c '), DB::raw('c.dic_item_code'), '=', 'plan.plan_type')
            ->where('plan.plan_type', '03')
            ->orderBy('id', 'desc')->select('plan_exec.*', 'product.pcode', 'plan.plan_type', DB::raw('c.dic_item_name as plan_type_name'))->paginate(20);
        return view('admin.planexec.assist_index')->with('data', $planexec);
    }

    public function assistfindkey()
    {
        $input = Input::all();
        if ($input['keywords'] <> '') {
            $keywords = $input['keywords'];
        } else {
            $keywords = '';
        }
        $planexec = Planexec::leftjoin('product', 'product.id', '=', 'plan_exec.pid')
            ->leftjoin('plan', 'plan.plan_code', '=', 'plan_exec.plan_code')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="plan_type") as c '), DB::raw('c.dic_item_code'), '=', 'plan.plan_type')
            ->where('plan.plan_type', '03')
            ->Where(function ($query) use ($keywords) {
                $query->where('plan_exec.exec_qrcode', 'like', '%' . $keywords . '%')
                    ->orwhere('plan_exec.pname', 'like', '%' . $keywords . '%');
            })
            ->orderBy('id', 'desc')->select('plan_exec.*', 'product.pcode', 'plan.plan_type', DB::raw('c.dic_item_name as plan_type_name'))->paginate(20);
        $planexec->appends(['keywords' => $keywords, 'plan_type' => '03'])->links();
        return view('admin.planexec.assist_index')->with('data', $planexec);
    }

//外协新增函数
    public function assist_add()
    {
        return view('admin.planexec.assist_add');
    }

    public function planexecfindkey(Request $request)
    {
        $input = Input::all();
        if ($input['keywords'] <> '') {
            $keywords = $input['keywords'];
        } else {
            $keywords = '';
        }
        $user = User::where('user_name', Session('user'))->select('user_name', DB::raw('IFNULL(plan_type,"") as plan_type'))->first();
        if ($user['plan_type'] == '%') {
            $plan_type = '%';
        } else {
            $plan_type = $user['plan_type'];
        }
        $planexec = Planexec::leftjoin('product', 'product.id', '=', 'plan_exec.pid')
            ->leftjoin('plan', 'plan.plan_code', '=', 'plan_exec.plan_code')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="plan_type") as c '), DB::raw('c.dic_item_code'), '=', 'plan.plan_type')
            ->where(function ($query) use ($plan_type){
                $query->where('plan.plan_type', 'like', $plan_type)
                    ->orWhere('plan_exec.plan_code',null);
            })
            ->Where(function ($query) use ($keywords) {
                $query->where('plan_exec.exec_qrcode', 'like', '%' . $keywords . '%')
                    ->orwhere('plan_exec.pname', 'like', '%' . $keywords . '%');
            })
            ->orderBy('id', 'desc')->select('plan_exec.*', 'product.pcode', 'plan.plan_type', DB::raw('c.dic_item_name as plan_type_name'))->paginate(20);
        $planexec->appends(['keywords' => $keywords, 'plan_type' => $plan_type])->links();
       $request->flash();
        return view('admin.planexec.index')->with('data', $planexec);
    }

//执行计划关联工艺及下发每箱数量
    public function exec_check()
    {
        $user = User::where('user_name', Session('user'))->select('user_name', DB::raw('IFNULL(plan_type,"") as plan_type'))->first();
        if ($user['plan_type'] == '%') {
            $plan_type = '%';
        } else {
            $plan_type = $user['plan_type'];
        }
        $planexec = Planexec::leftjoin('product', 'product.id', '=', 'plan_exec.pid')
            ->leftjoin('plan', 'plan.plan_code', '=', 'plan_exec.plan_code')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="plan_type") as c '), DB::raw('c.dic_item_code'), '=', 'plan.plan_type')
            ->where('plan_type', 'like', $plan_type)
            ->orderBy('id', 'desc')->select('plan_exec.*', 'product.pcode', 'plan.plan_type', DB::raw('c.dic_item_name as plan_type_name'))->paginate(20);
        // dd($planexec);
        return view('admin.planexec.exec_check')->with('data', $planexec);
    }

    //执行计划关联工艺及下发每箱数量
    public function exec_checkkey()
    {
        $input = Input::all();
        if ($input['keywords'] <> '') {
            $keywords = $input['keywords'];
        } else {
            $keywords = '';
        }

        $user = User::where('user_name', Session('user'))->select('user_name', DB::raw('IFNULL(plan_type,"") as plan_type'))->first();
        if ($user['plan_type'] == '%') {
            $plan_type = '%';
        } else {
            $plan_type = $user['plan_type'];
        }
        //  dd($plan_type);
        $planexec = Planexec::leftjoin('product', 'product.id', '=', 'plan_exec.pid')
            ->leftjoin('plan', 'plan.plan_code', '=', 'plan_exec.plan_code')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="plan_type") as c '), DB::raw('c.dic_item_code'), '=', 'plan.plan_type')
            ->where('plan_type', 'like', $plan_type)
            ->Where(function ($query) use ($keywords) {
                $query->where('plan_exec.exec_qrcode', 'like', '%' . $keywords . '%')
                    ->orwhere('plan_exec.pname', 'like', '%' . $keywords . '%');
            })
            ->orderBy('id', 'desc')->select('plan_exec.*', 'product.pcode', 'plan.plan_type', DB::raw('c.dic_item_name as plan_type_name'))->paginate(20);
        $planexec->appends(['keywords' => $keywords, 'plan_type' => $plan_type])->links();
        return view('admin.planexec.exec_check')->with('data', $planexec);
    }

    public function create()
    {
        return view('admin.planexec.add');
    }

    //新增执行计划之前，判断是否存在清单下的子物料，并且展示
    public function check_child(){
        $input = Input::all();
//        dd($input);
        $plandata = Plan::where('plan_code', $input['plan_code'])->first();
        $planexecsum = Planexec::where('plan_code', $input['plan_code'])->groupBy('plan_code')->select('plan_code', DB::raw('sum(material_num) as material_sum'))->first();

        $add_material_num=Plan_add_material::where('plan_code',$input['plan_code'])->where('state','1')->groupby('plan_code')->sum('add_material_num');

        if ( ($planexecsum['material_sum']+$input['material_num']) > ($plandata['order_num']+$add_material_num)) {
            $data=['status'=>'-1','msg'=>'注意累计计划执行数量之和大于该计划剩余数量'];

            return $data;
        }

        $child = Bas_producebom::where('Pd_Code',$input['pcode'])->get();


        $child = $child->toarray();


        $child_item=array();
        foreach ($child as $v){
            if($v['Pb_ChildCode'] != '0'){ //
                $v['plan_exec_num'] = $input['material_num'] * $v['Pb_ChildGross']; //输入的数量*子物料清单内的毛数量，得到将要计划执行的子物料数量
                array_push($child_item,$v);
            }
        } //得到子物料清单的集合


        //判断子物料是否存在于plan中
        $p_item = array();
        $child_product = array();
        foreach ($child_item as $v){
            //因为plan表外键使用的是product表的id，所以先要去获取id
            $data=Product::where('pcode',$v['Pb_ChildCode'])->first();
            $child_product['product_id']=$data['id'];
            $child_product['pcode']=$data['pcode'];
            $child_product['pname']=$data['pname'];
            $child_product['plan_exec_num']=$v['plan_exec_num'];
            array_push($p_item,$child_product);
        }
//        dd($p_item);

        $child_plan_exec=array();
        foreach ($p_item as $v){
//            $plandata = Plan::where('product_id',$v['product_id'])->where('pstate','1')->orderby('moddate','desc')->first();
//            if(isset($plandata)){
//                //子物料存在于计划表中
//                $plandata['plan_exec_num']   =  $v['plan_exec_num'];
//                $plandata['product_id']=$v['product_id'];
//                $plandata['pcode']=$v['pcode'];
//                $plandata['pname']=$v['pname'];
//
//                //得到工艺信息
//                $art = Product::leftjoin('art','art.id','=','product.art_id')
//                    ->where('product.id',$plandata['product_id'])
//                    ->select('art.id','art.Art_code','art.Art_name')
//                    ->first();
//                $plandata['art_id']=$art['id'];
//                $plandata['art_code']=$art['Art_code'];
//                $plandata['art_name']=$art['Art_name'];
//                array_push($child_plan_exec,$plandata->toarray());
//            }else{
                //子物料不存在于计划表中
                $plan_exec_num=$v['plan_exec_num']; //获取子物料将要执行的生产数量
                $plandata=array();
                $plandata['product_id']=$v['product_id'];
                $plandata['plan_exec_num']=$plan_exec_num;
                $plandata['pcode']=$v['pcode'];
                $plandata['pname']=$v['pname'];
                $plandata['pnote']='半成品';

                //得到工艺信息
                $art = Product::leftjoin('art','art.id','=','product.art_id')
                    ->where('product.id',$plandata['product_id'])
                    ->select('art.id','art.Art_code','art.Art_name')
                    ->first();
                $plandata['art_id']=$art['id'];
                $plandata['art_code']=$art['Art_code'];
                $plandata['art_name']=$art['Art_name'];
                array_push($child_plan_exec,$plandata);


        }
        if(count($child_plan_exec)>0){
            $data=['status'=>'1','child_plan_exec'=>$child_plan_exec];
        }else{
            $data=['status'=>'0'];
        }
        return $data;


    }

    public function store(){
        $input = Input::all();
        if (Input::has('plan_type')) {
            $plan_type = $input['plan_type'];
        } else {
            $plan_type = '';
        }
        DB::beginTransaction(); //开启事务
        try {
            $plandata = Plan::where('plan_code', $input['plan_code'])->first();
            $planexecsum = Planexec::where('plan_code', $input['plan_code'])->groupBy('plan_code')->select('plan_code', DB::raw('sum(material_num) as material_sum'))->first();
            $add_material_num=Plan_add_material::where('plan_code',$input['plan_code'])->where('state','1')->groupby('plan_code')->sum('add_material_num');


            if ( ($planexecsum['material_sum']+$input['material_num']) > ($plandata['order_num']+$add_material_num)) {
                throw new \Exception('注意累计计划执行数量之和大于该计划剩余数量','0');
            }
            $input = Input::except('_token', 'pcode', 'acode', 'plan_type', 'child_exec_list');

            $rules = [
                'plan_code' => 'required',
            ];
            $message = [
                'plan_code.required' => '计划编码不能为空',
            ];
            $validator = Validator::make($input, $rules, $message);
            if ($validator->passes()) {
                $input['exec_qrcode'] = time() . rand(pow(10, 3), pow(10, 4) - 1);
                $input['exec_date'] = time($input['exec_date']);
                $input['modman'] = Session('user');
                $input['moddate'] = time();
                $re = Planexec::create($input);
                if ($re) {
                    //  dd($plan_type);
                    if ($plan_type == '03') {
                        $data=[
                            "msg" => "操作完成",
                            "status" => '3'
                        ];
                    } else {
                        $data=[
                            "msg" => "操作完成",
                            "status" => '1'
                        ];
                    }

                }else{
                    throw new \Exception('创建执行计划失败','0');
                }
            }else {
                throw new \Exception($validator,'0');
            }
            //开始插入子执行计划
            $child_exec_list = Input::get('child_exec_list');
            if(isset($child_exec_list)){
                foreach ($child_exec_list as $child_exec){

//                    if(isset($child_exec['plan_code'])) {
//                        $plandata = Plan::where('plan_code', $child_exec['plan_code'])->first();
//                        $planexecsum = Planexec::where('plan_code', $child_exec['plan_code'])->groupBy('plan_code')->select('plan_code', DB::raw('sum(material_num) as material_sum'))->first();
////                        dd($planexecsum['material_sum']);
//                        if ($planexecsum['material_sum']+$child_exec['material_num'] > $plandata['plan_dept_num']) {
//                            throw new \Exception('注意累计子计划' . $plandata['plan_name'] . '计划执行数量之和大于该计划设定数量', '0');
//                        }
//                    }
                    $child_exec['exec_qrcode'] = time() . rand(pow(10, 3), pow(10, 4) - 1);
                    $child_exec['exec_date'] = time($input['exec_date']);
                    $child_exec['modman'] = Session('user');
                    $child_exec['moddate'] = time();
                    $re = Planexec::create($child_exec);

                    if($re){
                        if ($plan_type == '03') {
                            $data=[
                                "msg" => "操作完成",
                                "status" => '3'
                            ];
                        } else {
                            $data=[
                                "msg" => "操作完成",
                                "status" => '1'
                            ];
                        }
                    }else{
                        throw new \Exception('创建子执行计划失败','0');
                    }
                }
            }

            DB::commit();//提交


            return $data;
        }catch (\Exception $e){
            DB::rollback();//事务回滚

            $msg = $e->getMessage();
            $status = $e->getCode();
            $data=[
                "msg" => $msg,
                "status" => $status
            ];
            return $data;
        }
    }

    public function store_OLD()
    {
        $input = Input::all();
        if (Input::has('plan_type')) {
            $plan_type = $input['plan_type'];
        } else {
            $plan_type = '';
        }
        $plandata = Plan::where('plan_code', $input['plan_code'])->first();
        $planexecsum=Planexec::where('plan_code', $input['plan_code'])->groupBy('plan_code')->select('plan_code',DB::raw('sum(material_num) as material_sum'))->first();

        if ($planexecsum['material_sum']>$plandata['plan_dept_num']){
            return back()->withErrors('注意累计计划执行数量之和大于该计划设定数量');
         //   dd($planexecsum['material_sum'].'---'.$plandata['plan_dept_num']);
        }
        $input = Input::except('_token', 'pcode', 'acode', 'plan_type');


        $rules = [
            'plan_code' => 'required',
        ];
        $message = [
            'plan_code.required' => '计划编码不能为空',
        ];
        $validator = Validator::make($input, $rules, $message);
        if ($validator->passes()) {
            $input['exec_qrcode'] = time() . rand(pow(10, 3), pow(10, 4) - 1);
            $input['exec_date'] = time($input['exec_date']);
            $input['modman'] = Session('user');
            $input['moddate'] = time();
            $re = Planexec::create($input);
            if ($re) {
                //  dd($plan_type);
                if ($plan_type == '03') {
                    return redirect('admin/assist_index');
                } else {
                    return redirect('admin/planexec');
                }

            } else {
                return back()->withErrors($validator);
            }
        }

    }




    public function edit($id)
    {
        $field = Planexec::leftjoin('product', 'product.id', 'planexec.pid')->select('Planexec.*', 'product.pcode', 'product.pname')->find($id);
        return view('admin.planexec.edit', compact('field'));
    }

    public function update($id)
    {
        $input = Input::except('_token', '_method');
        $up = Planexec::where('id', $id)->update($input);
        if ($up) {
            return redirect('admin/planexec');
        }
    }

    public function destroy($id)
    {
        $pstate = Planexec::find($id);
        $re = Plan_operater::where('exec_qrcode', $pstate['exec_qrcode'])->first();
        if (!$re) {
            $pstate->pstate = '-1';
            $res = $pstate->update();
            if ($res) {
                $data = [
                    'status' => 0,
                    'msg' => '执行计划作废成功！',
                ];
            } else {
                $data = [
                    'status' => 0,
                    'msg' => '执行计划作废失败！',
                ];
            }
        } else {
            $data = [
                'status' => 1,
                'msg' => '存在产量信息，无法作废该信息！',
            ];
        }

        return $data;
    }

    public function destoryexecpstate()
    {

    }

    public function showart($pid, $exec_id)
    {
        $data = Artwork::leftjoin('workcenter', 'artdetail.workcenter', '=', 'workcenter.id')->where('Art_id', $pid)->where('isproduce', 1)->where('artdetail.pstate', 1)->orderby('Work_order', 'asc')->get();
        return view('admin.planexec.showart', compact('data', 'exec_id'));
    }

//关联计划执行明细表，由工艺明细中数据获得
    public function addartdet()
    {
        $status = 'false';

        $input = Input::all();
        $data = Artwork::whereRaw('FIND_IN_SET(det_id, "' . implode(",", $input["artdet_array"]) . '")')->orderBy('Work_order', 'asc')->get();

        if (is_object($data)) {
            $exedata = Planexec::where('id', $input['exec_id'])->first();
            $db = DB::table('plan_exec_det')->where('exec_id', $input['exec_id'])->delete();
            foreach ($data as $v) {

                $db = DB::table('plan_exec_det')->insert([
                    'exec_id' => $input['exec_id'],
                    'artdet_id' => $v->det_id,
                    'exec_qrcode' => $exedata['exec_qrcode'],
                    'art_id' => $exedata['art_id'],
                    'work_order' => $v->Work_order,
                    'work_name' => $v->Work_name,
                    'Unt_NameCn' => $v->Unt_NameCn,
                    'isproduce' => $v->isproduce,
                    'isquality' => $v->isquality,
                    'isattachment' => $v->isattachment,
                    'attachvalue' => $v->attachvalue,
                    'show_num' => $v->show_num,
                    'person_liable' => $v->person_liable,
                    'workcenter' => $v->workcenter,
                    'moddate' => time(),
                    'modman' => session('user'),
                    'pstate' => 1,
                ]);
                if (!$db) {
                    $datamsg = [
                        'status' => 'false',
                        'msg' => '计划执行关联工艺明细失败！',
                    ];
                    break;
                } else {
                    $datamsg = [
                        'status' => 'true',
                        'msg' => '计划执行关联工艺明细成功！',
                    ];
                }

            }
        }
//dd($db);
        if ($datamsg['status'] == 'true') {

            DB::table('plan_exec')->where('id', $input['exec_id'])->update(['pstate' => 1]);
        }

        return $datamsg;
    }

//展示工艺信息
    public function execshowart($pid)
    {
        $data = DB::table('plan_exec_det')->leftjoin('artdetail', 'artdetail.det_id', '=', 'plan_exec_det.artdet_id')
            ->leftjoin('workcenter', 'workcenter.id', '=', 'artdetail.workcenter')
            ->select('plan_exec_det.*', 'artdetail.Work_add', 'artdetail.Work_order', 'artdetail.Work_name', 'workcenter.wc_name')
            ->where('plan_exec_det.exec_id', $pid)->orderby('artdetail.Work_order', 'asc')->get();

//dd($data);
        return view('admin.planexec.execshowart')->with('data', $data);
    }

//执行计划打印条形码
    public function assistCheckPrint($id)
    {
        $com = Planexec::find($id);
        return view('admin.planexec.assistCheckPrint')->with('data', $com);
    }



}

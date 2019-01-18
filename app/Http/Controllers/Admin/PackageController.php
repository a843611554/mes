<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Admin\Dict;
use App\Http\Model\Admin\Package;
use App\Http\Model\Admin\Package_det;
use App\Http\Model\Admin\Plan_operater;
use App\Http\Model\Admin\Planexec;
use App\Http\Model\Admin\PlanexecDet;
use App\Http\Model\Admin\Printlist;
use App\Http\Model\Admin\SysPublic;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Flight;
use Illuminate\Support\Facades\DB;
use App\Http\Requests;
use Illuminate\Support\Facades\Input;

class PackageController extends CommonController
{

    public function index()
    {
        $com = Package::where('pstate','>=','-1')->orderBy('id', 'desc')->paginate(20);
        return view('admin.Package.index')->with('data', $com);
    }

    public function packageDet($packid)
    {
        $com = Package_det::where('pack_id', $packid)->orderBy('pdet_id', 'asc')->paginate(20);
        return view('admin.package/packageDet')->with('data', $com);
    }

    public function edit($id)
    {
        $field = Package::find($id);
        return view('admin.Package.edit', compact('field'));
    }

    public function update($id)
    {
        $input = Input::except('_token', '_method');
        $up = Package::where('id', $id)->update($input);
        if ($up) {
            return redirect('admin/package');
        }
        return redirect('admin/package');
    }

    public function destroy($id)
    {
        //   $re=Package::where('id',$id)->delete();
        $pstate = Package::find($id);
        $pstate->pstate = '-1';
        $res = $pstate->update();
        if ($res) {
            $data = [
                'status' => 0,
                'msg' => '记录删除成功！',
            ];
        } else {
            $data = [
                'status' => 1,
                'msg' => '记录删除失败，请稍后重试！',
            ];
        }
        return $data;
    }

//包装打印条码
    public function packageCheckPrint($id)
    {
        $com = Package::find($id);
        return view('admin.Package.packCheckPrint')->with('data', $com);
    }

    public function changepstate()
    {

        $re = Input::all();
        $id = $re['id'];
        $pstate = Package::find($id);
        $pstate->pstate = '1';
        $pstate->modman = session('user');
        $pstate->moddate = time();
        $pstate->save();
        if ($pstate) {
            $data = [
                'status' => '0',
                'msg' => '审核成功'
            ];
        } else {
            $data = [
                'status' => '1',
                'msg' => '审核不成功'
            ];

        }
        return $data;
    }

    public function nochangepstate()
    {
        $re = Input::all();
        $id = $re['id'];
        $pstate = Package::find($id);
        $pstate->pstate = '0';
        $pstate->modman = session('user');
        $pstate->moddate = time();
        $pstate->save();
        if ($pstate) {
            $data = [
                'status' => '0',
                'msg' => '取消审核成功'
            ];
        } else {
            $data = [
                'status' => '1',
                'msg' => '取消审核不成功'
            ];

        }
        return $data;


    }


    //
    public function GetPackageBill()
    {
        //   $data = Category::tree();
        $packagebill = SysPublic::getautocode('CPackage');
        // dd($packagebill);
        $data3 = $unit = Dict::where('dic_cat', 'unit_type')->orderby('dic_order', 'asc')->get();
        $data2['bill'] = $packagebill;
        $data2['dict'] = $data3;

        $data = json_encode($data2);

        return $data;
    }

    public function GetPackageProduct($exec_qrcode, $printid)
    {
        /*   //获取当前操作最大工序id
           $curartrec = Plan_operater::join('plan_exec_det', 'plan_exec_det.exec_qrcode', '=', 'plan_operater.exec_qrcode')
               ->where('plan_operater.print_code', $printid)->where('plan_operater.exec_qrcode', $exec_qrcode)->orderBy('plan_exec_det.work_order', 'desc')
               ->select('Plan_operater.*', 'plan_exec_det.work_order', 'plan_exec_det.work_name')->first();

           $curartsum = Plan_operater::where('plan_operater.print_code', $printid)
               ->where('plan_operater.exec_qrcode', $exec_qrcode)
               ->where('artdet_id', $curartrec['artdet_id'])
               ->select('exec_qrcode', 'print_code', 'artdet_id', DB::raw('sum(o_valiable_num) as o_valiable_sum,SUM(o_unvaliable_num) AS o_unvaliable_sum'));
   */
        $exec_boxnum = Printlist::join('plan_exec','plan_exec.exec_qrcode','=','plan_print_list.exec_qrcode')
            ->select('plan_print_list.*','plan_exec.plan_code')
            ->where('plan_print_list.exec_qrcode', $exec_qrcode)->where('plan_print_list.print_code', $printid)->first();
        if ($exec_boxnum['pstate'] == 3) {
            $curpacksum = Package_det::leftjoin('package', 'package.id', '=', 'package_det.pack_id')->where('print_code', $printid)
                ->where('exec_qrcode', $exec_qrcode)
                ->where('package.pstate', '<>', -1)
                ->select('exec_qrcode', 'print_code', DB::raw('sum(box_num) as box_sum'))->groupBy('exec_qrcode', 'print_code');
            //batchattach附加项标示 01炉号02批次号
            $getbatchno = Plan_operater::where('exec_qrcode', $exec_qrcode)->where('print_code', $printid)->where('batchattach', '02')->where('batchnum', '<>', '')->orderBy('operate_date', 'asc')->first();

            $data1 = Printlist::join('plan_exec', 'plan_exec.exec_qrcode', '=', 'plan_print_list.exec_qrcode')
                ->leftjoin('product', 'plan_exec.pid', '=', 'product.id')
                ->leftjoin('plan', 'plan_exec.plan_code', '=', 'plan.plan_code')
                ->leftjoin(DB::raw("({$curpacksum->toSql()}) as pack"), function ($join) {
                    $join->on('plan_print_list.exec_qrcode', '=', DB::raw('pack.exec_qrcode'))->on(DB::raw('pack.print_code'), '=', 'plan_print_list.print_code');
                })->mergeBindings($curpacksum->getQuery())
                ->where('plan_print_list.print_code', $printid)
                ->where('plan_print_list.exec_qrcode', $exec_qrcode)
                ->select('plan_exec.*', 'plan_print_list.print_code', 'product.pcode', 'product.id as product_id', 'product.pname', 'product.pcode', 'product.category', 'product.pmodel',
                    'product.pstyle', 'product.price', 'product.photo_path', 'product.qr_code', 'plan_print_list.avaliable_quality', DB::raw('IFNULL(avaliable_quality,0) as o_valiable_sum'),
                    DB::raw('IFNULL(unavaliable_quality,0) as o_unvaliable_sum'), DB::raw('IFNULL(pack.box_sum,0) as box_sum'), DB::raw('200 as errorcode'), DB::raw('IFNULL(order_no,"") as order_no'),
                    DB::raw('IFNULL(cust_no,"") as cust_no'), 'plan.pnote as plan_note')//DB::raw(' as batchno')
                ->selectRaw('IFNULL(?,"") as batchno', [$getbatchno['batchnum']])
                //->where(DB::raw('sub.exec_qrcode'), $exec_qrcode)->where(DB::raw('sub.print_code'), $printid)
                ->first();
            if (empty($data1)) {
                $data1 = '';
            } else {
                $data1 = $data1->toarray();
            }
       /*     $Pdata = DB::select('select a.*,c.plan_code,IFNULL(d.born_box,0) as born_box,a.avaliable_quality-IFNULL(d.born_box,0) as pendingpack from t_plan_print_list a
LEFT JOIN t_plan_exec b on a.exec_qrcode=b.exec_qrcode LEFT JOIN t_plan c on b.plan_code=c.plan_code 
LEFT JOIN (SELECT exec_qrcode,print_code,sum(box_num) as born_box from t_package_det  
GROUP BY exec_qrcode,print_code ) d 
on a.exec_qrcode=d.exec_qrcode and a.print_code=d.print_code  where a.pstate=-3 and c.plan_code=? and a.avaliable_quality-IFNULL(d.born_box,0)>0',[$exec_boxnum['plan_code']]);
            $data1['pending']=$Pdata;   //2018-8-28  df 暂时屏蔽此代码，因为车间提取数据时死机*/
            $data1['pending']='';
         //   $data = json_encode($data1);
            return response()->json($data1);
        } else
            $data = '{"errorcode":"305","success":"false"}';;
        return $data;

    }

//判断指定箱号最后工序数量及已装箱数量减本次装箱数量是否大于0，大于0代表可以装箱
    public static function checkbox_num($aexec_qrcode, $onum)
    {
        $exec_qrcode = strstr($aexec_qrcode, '/');
        $printid = strstr($aexec_qrcode, '/', false);
        $curartrec = Plan_operater::join('plan_exec_det', 'plan_exec_det.exec_qrcode', '=', 'plan_operater.exec_qrcode')
            ->where('plan_operater.print_code', $printid)->where('plan_operater.exec_qrcode', $exec_qrcode)->orderBy('plan_exec_det.work_order', 'desc')
            ->select('Plan_operater.*', 'plan_exec_det.work_order', 'plan_exec_det.work_name')->first();

        $curartsum = Plan_operater::where('plan_operater.print_code', $printid)
            ->where('plan_operater.exec_qrcode', $exec_qrcode)
            ->where('artdet_id', $curartrec['artdet_id'])
            ->select('exec_qrcode', 'print_code', 'artdet_id', DB::raw('sum(o_valiable_num) as o_valiable_sum,SUM(o_unvaliable_num) AS o_unvaliable_sum'));

        $curpacksum = Package_det::where('print_code', $printid)
            ->where('exec_qrcode', $exec_qrcode)
            ->select('exec_qrcode', 'print_code', DB::raw('sum(box_num) as box_sum'));
        if ($curartsum['o_valiable_sum'] - $curpacksum['box_sum'] - $onum >= 0) {
            return ture;
        } else {
            return false;
        }
    }

    public function postdividedata()
    {
        $df = '{"errorcode":"500","success":"false"}';

        if ($input = Input::all()) {
            //  $arr=json_decode($input,true);
            $pdata=Package::where('pack_bill',$input['pack_bill'])->first();
            if (!empty($pdata)){
                Package::where('pack_bill',$input['pack_bill'])->update(['pstate'=>'-3','pack_bill'=>$pdata['pack_bill'].'_'.rand(1,1000)]);//-3代表拼箱后继续增加产品，那么需要把原单据状态设为-3代表已作废
            }

            $data['pack_bill'] = $input['pack_bill'];
            $data['exec_qrcode'] = $input['exec_qrcode'];
            $data['print_code'] = $input['print_code'];
            $data['size'] = $input['size'];
            $data['weight'] = $input['weight'];
            $data['pnote'] = urldecode($input['pnote']);
            $data['order_no'] = $input['order_no'];
            $data['cust_no'] = $input['cust_no'];
            $data['operateman'] = $input['modman'];
            $data['moddate'] = time();
            $data['modman'] = $input['modman'];

            $arr = $input['boxinfo'];
            $result = SysPublic::getDateWiseScore($arr, 'aexec_qrcode', 'box_num');

            foreach ($result as $key => $val) {
                $exec_qrcode = strstr($key, '/', true);
                $printid = trim(strrchr($key, '/'), '/');

                $exec_boxnum = Printlist::where('exec_qrcode', $exec_qrcode)->where('print_code', $printid)->first();

                if ($exec_boxnum['pstate'] <> 3) {
                    $df = '{"errorcode":"301","success":"false"}';
                    return $df;
                } else {
                    $curpacksum = Package_det::join('package', 'package.id', '=', 'package_det.pack_id')->where('package.pstate', 1)->where('print_code', $printid)
                        ->where('exec_qrcode', $exec_qrcode)
                        ->select('exec_qrcode', 'print_code', DB::raw('sum(box_num) as box_sum'))->groupBy('exec_qrcode', 'print_code')->first();
                    if ($exec_boxnum['avaliable_quality'] - $curpacksum['box_sum'] - $val['box_num'] < 0) {
                        $df = '{"errorcode":"302","success":"false","aexec_qrcode":"' . $key . '"}';
                        return $df;
                    }
                }
            }
            $packid = DB::table('package')->insertGetId([
                'pack_bill' => $data['pack_bill'],
                'box_size' => $data['size'],
                'singal_weight' => $data['weight'],
                'box_size' => $data['size'],
                'order_no' => $data['order_no'],
                'cust_no' => $data['cust_no'],
                'pnote' => $data['pnote'],//$data['quality_level'],
                'pstate' => 0,
                'operateman' => $data['modman'],
                'moddate' => $data['moddate'],
                'modman' => $data['modman'],
            ]);
            if ($packid) {
                foreach ($arr as $key1 => $val1) {

                    $detid = DB::table('package_det')->insertGetId(['pack_id' => $packid,
                        'exec_qrcode' => $val1['exec_qrcode'],
                        'print_code' => $val1['print_code'],
                        'pcode' => $val1['pcode'],
                        'pname' => urldecode($val1['pname']),
                        'pstyle' => $val1['pstyle'],//$data['quality_level'],
                        'stove_code' => $val1['stove_code'],
                        'batch_no' => $val1['batch_no'],
                        'tag' => $val1['tag'],
                        'box_num' => $val1['box_num'],
                        'moddate' => time(),
                        'modman' => $data['modman']]);
                    if ($detid) {
                        $df = '{"errorcode":"200","success":"true"}';
                    } else {
                        $df = '{"errorcode":"202","success":"false"}';
                    }

                }
                /*
                */
            } else {
                $df = '{"errorcode":"201","success":"false"}';
            }

            return $df;
        } else {
            return $df;
        }
    }

    public function getpackagehistory($user, $packbill)
    {
        if ($packbill == -1)
            $packbill = '%';
        $rec = Package_det::join('package', 'package.id', '=', 'package_det.pack_id')
            ->Where(function ($query) use ($packbill) {
                $query->where('package.pack_bill', 'like', '%' . $packbill . '%')
                    ->orwhere('package.order_no', 'like', '%' . $packbill . '%')
                    ->orwhere('package_det.pname', 'like', '%' . $packbill . '%');
            })
            ->where('package.operateman', $user)
            ->select('package_det.exec_qrcode', 'package_det.print_code', 'package_det.pcode', 'package_det.pname', DB::raw('IFNULL(t_package_det.tag,"") as tag'), 'package_det.pstyle', 'package_det.stove_code', 'package_det.box_num', 'package.modman', 'package.operateman', 'package.pack_bill', 'package.order_no', 'package.moddate')
            ->orderBy('package.moddate', 'desc')->take(200)->get();
        $data = json_encode($rec);
        return $data;
    }

    /*
        public function getpackagehistory($usercode)
        {
            $rec=Package_det::join('package','package.id','=','package_det.pack_id')->where('package.modman',$usercode)
                ->select('package_det.exec_qrcode','package_det.print_code','package_det.pcode','package_det.pname','package_det.pstyle','package_det.stove_code','package_det.box_num','package.modman','package.pack_bill','package.moddate')
                ->orderBy('package.moddate','desc')->take(200)->get();
            $data = json_encode($rec);
            return $data;
        }
    */

    public function reprintpackage($packbill, $usercode)
    {

        $packprint = DB::table('package_print_rec')->insertGetId([
            'packbill' => $packbill,
            'usercode' => $usercode,
            'moddate' => time(),
            'modman' => $usercode,
        ]);
        $data = Package::where('pack_bill', $packbill)->first();
        if (empty($data)) {
            $data1 = '';
        } else {
            $data = $data->toarray();
        }

        $datadet = Package_det::where('pack_id', $data['id'])->get();
        $data['packdet'] = $datadet;
        $data1 = json_encode($data);
        return $data1;
    }


    public function packagelist()
    {
        $data=Package::leftjoin('package_det','package.id','=','package_det.pack_id')
            ->leftjoin('user2','package.modman','=','user2.user_name')
            ->where('package.pstate','1')
            ->orderBy('package.id','desc')->paginate(20);
        return view('admin.package.packagesearch' ,compact('data'));
    }
    public function findpackage()
    {
        $input=Input::all();
        $data=Package::leftjoin('package_det','package.id','=','package_det.pack_id')
            ->leftjoin('user2','package.modman','=','user2.user_name')
            ->where('package.pack_bill','like','%'.$input['keywords'].'%')
            ->orwhere('package_det.pcode','like','%'.$input['keywords'].'%')
            ->where('package.pstate','1')
            ->orderBy('id','desc')
            ->paginate(20);
        $data->appends(['keywords' => $input['keywords']])->render();
        return view('admin.package.packagesearch' ,compact('data'));

    }

}

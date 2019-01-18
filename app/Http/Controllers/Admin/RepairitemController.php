<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/7 0007
 * Time: 13:08
 */

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Requests;
use App\Http\Model\Admin\Repair_item;
use App\Http\Model\Admin\Repair_settle;
use App\Http\Model\Admin\User2;
use App\Http\Model\Admin\Depart;
use Validator;
use DB;




class RepairitemController extends CommonController
{
    public function index(){
        return view('admin.repairitem.index');
    }
    //员工报表
    public function repairman(Request $request){
        if($input = Input::all()) {
            isset($input['shop_id'])?$shop_id=$input['shop_id']:$shop_id=null;
            isset($input['start_date'])?$start_date=strtotime($input['start_date']):$start_date=0;
            isset($input['end_date'])?$end_date=strtotime($input['end_date']):$end_date=null;
            isset($input['keywords'])?$keywords=$input['keywords']:$keywords=null;

            $data = Repair_settle::leftjoin('user2','user2.user_name','=','repair_settle.operateman')
                ->leftjoin('repair_item','repair_item.repair_bill','=','repair_settle.repair_bill')
                ->groupby('repair_settle.operateman')
                ->where(function ($query) use ($shop_id){
                    if($shop_id){
                        $query->where('repair_item.shop_id',$shop_id);
                    }
                })
                ->where(function ($query) use ($start_date){
                    if($start_date){
                        $query->where('repair_settle.createdate','>',$start_date);
                    }
                })
                ->where(function ($query) use ($end_date){
                    if($end_date){
                        $query->where('repair_settle.createdate','<',$end_date+86400); //包括结束日期当天全天
                    }
                })
                ->where(function ($query) use ($keywords){
                    if($keywords){
                        $query->where('user2.cn_name','like',"%$keywords%")
                                ->orWhere('user2.user_name','like',"%$keywords%");
                    }
                })
                ->select(DB::raw('count(rep_settle =1 or null) as complete'),
                         DB::raw('count(rep_settle =0 or null) as fail'),
                         DB::raw('count(review_star =1 or null) as one_star'),
                         DB::raw('count(review_star =2 or null) as two_star'),
                         DB::raw('count(review_star =3 or null) as three_star'),
                         DB::raw('count(review_star =4 or null) as four_star'),
                         DB::raw('count(review_star =5 or null) as five_star'),
                        'repair_settle.operateman',DB::raw('
                        max(cn_name) as cn_name'))
                ->paginate(20);
            $depart = (new Depart())->getDepartInfo();
            $request->flash();
//            dd($data);
            return view('admin.repairitem.repairman',compact('depart','data','start_date','end_date'));
        }else{

            $depart = (new Depart())->getDepartInfo();
            return view('admin.repairitem.repairman',compact('depart'));
        }
    }

    public function repairman_show($operateman,$start_date=null,$end_date=null,$star=null,$rep_settle=null,$keywords=null,Request $request){


        if($input = Input::all()) {

            isset($input['start_date']) ? $start_date = strtotime($input['start_date']) : $start_date = null; //如果设置了开始日期，获取开始日期赋值,否则接下来的查询，开始时间为null
            isset($input['end_date']) ? $end_date = strtotime($input['end_date']) : $end_date = null;
            isset($input['keywords']) ? $keywords = $input['keywords'] : $keywords = null;
            isset($input['star']) ? $star = $input['star'] :$star = null;
            isset($input['rep_settle']) ? $rep_settle = $input['rep_settle'] :$rep_settle = null;
        }
//        dd($input);
            $data = Repair_settle::leftjoin('repair_item', 'repair_item.repair_bill', '=', 'repair_settle.repair_bill')
                ->leftjoin(DB::raw('(select * from t_dict where dic_cat="alert_type") as c '), DB::raw('c.dic_item_code'), '=', 'repair_settle.alert_type')
                ->leftjoin('repair_alert_type', 'repair_alert_type.atd_id', '=', 'repair_settle.alert_typedet')
                ->leftjoin('depart', 'depart.id', '=', 'repair_item.shop_id')
                ->leftjoin('section', 'section.s_id', '=', 'repair_item.sect_code')
                ->leftjoin('device', 'device.device_code', '=', 'repair_item.device_code')
                ->leftjoin('user2','user2.user_name','=','repair_item.createman')
                ->where('repair_settle.operateman', $operateman)
                ->where(function ($query) use ($start_date) {
                    if ($start_date) {
                        $query->where('repair_settle.createdate', '>', $start_date);
                    }
                })
                ->where(function ($query) use ($end_date) {
                    if ($end_date) {
                        $query->where('repair_settle.createdate', '<', $end_date + 86400); //包括结束日期当天全天
                    }
                })
                ->where(function ($query) use ($keywords){
                    if($keywords){
                        $query->where('repair_settle.repair_bill','like',"%$keywords%");

                    }
                })
                ->where(function ($query) use ($star){
                    if($star){
                        $query->where('repair_item.review_star',$star);

                    }
                })
                ->where(function ($query) use ($rep_settle){
                    if($rep_settle=='0'||$rep_settle=='1'){ //防止传入参数0导致if判断为false
                        $query->where('repair_settle.rep_settle',$rep_settle);

                    }
                })
                ->orderby('repair_settle.createdate','desc')
                ->select( 'repair_item.*','repair_settle.*', DB::raw('c.dic_item_name as alert_type'), 'repair_alert_type.alert_typedet',
                    'depart.Dpt_name', 'section.sect_name', 'device.device_name','user2.cn_name  as createman_name')
                ->paginate(20);
            $repairman = User2::where('user_name', $operateman)->first();
            $request->flash();
//dd($data);
            return view('admin.repairitem.repairman_show', compact('data', 'repairman','start_date','end_date'));
    }

    public function repairman_show_edit($repair_bill){ //修改人员报表信息
            $data = Repair_settle::leftjoin('repair_item', 'repair_item.repair_bill', '=', 'repair_settle.repair_bill')
                    ->leftjoin('user2','user2.user_name','=','repair_settle.operateman')
                    ->leftjoin(DB::raw('(select * from t_dict where dic_cat="alert_type") as c '), DB::raw('c.dic_item_code'), '=', 'repair_settle.alert_type')
                    ->leftjoin('repair_alert_type', 'repair_alert_type.atd_id', '=', 'repair_settle.alert_typedet')
                    ->leftjoin('depart', 'depart.id', '=', 'repair_item.shop_id')
                    ->leftjoin('section', 'section.s_id', '=', 'repair_item.sect_code')
                    ->leftjoin('device', 'device.device_code', '=', 'repair_item.device_code')
                    ->where('repair_settle.repair_bill',$repair_bill)
                    ->select('repair_item.*','repair_settle.*','user2.cn_name as operateman_name',DB::raw('c.dic_item_name as alert_type'), 'repair_alert_type.alert_typedet',
                        'depart.Dpt_name', 'section.sect_name', 'device.device_name')
                    ->first();

            return view('admin.repairitem.repair_edit',compact('data'));
    }
    public function repairman_show_update(){ //保存人员修改信息
        $input = Input::except('_token');

        $re = Repair_item::where('repair_bill',$input['repair_bill'])->update($input);
        if($re){
            $data =[
                'status' => 1,
                'msg' =>'更新成功'
            ];
        }else{
            $data =[
                'status' => 0,
                'msg' =>'更新失败'
            ];
        }
        return $data;
    }




    public function show_map($longitude=null,$latitude=null){
        return view('admin.repairitem/show_map',compact('longitude','latitude'));//路由传参到视图

    }

    public function show_maps($operateman,$start_date=null,$end_date=null){
        $data = Repair_settle::leftjoin('repair_item', 'repair_item.repair_bill', '=', 'repair_settle.repair_bill')
                        ->where('repair_settle.operateman', $operateman)
                        ->where('repair_item.pstate','>','0') //已完成签到的
                        ->where(function ($query) use ($start_date) {
                            if ($start_date) {
                                $query->where('repair_settle.createdate', '>', $start_date);
                            }
                        })
                        ->where(function ($query) use ($end_date) {
                            if ($end_date) {
                                $query->where('repair_settle.createdate', '<', $end_date + 86400); //包括结束日期当天全天
                            }
                        })->select('repair_item.check_lng','repair_item.check_lat','repair_item.checkdate',
                                   'repair_settle.repair_bill' )->get();


        return view('admin.repairitem.show_maps',compact('data'));
    }

    //车间报表
    public function shop(Request $request){
            $input = Input::all();
            isset($input['start_date']) ? $start_date = strtotime($input['start_date']) : $start_date = 0;
            isset($input['end_date']) ? $end_date = strtotime($input['end_date']) : $end_date = null;

        $data = Repair_item::leftjoin('repair_settle','repair_item.repair_bill','=','repair_settle.repair_bill')
            ->leftjoin('depart','depart.id','=','repair_item.shop_id')
            ->groupby('repair_item.shop_id')
            ->whereNotNull('repair_item.shop_id')//没有定义车间信息的不计入统计
            ->where(function ($query) use ($start_date){
                if($start_date){
                    $query->where('repair_settle.createdate','>',$start_date);
                }
            })
            ->where(function ($query) use ($end_date){
                if($end_date){
                    $query->where('repair_settle.createdate','<',$end_date+86400); //包括结束日期当天全天
                }
            })
            ->select(
                DB::raw('count(rep_settle =1 or null) as complete'),
                DB::raw('count(rep_settle =0 or null) as fail'),
                DB::raw('count(review_star =1 or null) as one_star'),
                DB::raw('count(review_star =2 or null) as two_star'),
                DB::raw('count(review_star =3 or null) as three_star'),
                DB::raw('count(review_star =4 or null) as four_star'),
                DB::raw('count(review_star =5 or null) as five_star'),
                'depart.Dpt_name','repair_item.shop_id')
            ->paginate(20);
            $request->flash();

            return view('admin.repairitem.shop',compact('data','start_date','end_date'));

    }


    public function shop_show($shop_id=null,$start_date=null,$end_date=null,$star=null,$rep_settle=null,$keywords=null,Request $request){
        if($input = Input::all()) { //如果有请求输入值

            isset($input['start_date']) ? $start_date = strtotime($input['start_date']) : $start_date = null; //如果设置了开始日期，获取开始日期赋值,否则接下来的查询，开始时间为null
            isset($input['end_date']) ? $end_date = strtotime($input['end_date']) : $end_date = null;
            isset($input['keywords']) ? $keywords = $input['keywords'] : $keywords = null;
            isset($input['star']) ? $star = $input['star'] :$star = null;
            isset($input['rep_settle']) ? $rep_settle = $input['rep_settle'] :$rep_settle = null;
        }
        $data = Repair_item::leftjoin('repair_settle', 'repair_item.repair_bill', '=', 'repair_settle.repair_bill')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="alert_type") as c '), DB::raw('c.dic_item_code'), '=', 'repair_settle.alert_type')
            ->leftjoin('repair_alert_type', 'repair_alert_type.atd_id', '=', 'repair_settle.alert_typedet')
            ->leftjoin('section', 'section.s_id', '=', 'repair_item.sect_code')
            ->leftjoin('device', 'device.device_code', '=', 'repair_item.device_code')
            ->leftjoin('user2','user2.user_name','=','repair_item.createman')

            ->where(function ($query) use ($shop_id) {
                if ($shop_id) {
                    $query->where('repair_item.shop_id', '=', $shop_id);
                }
            })
            ->where(function ($query) use ($start_date) {
                if ($start_date) {
                    $query->where('repair_item.createdate', '>', $start_date);
                }
            })
            ->where(function ($query) use ($end_date) {
                if ($end_date) {
                    $query->where('repair_item.createdate', '<', $end_date + 86400); //包括结束日期当天全天
                }
            })
            ->where(function ($query) use ($keywords){//根据关键字查询
                if($keywords){
                    $query->where('repair_settle.repair_bill','like',"%$keywords%");

                }
            })
            ->where(function ($query) use ($star) {//根据星级查询
                if ($star) {
                    $query->where('repair_item.review_star', $star);
                }
            })
            ->where(function ($query) use ($rep_settle){ //根据问题解决情况查询
                if($rep_settle=='0'||$rep_settle=='1'){ //防止传入参数0导致if判断为false
                    $query->where('repair_settle.rep_settle',$rep_settle);

                }
            })

            ->orderby('repair_settle.createdate','desc')
            ->select( 'repair_item.*','repair_settle.rep_settle', DB::raw('c.dic_item_name as alert_type'), 'repair_alert_type.alert_typedet',
                 'section.sect_name', 'device.device_name','user2.cn_name as createman_name')
            ->paginate(20);



        $shop = Depart::where('id', $shop_id)->first();
        $request->flash();
        return view('admin.repairitem.shop_show', compact('data', 'shop','start_date','end_date'));
    }


    public function shop_show_edit($repair_bill){ //修改车间报表信息
        $data = Repair_item::leftjoin('repair_settle', 'repair_item.repair_bill', '=', 'repair_settle.repair_bill')
            ->leftjoin('user2','user2.user_name','=','repair_settle.operateman')
            ->leftjoin(DB::raw('(select * from t_dict where dic_cat="alert_type") as c '), DB::raw('c.dic_item_code'), '=', 'repair_settle.alert_type')
            ->leftjoin('repair_alert_type', 'repair_alert_type.atd_id', '=', 'repair_settle.alert_typedet')
            ->leftjoin('depart', 'depart.id', '=', 'repair_item.shop_id')
            ->leftjoin('section', 'section.s_id', '=', 'repair_item.sect_code')
            ->leftjoin('device', 'device.device_code', '=', 'repair_item.device_code')
            ->where('repair_item.repair_bill',$repair_bill)
            ->select('repair_settle.*','repair_item.*','user2.cn_name as operateman_name',DB::raw('c.dic_item_name as alert_type'), 'repair_alert_type.alert_typedet',
                'depart.Dpt_name', 'section.sect_name', 'device.device_name')
            ->first();
//        dd($data);
        return view('admin.repairitem.repair_edit',compact('data'));
    }
    public function shop_show_update(){ //保存车间修改信息
        $input = Input::except('_token');

        $re = Repair_item::where('repair_bill',$input['repair_bill'])->update($input);
        if($re){
            $data =[
                'status' => 1,
                'msg' =>'更新成功'
            ];
        }else{
            $data =[
                'status' => 0,
                'msg' =>'更新失败'
            ];
        }
        return $data;
    }


    //历史记录

    public function history(Request $request){
        if($input = Input::all()){

            isset($input['start_date']) ? $start_date = strtotime($input['start_date']) : $start_date = null;
            isset($input['end_date']) ? $end_date = strtotime($input['end_date']) : $end_date = null;
            isset($input['keywords']) ? $keywords = $input['keywords'] : $keywords = null;

            $data = Repair_item::leftjoin('repair_settle','repair_settle.repair_bill','=','repair_item.repair_bill')
                ->leftjoin('user2','user2.user_name','repair_settle.operateman')
                ->leftjoin('depart', 'depart.id', '=', 'repair_item.shop_id')
                ->leftjoin('section', 'section.s_id', '=', 'repair_item.sect_code')
                ->leftjoin('device', 'device.device_code', '=', 'repair_item.device_code')
                ->leftjoin(DB::raw('(select * from t_dict where dic_cat="alert_type") as c '), DB::raw('c.dic_item_code'), '=', 'repair_settle.alert_type')
                ->leftjoin('repair_alert_type', 'repair_alert_type.atd_id', '=', 'repair_settle.alert_typedet')
                ->where(function ($query) use ($start_date) {
                    if ($start_date) {
                        $query->where('repair_item.createdate', '>', $start_date);
                    }
                })
                ->where(function ($query) use ($end_date) {
                    if ($end_date) {
                        $query->where('repair_item.createdate', '<', $end_date + 86400); //包括结束日期当天全天
                    }
                })
                ->where(function ($query) use ($keywords){
                    if($keywords){
                        $query->where('repair_bill','like',"%$keywords%");
                    }
                })
                ->orderby('createdate','desc')
                ->select('repair_item.*','depart.Dpt_Name','section.sect_name',
                    DB::raw('c.dic_item_name as alert_type'), 'repair_alert_type.alert_typedet',
                    'device.device_name','user2.cn_name as repairman')
                ->paginate(20);
//            dd($data);

            $request->flash();

            return view('admin.repairitem.history',compact('data'));
        }else{
            return view('admin.repairitem.history');
        }

    }




    //显示签到和异常图片弹出框

    public function show_image(){
        $src = Input::get('src');

        return view('admin.repairitem.show_image',compact('src'));
    }


}
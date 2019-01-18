<?php
/**
 * Created by PhpStorm.
 * User: 丁峰
 * Date: 2018-03-08
 * Time: 12:59
 * 丁峰
 * 丁峰  公共函数  18-3-8
 * 定义各模块通用函数
 */

namespace App\Http\Model\Admin;

use App\Http\Model\Admin\Autocode;
use Illuminate\Support\Facades\DB;

class SysPublic
{
    public static function makecode($num = 4)
    {
        $re = '';
        $s = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        while (strlen($re) < $num) {
            $re .= $s[rand(0, strlen($s) - 1)]; //从$s中随机产生一个字符
        }
        return $re;
    }

    public static function getautocode($modelname)
    {
        $BillCode = '';
        $KeyField = '';
        $pzero = '';
        $cdata = Autocode::where('Frm_Name', $modelname)->first();

        if ($cdata) {
            for ($i = 0; $i < $cdata['zerolen']; $i++) {
                $pzero = $pzero . '0';
            }

            if ($cdata['is_bit'] == 0) {
                // dd(date('Ymd', time()));
                if (date('Ymd', time()) == $cdata['lastdate']) {
                    $lastvalue = $cdata['RecValue'] + $cdata['AddValue'];
                    //  dd($cdata['addvalue']);;
                    $p = $pzero . $lastvalue;
                    $pvalue = substr($p, -1 * $cdata['zerolen']);
                    $billcode = $cdata['prefix'] . date($cdata['Slave_Code'], time()) . $pvalue;
                    Autocode::where('Frm_Name', $modelname)->update(array('RecValue' => $lastvalue));
                    return $billcode;
                } else {
                    $p = $pzero . '1';
                    $pvalue = substr($p, -1 * $cdata['zerolen']);
                    $billcode = $cdata['prefix'] . date('Ymd', time()) . $pvalue;
                    Autocode::where('Frm_Name', $modelname)->update(array('RecValue' => 1, 'lastdate' => date('Ymd', time())));
                    return $billcode;
                }
            }

        }

    }


//对数组分组求和，groupid是分组项，groupvalue是求和数值
    public static function getDateWiseScore($data, $groupid, $groupvalue)
    {
        $groups = array();
        $key = 0;
        foreach ($data as $item) {
            $key = $item[$groupid];
            if (!array_key_exists($key, $groups)) {
                $groups[$key] = array(
                    'id' => $item[$groupid],
                    $groupvalue => $item[$groupvalue],
                );
            } else {
                $groups[$key][$groupvalue] = $groups[$key][$groupvalue] + $item[$groupvalue];
            }
            $key++;
        }
        return $groups;
    }

    //短信综合调用函数
    public static function SmsVerData($exec_qrcode, $print_code, $artdet_id)
    {
        $smsver = Sms_Template::leftjoin('sms_tempartdet', 'sms_tempartdet.temp_id', '=', 'sms_template.id')
            ->where('sms_tempartdet.artdet_id', $artdet_id)
            ->select('sms_template.*', 'sms_tempartdet.temp_id', 'sms_tempartdet.pcode', 'sms_tempartdet.pname', 'sms_tempartdet.art_id', 'sms_tempartdet.artdet_id', 'sms_tempartdet.artdet_name')
            ->get();
        if (!empty($smsver)) {
            foreach ($smsver as $val)
                if ($val['func_name'] == 'VerManufactureData') {//锻压工序异常提醒
                    SysPublic::VerManufactureData($exec_qrcode, $val['temp_code'], $artdet_id);
                } else if ($val['func_name'] == 'VerPrintNum') {//校验是否每个流转箱都已使用
                    //     SysPublic::VerPrintNum($exec_qrcode, $val['temp_code'], $artdet_id);
                }
        }
    }

    //短信用锻压生产数量损耗校验函数基本思路：计算操作表指定工序数量，
    public static function VerManufactureData($exec_qrcode, $temp_code, $artdet_id)
    {
        $value = array(
            'state' => 0
        );
        $alertdata = Sms_Alertrec::where('exec_qrcode', $exec_qrcode)->where('artdet_id', $artdet_id)->first();

        if (!$alertdata) {
            //校验该工序是否为短信监控工序
            $operdata = Plan_operater::where('exec_qrcode', $exec_qrcode)->where('artdet_id', $artdet_id)
                ->select('exec_qrcode', 'artdet_id', DB::raw('sum(t_plan_operater.o_valiable_num) as o_valiable_sum'),
                    DB::raw('sum(t_plan_operater.o_unvaliable_num) as o_unvaliable_sum'),
                    DB::raw('sum(t_plan_operater.o_valiable_num+t_plan_operater.o_unvaliable_num) as oper_sum'))
                ->groupBy('exec_qrcode', 'artdet_id')->first();

            $planexecdata = Planexec::where('plan_exec.exec_qrcode', $exec_qrcode)
                ->select('exec_qrcode', 'material_num as material_sum')->first();

            $printlistdata = Printlist::where('plan_print_list.exec_qrcode', $exec_qrcode)
                ->select('plan_print_list.exec_qrcode',
                    DB::raw('sum(t_plan_print_list.box_quality) as box_quality'))
                ->groupBy('plan_print_list.exec_qrcode')->first();

            $rmdata = Planexec::leftjoin('plan_exec_rm', 'plan_exec.id', '=', 'plan_exec_rm.exec_id')
                ->where('plan_exec.exec_qrcode', $exec_qrcode)
                ->select('plan_exec.exec_qrcode', DB::raw('sum(t_plan_exec_rm.rm_num) as rm_sum'))
                ->groupBy('plan_exec.exec_qrcode')->first();

            if ($planexecdata and $operdata and $printlistdata) {
                $cal = ($operdata['o_valiable_sum'] + $rmdata['rm_sum']) / $planexecdata['material_sum'];//计算实际下料数量
                if ($cal < 0.9) {
                    $value = array(
                        'exec_qrcode' => $exec_qrcode,
                        'artdet_id' => $artdet_id,
                        'temp_code' => $temp_code,
                        'material_sum' => $planexecdata['material_sum'],
                        'box_quality' => $printlistdata['box_quality'],
                        'rm_sum' => $rmdata['rm_sum'],
                        'smsstate' => 1,
                        'o_valiable_sum' => $operdata['o_valiable_sum'],
                        'o_unvaliable_sum' => $operdata['o_unvaliable_sum'],
                        'oper_sum' => $operdata['oper_sum'],
                        'state' => 1,
                    );
                    Sms_Alertrec::create($value);
                } else {
                    $value = array(
                        'exec_qrcode' => $exec_qrcode,
                        'artdet_id' => $artdet_id,
                        'state' => 0
                    );
                }
            }


        } else {
            $value = array(
                'state' => 0
            );
        }

        return $value;
    }

//校验该执行计划是否使用系统称重
    public static function VerAssistWeight($exec_qrcode, $print_code)
    {
        $value = array(
            'state' => 0
        );
//查询功能函数为“VerAssistWeight”的模板编号
        $smstemp=Sms_Template::where('func_name','VerAssistWeight')->first();

//验证
        $alertdata = Sms_Alertrec::where('exec_qrcode', $exec_qrcode)->where('print_code', $print_code)->where('temp_code', $smstemp['temp_code'])->first();

        if (!$alertdata) {
//判断printlist表中称重来源单号是否为空，
            $printdata = Printlist::where('exec_qrcode', $exec_qrcode)->where('print_code', $print_code)->first();

            $weightdata = Out_sourced_weight::leftjoin('out_sourced_weight_detail', 'out_sourced_weight_detail.bill_no', '=', 'out_sourced_weight.bill_no')
                ->where('out_sourced_weight.exec_qrcode', $exec_qrcode)->where('out_sourced_weight_detail.print_code', $print_code)->select('out_sourced_weight.*', 'out_sourced_weight_detail.weightnet')->first();
//dd($weightdata);
            $calbasic = round($weightdata['weightnet'] / $weightdata['unit_samp_weight']);
            $calplus = $calbasic + $calbasic * 0.05;
            $calminus = $calbasic - ($calbasic * 0.05);
            if ($printdata['source_bill'] <> "" and ($printdata['box_quality'] > $calplus || $printdata['box_quality'] < $calminus)) {

                $value = array(
                    'exec_qrcode' => $exec_qrcode,
                    'print_code' => $print_code,
                    'pname'=>$printdata['pname'],
                    'weight_num'=>$calbasic,
                    'box_quality'=>$printdata['box_quality'],
                    'temp_code' => $smstemp['temp_code'],
                    'smsstate' => 1,
                    'state' => 1,
                );
                Sms_Alertrec::create($value);

            }
        } else {
            $value = array(
                'state' => 0
            );
        }
        return $value;
    }

    //校验是否每个流转箱都在实际使用流转中而不是空下单
    public function VerPrintNum($exec_qrcode, $temp_code, $artdet_id)
    {

    }
}

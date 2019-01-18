<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Repair_history extends Model
{
    //
    protected  $table='repair_history';
    protected  $primaryKey='id';
    public $timestamps=false;
    protected $guarded=[];

    public function getModdateAttribute($value){
        if($value != null || $value !='') {
            return date('Y-m-d h:m:s', $value);
        }else{
            return '';
        }
    }

    public function getCreatedateAttribute($value){
        if($value != null || $value !='') {
            return date('Y-m-d h:m:s', $value);
        }else{
            return '';
        }
    }

    public function getPstateAttribute($value){

            switch ($value){
                case '0':
                    return '未发送';
                    break;
                case '3':
                    return '已发送';
                    break;
                default:
                    return '未知状态';
                    break;
            }

    }
}

<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Repair_alert_type extends Model
{
    //
    protected  $table='repair_alert_type';
    protected  $primaryKey='atd_id';
    public $timestamps=false;
    protected $guarded=[];

    public function getModdateAttribute($value){
        if($value != null || $value !='') {
            return date('Y-m-d h:m:s', $value);
        }else{
            return '';
        }
    }
}

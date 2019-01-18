<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Repaircontact extends Model
{
    protected  $table='repair_contact';
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

    public function getStfSexAttribute($value){
        if($value =='M'){
            $sex = '男';
        }else{
            $sex = '女';
        }
        return $sex;
    }
}

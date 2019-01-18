<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Repair_item extends Model
{
    //
    protected  $table='repair_item';
    protected  $primaryKey='R_id';
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

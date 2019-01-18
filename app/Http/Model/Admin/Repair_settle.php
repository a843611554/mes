<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Repair_settle extends Model
{
    //
    protected  $table='repair_settle';
    protected  $primaryKey='s_id';
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

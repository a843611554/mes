<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Box_basic_info extends Model
{
    //
    protected  $table='box_basic_info';
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
}

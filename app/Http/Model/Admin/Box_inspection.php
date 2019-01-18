<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Box_inspection extends Model
{
    //
    protected  $table='box_inspection';
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

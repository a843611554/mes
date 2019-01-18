<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Bas_producebom extends Model
{
    //
    protected  $table='bas_producebom';
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

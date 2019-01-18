<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Section extends Model
{
    //
    protected  $table='section';
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

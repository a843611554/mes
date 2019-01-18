<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Plan_add_material extends Model
{
    //
    protected  $table='plan_add_material';
    protected  $primaryKey='id';
    public $timestamps=false;
    protected $guarded=[];

//    public function fromDateTime($value){
//        return strtotime(parent::fromDateTime($value));
//    }
}

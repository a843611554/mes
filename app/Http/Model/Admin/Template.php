<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Template extends Model
{
    //



    protected  $table='sms_template';
    protected  $primaryKey='id';
    public $timestamps=false;
    protected $guarded=[];
}
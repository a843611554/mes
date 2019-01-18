<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;


class Mobile extends Model
{

    protected  $table='sms_mobile';
    protected  $primaryKey='id';
    public $timestamps=false;
    protected $guarded=[];
}
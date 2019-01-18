<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Package_det extends Model
{
    //
    protected  $table='package_det';
    protected  $primaryKey='pdet_id';
    public $timestamps=false;
    protected $guarded=[];
}

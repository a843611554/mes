<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Planexec extends Model
{
    protected  $table='plan_exec';
    protected  $primaryKey='id';
    public $timestamps=false;
    protected $guarded=[];
}

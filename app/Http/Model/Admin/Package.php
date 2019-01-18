<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    //
    protected  $table='package';
    protected  $primaryKey='id';
    public $timestamps=false;
    protected $guarded=[];
}

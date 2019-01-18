<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Dict extends Model
{
    //
    protected  $table='dict';
    protected  $primaryKey='dic_id';
    public $timestamps=false;
    protected $guarded=[];
}

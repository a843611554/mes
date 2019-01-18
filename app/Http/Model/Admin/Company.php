<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    protected  $table='company';
    protected  $primaryKey='id';
    public $timestamps=false;
    protected $guarded=[];
}

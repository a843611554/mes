<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;


class Stock extends Model
{

    protected  $table='stock_inout';
    protected  $primaryKey='id';
    public $timestamps=false;
    protected $guarded=[];



}
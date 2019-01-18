<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;


class Stockoper extends Model
{

    protected  $table='stock_operate';
    protected  $primaryKey='Oper_code';
    public $timestamps=false;
    protected $guarded=[];
}
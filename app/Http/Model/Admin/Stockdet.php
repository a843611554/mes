<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;


class Stockdet extends Model
{

    protected  $table='stock_inoutdet';
    protected  $primaryKey='id';
    public $timestamps=false;
    protected $guarded=[];
}
<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;


class Customer extends Model
{

    protected  $table='cust_customer';
    protected  $primaryKey='cust_id';
    public $timestamps=false;
    protected $guarded=[];
}
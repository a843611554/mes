<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;


class User2 extends Model
{

    protected  $table='user2';
    protected  $primaryKey='id';
    public $timestamps=false;
    protected $guarded=[];
}
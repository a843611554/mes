<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Username extends Model
{
    protected  $table='user2';
    protected  $primaryKey='id';
    public $timestamps=false;
    protected $guarded=[];
}

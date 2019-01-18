<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Autocode extends Model
{
    //
    protected  $table='sys_autocode';
    protected  $primaryKey='pid';
    public $timestamps=false;
    protected $guarded=[];
}

<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Plan extends Model
{
    //
    protected  $table='plan';
    protected  $primaryKey='id';
    public $timestamps=false;
    protected $guarded=[];

    public function fromDateTime($value){
        return strtotime(parent::fromDateTime($value));
    }
}

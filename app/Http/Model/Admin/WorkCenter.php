<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class WorkCenter extends Model
{
    //
    protected $table = 'workcenter';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $guarded = [];


}

<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/30 0030
 * Time: 9:21
 */

namespace App\Http\Model;

use Illuminate\Database\Eloquent\Model;




class User extends Model
{
    protected  $table='user';
    protected  $primaryKey='user_id';
    public $timestamps=false;
}
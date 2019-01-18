<?php
namespace App\Http\Controllers\Test;

use App\Http\Controllers\Controller;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/29 0029
 * Time: 17:23
 */
class TestController extends Controller
{
    public function  index(){
        return view("test.index")->with("data",["name"=>"123"]);
    }
}
<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;
use App\Http\Model\Admin\Depart;
class Humstuff extends Model
{
    //
    protected  $table='hum_stuff';
    protected  $primaryKey='Stf_Id';
    public $timestamps=false;
    protected $guarded=[];

    //访问器
    public function getStfSexAttribute($value){
        if($value =='M'){
            $sex = '男';
        }else{
            $sex = '女';
        }
        return $sex;
    }

    public function getStoMarriageAttribute($value){
        if($value =='0'){
            return '未婚';
        }else{
            return '已婚';
        }
    }

    public function getStfForeignerAttribute($value){
        if($value == '0'){
            return '离职';
        }else{
            return '在职';
        }
    }


    public function getStfOSAttribute($value){
        if($value =='0'){
            return '允许';
        }else{
            return '不允许';
        }
    }

    public function getStfCheckedBitAttribute($value){
        if($value =='0'){
            return '不参与';
        }else{
            return '参与';
        }
    }

    public function getWtWorkTypeAttribute($value){
        if($value =='0'){
            return '临时工';
        }else{
            return '正式工';
        }
    }

    public function getStfRegularAttribute($value){
        if($value == null || $value=='') {
            return '';
        }else{
            return date('Y-m-d', $value);
        }
    }

    public function getStoGradDateAttribute($value){
        if($value == null || $value=='') {
            return '';
        }else{
            return date('Y-m-d', $value);
        }
    }
    public function getStfInFacAttribute($value){
        if($value == null || $value=='') {
            return '';
        }else{
            return date('Y-m-d', $value);
        }
    }
    public function getStfOutFacAttribute($value){
        if($value == null || $value=='') {
            return '';
        }else{
            return date('Y-m-d', $value);
        }
    }

    public function getStoEnterDateAttribute($value){
        if($value == null || $value=='') {
            return '';
        }else{
            return date('Y-m-d', $value);
        }

    }
    //修改器
    public function setStfInFacAttribute($value)
    {
        $this->attributes['Stf_Infac'] = strtotime($value);
    }
    public function setStfRegularAttribute($value)
    {
        $this->attributes['Stf_Regular'] = strtotime($value);
    }
    public function setStoGradDateAttribute($value)
    {
        $this->attributes['Sto_GradDate'] = strtotime($value);
    }
}

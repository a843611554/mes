<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Collection;

class Storage extends Model
{
    //
    protected  $table='stock_storage';
    protected  $primaryKey='Stor_id';
    public $timestamps=false;
    protected $guarded=[];

    public function getStor($sourceItems, $targetItems, $pid = 0,$sp='')
    {

        foreach ($sourceItems as $k => $v) {
            if ($v->Sp_ParentNo == $pid) {
                $targetItems[] = $v;
                $this->getStor($sourceItems, $targetItems, $v->Stor_id,$sp);

            }
        }
    }


    public function getStorInfo()
    {
        $sourceItems = $this->where('Stor_usable','1')->orderby('Stor_id', 'asc')->get(['Stor_id','Stor_code','Stor_name','Sp_ParentNo']);
        $targetItems = new Collection;
        $this->getStor($sourceItems, $targetItems);
        return $targetItems;
    }
}

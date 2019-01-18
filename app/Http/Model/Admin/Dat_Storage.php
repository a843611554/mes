<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Collection;

class Dat_Storage extends Model
{
    //
    protected  $table='dat_storage';
    protected  $primaryKey='Stor_id';
    public $timestamps=false;
    protected $guarded=[];

    public function getDatStor($sourceItems, $targetItems, $pid = 0,$sp='')
    {

        foreach ($sourceItems as $k => $v) {
            if ($v->Sp_ParentNo == $pid) {
                $targetItems[] = $v;
                $this->getDatStor($sourceItems, $targetItems, $v->Stor_id,$sp);

            }
        }
    }


    public function getDatStorInfo()
    {
        $sourceItems = $this->where('Stor_usable','1')->orderby('Stor_id', 'asc')->get(['Stor_id','Stor_code','Stor_name','Sp_ParentNo']);
        $targetItems = new Collection;
        $this->getDatStor($sourceItems, $targetItems);
        return $targetItems;
    }
}

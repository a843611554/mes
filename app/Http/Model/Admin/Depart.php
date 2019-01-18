<?php

namespace App\Http\Model\Admin;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Depart extends Model
{
    //
    protected $table = 'depart';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $guarded = [];


    public function getDepart($sourceItems, $targetItems, $pid = 0,$sp='')
    {
        $str = '├──';
        if ($pid==0)
            $sp .= '';
        else
            $sp .= '　　';
        foreach ($sourceItems as $k => $v) {
            if ($v->Parentid == $pid) {
                $v->Dpt_Name = $sp . $str . $v->Dpt_Name;
                $targetItems[] = $v;
                $this->getDepart($sourceItems, $targetItems, $v->id,$sp);

            }
        }
    }


    public function getDepartInfo()
    {
        $sourceItems = $this->where('pstate','1')->orderby('Dpt_Order', 'asc')->get();
        $targetItems = new Collection;
        $this->getDepart($sourceItems, $targetItems);
        return $targetItems;
    }

}

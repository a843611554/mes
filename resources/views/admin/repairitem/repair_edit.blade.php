@extends('layouts.admin')

@section('content')
    <table class="add_tab">
        <tr>
            <th>单号：</th>
            <td>@if(isset($data->repair_bill)){{$data->repair_bill}}@endif</td>

            <th>维修人：</th>
            <td>@if(isset($data->operateman_name)){{$data->operateman_name}}@endif</td>
        </tr>
        <tr>
            <th>车间：</th>
            <td>@if(isset($data->Dpt_name)){{$data->Dpt_name}}@endif</td>

            <th>分区：</th>
            <td>@if(isset($data->sect_name)){{$data->sect_name}}@endif</td>
        </tr>

        <tr>
            <th>维修类型：</th>
            <td>@if(isset($data->alert_type)){{$data->alert_type}}@endif</td>

            <th>维修明细：</th>
            <td>@if(isset($data->alert_typedet)){{$data->alert_typedet}}@endif</td>
        </tr>


        <tr>
            <th>订单状态：</th>
            <td colspan="3">
                待签到<input type="radio" name="pstate" value="0" @if($data->pstate==0) checked @endif>
                已签到<input type="radio" name="pstate" value="1" @if($data->pstate==1) checked @endif>
                已评价<input type="radio" name="pstate" value="4" @if($data->pstate==4) checked @endif>
            </td>
        </tr>
        <tr>
            <th>维修人状态：</th>
            <td colspan="3">
                待签到<input type="radio" name="settle_state" value="0" @if($data->settle_state==0) checked @endif>
                已签到<input type="radio" name="settle_state" value="1" @if($data->settle_state==1) checked @endif>
                已处理<input type="radio" name="settle_state" value="3" @if($data->settle_state==3) checked @endif>
            </td>
        </tr>

        <tr >
            <th>星级：</th>
            <td colspan="3">
                @for($i=1;$i<=5;$i++)
                    @if($data->review_star == $i)
                        {{$i}}星<input type="radio" name="review_star" value="{{$i}}" checked>
                    @else
                        {{$i}}星<input type="radio" name="review_star" value="{{$i}}">
                    @endif
                @endfor
            </td>

        </tr>
        <tr>
            <th >评价：</th>
            <td colspan="3">
                <input type='text' name="review_text" value="{{$data->review_text}}" id="review_text">
            </td>
        </tr>

    </table>
@endsection
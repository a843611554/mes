@extends('layouts.admin')

@section('content')

    <style>
        .rbtn{
            width: 250px;
            height: 110px;
            position: relative;
            border-radius: 30px;
            border: 2px solid;
            padding-left: 80px;
            padding-top: 60px;
            float: left;
            margin-left: 5%;
            margin-top: 15%;

        }
        a{
           color: #5e5e5e;
        }
    </style>

    <a href="{{url('admin/repairitem/repairman')}}">
        <div class="rbtn" >
            <h1>维修人员报表</h1>
        </div>
    </a>

    <a href="{{url('admin/repairitem/shop')}}">
        <div class="rbtn" >
            <h1>车间维修报表</h1>
        </div>
    </a>

    <a href="{{url('admin/repairitem/history')}}">
        <div class="rbtn" >
            <h1>历史报修记录</h1>
        </div>
    </a>
@endsection

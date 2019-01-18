@extends('layouts.admin')
@section('content')

    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="#">拼箱明细</a> &raquo;

    </div>
    <!--面包屑导航 结束-->

    <!--结果页快捷搜索框 开始-->
    {{--<div class="search_wrap">--}}
    {{--<form action="{{url('admin/company')}}" method="post">--}}
    {{--<table class="search_tab">--}}
    {{--<tr>--}}
    {{--<th width="70">关键字:</th>--}}
    {{--<td><input type="text" name="keywords" placeholder="关键字"></td>--}}
    {{--<td><input type="submit" name="sub" value="查询"></td>--}}
    {{--</tr>--}}
    {{--</table>--}}
    {{--</form>--}}
    {{--</div>--}}
    <!--结果页快捷搜索框 结束-->

    <!--搜索结果页面 列表 开始-->
    <form action="#" method="post">
        <div class="result_wrap">
            <!--快捷导航 开始-->
            <a  href="javascript:history.go(-1)">返回</a>
            <!--快捷导航 结束-->
        </div>

        <div class="result_wrap">
            <div class="result_content">
                <table class="list_tab">
                    <tr>
                        <th class="tc">ID</th>
                        <th>执行计划</th>
                        <th>箱号</th>
                        <th>产品编号</th>
                        <th>产品名称</th>
                        <th>型号</th>
                        <th>炉号</th>
                        <th>批号</th>
                        <th>箱数量</th>
                        <th>修改人</th>
                        <th>修改时间</th>
                    </tr>
                    @foreach($data as $v)
                            <tr>
                                <td>{{$v->pdet_id}}</td>
                                <td>
                                    {{$v->exec_qrcode}}
                                </td>
                                <td>{{$v->print_code}}</td>
                                <td>{{$v->pcode}}</td>
                                <td>{{$v->pname}}</td>
                                <td>{{$v->pstyle}}</td>
                                <td>{{$v->stove_code}}</td>
                                <td>{{$v->batch_no}}</td>
                                <td>{{$v->box_num}}</td>
                                <td>{{$v->modman}}</td>
                                <td>{{$v->moddate}}</td>

                            </tr>
                            @endforeach
                </table>


                <div class="page_list">
                    {{$data->links()}}
                </div>
            </div>
        </div>
    </form>
    <!--搜索结果页面 列表 结束-->


@endsection
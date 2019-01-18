@extends('layouts.admin')

@section('content')
    <link rel="stylesheet" type="text/css" href="{{asset('js/DatePicker/skin/jedate.css')}}"/>
    <script type="text/javascript" src="{{asset('js/DatePicker/jquery.jedate.js')}}"></script>
    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="{{url('admin/repairitem')}}">维修报表</a> &raquo; 历史记录
    </div>
    <!--面包屑导航 结束-->
    <!--搜索结果页面 列表 开始-->

    <form action="" method="post">
        {{csrf_field()}}
        <div class="result_wrap">
            <div class="result_title">
                <h3>快捷操作</h3>
            </div>
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <table class="search_tab"  >
                        <th>时间范围：</th>
                        <td>
                            <input type="text" readonly name="start_date" id="start_date" value="{{old('start_date')}}"> 至
                            <input type="text" readonly name="end_date" id="end_date" value="{{old('end_date')}}">
                        </td>


                        <th>关键字:</th>
                        <td>
                            <input type="text" name="keywords" placeholder="输入维修编号" value="{{old('keywords')}}">
                            <td><input type="submit"  value="查询"></td>
                        </td>
                    </table>
                </div>

            </div>
        </div>
    </form>
            <!--快捷导航 结束-->
    <div class="result_wrap">
        <div class="result_content">
            <table class="list_tab">
                <tr>
                    <th>维修单号</th>
                    <th>维修人</th>
                    <th>订单状态</th>
                    <th>维修人状态</th>
                    <th>车间</th>
                    <th>区域</th>
                    <th>设备</th>
                    <th>异常类型</th>
                    <th>异常明细</th>
                    <th>创建时间</th>
                    <th>创建人</th>

                </tr>
                <tbody>
                @if(isset($data))
                    @foreach($data as $v)
                        <tr>
                            <td>{{$v->repair_bill}}</td>
                            <td>{{$v->repairman}}</td>
                            <td>
                                @switch($v->pstate)
                                @case('0')
                                已提交
                                @break
                                @case('1')
                                已签到
                                @break
                                @case('4')
                                已评价
                                @break

                                @default

                                @endswitch
                            </td>
                            <td>
                                @switch($v->settle_state)
                                @case('0')
                                未签到
                                @break
                                @case('1')
                                已签到
                                @break
                                @case('3')
                                已处理
                                @break

                                @default

                                @endswitch
                            </td>
                            <td>{{$v->Dpt_Name}}</td>
                            <td>{{$v->sect_name}}</td>
                            <td>{{$v->device_name}}</td>
                            <td>{{$v->alert_type}}</td>
                            <td>{{$v->alert_typedet}}</td>
                            <td>@if(isset($v->createdate)){{date('Y-m-d h:m:s',$v->createdate)}}@endif</td>
                            <td>{{$v->createman}}</td>
                        </tr>
                    @endforeach

                </tbody>
            </table>
                <div class="page_list">
                    {{$data->links()}}
                </div>


                @endif

        </div>
    </div>

    <script>
        $(function () {
            $("#start_date").jeDate({
                format: "YYYY-MM-DD",
                skinCell: "jedateblue",
                onClose: true
            });
            $("#end_date").jeDate({
                format: "YYYY-MM-DD",
                skinCell: "jedateblue",
                onClose: true
            });
        });
    </script>


@endsection
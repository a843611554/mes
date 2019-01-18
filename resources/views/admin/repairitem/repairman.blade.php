@extends('layouts.admin')

@section('content')
    <link rel="stylesheet" type="text/css" href="{{asset('js/DatePicker/skin/jedate.css')}}"/>
    <script type="text/javascript" src="{{asset('js/DatePicker/jquery.jedate.js')}}"></script>
    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="{{url('admin/repairitem')}}">维修报表</a> &raquo; 维修人员
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
                        <th>车间:</th>
                        <td>
                            <select name="shop_id" id="shop_id">
                                <option value="">请选择车间</option>
                                @foreach($depart as $v)
                                    @if(old('shop_id')==$v->id)
                                        <option value="{{$v->id}}" selected>{{$v->Dpt_Name}}</option>
                                    @else
                                        <option value="{{$v->id}}">{{$v->Dpt_Name}}</option>
                                    @endif
                                @endforeach

                            </select>
                        </td>

                        <th>时间范围：</th>
                        <td>
                            <input type="text" readonly name="start_date" id="start_date" value="{{old('start_date')}}"> 至
                            <input type="text" readonly name="end_date" id="end_date" value="{{old('end_date')}}">
                        </td>


                        <th>关键字:</th>
                        <td>
                            <input type="text" name="keywords" placeholder="输入员工编号或姓名" value="{{old('keywords')}}">
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
                    <th>员工编号</th>
                    <th>员工姓名</th>
                    <th>已解决数量</th>
                    <th>未解决数量</th>
                    <th>五星评价数</th>
                    <th>四星评价数</th>
                    <th>三星评价数</th>
                    <th>二星评价数</th>
                    <th>一星评价数</th>
                    <th>查看签到点</th>

                </tr>
                <tbody>
                @if(isset($data))
                    @foreach($data as $v)
                        <tr>
                            <td><a href="{{url('admin/repairitem/repairman_show/'.$v->operateman.'/'.$start_date.'/'.$end_date)}}">{{$v->operateman}}</a></td>
                            <td>{{$v->cn_name}}</td>
                            <td><a href="{{url('admin/repairitem/repairman_show/'.$v->operateman.'/'.$start_date.'/'.$end_date.'?rep_settle=1')}}">{{$v->complete}}</a></td>
                            <td><a href="{{url('admin/repairitem/repairman_show/'.$v->operateman.'/'.$start_date.'/'.$end_date.'?rep_settle=0')}}">{{$v->fail}}</a></td>
                            <td><a href="{{url('admin/repairitem/repairman_show/'.$v->operateman.'/'.$start_date.'/'.$end_date).'/?star=5'}}">{{$v->five_star}}</a></td>
                            <td><a href="{{url('admin/repairitem/repairman_show/'.$v->operateman.'/'.$start_date.'/'.$end_date).'/?star=4'}}">{{$v->four_star}}</a></td>
                            <td><a href="{{url('admin/repairitem/repairman_show/'.$v->operateman.'/'.$start_date.'/'.$end_date).'/?star=3'}}">{{$v->three_star}}</a></td>
                            <td><a href="{{url('admin/repairitem/repairman_show/'.$v->operateman.'/'.$start_date.'/'.$end_date).'/?star=2'}}">{{$v->two_star}}</a></td>
                            <td><a href="{{url('admin/repairitem/repairman_show/'.$v->operateman.'/'.$start_date.'/'.$end_date).'/?star=1'}}">{{$v->one_star}}</a></td>
                            <td><a href="javascript:void(0)" onclick="show_maps('{{$v->operateman}}','{{strtotime(old('start_date'))}}','{{strtotime(old('end_date'))}}')">查看地图</a></td>

                        </tr>
                    @endforeach

                </tbody>
            </table>
                <div class="page_list">
                    {{$data->links()}}
                </div>


                @endif
            <div class="page_list">

            </div>
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
        function show_maps(operateman,start_date,end_date) {
            layer.open({
                title:'查看签到位置',
                type:2,
                area: ['600px', '600px'],
                fixed: false,
                shadeClose:true,
                maxmin: true,
                content: "{{url('admin/repairitem/show_maps')}}"+'/'+operateman+'/'+start_date+'/'+end_date
            });
        }
    </script>


@endsection
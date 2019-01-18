
@extends('layouts.admin')

@section('content')
    <link rel="stylesheet" type="text/css" href="{{asset('js/DatePicker/skin/jedate.css')}}"/>
    <script type="text/javascript" src="{{asset('js/DatePicker/jquery.jedate.js')}}"></script>
    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="{{url('admin/repairitem')}}">维修报表</a> &raquo; 车间报表
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
                        <td><input type="submit"  value="查询"></td>
                    </table>
                </div>

            </div>
        </div>
    </form>
            <!--快捷导航 结束-->
    <div class="result_wrap">
        <div class="result_content">
            <table class="list_tab">

                @if(isset($data))
                    <tr>
                        <th>车间</th>
                        <th>已解决数量</th>
                        <th>未解决数量</th>
                        <th>五星评价数量</th>
                        <th>四星评价数量</th>
                        <th>三星评价数量</th>
                        <th>二星评价数量</th>
                        <th>一星评价数量</th>

                    </tr>
                    @foreach($data as $v)
                        <tr>
                            <td><a href="{{url('admin/repairitem/shop_show/'.$v->shop_id.'/'.$start_date.'/'.$end_date)}}">{{$v->Dpt_name}}</a></td>
                            <td><a href="{{url('admin/repairitem/shop_show/'.$v->shop_id.'/'.$start_date.'/'.$end_date.'?rep_settle=1')}}">{{$v->complete}}</a></td>
                            <td><a href="{{url('admin/repairitem/shop_show/'.$v->shop_id.'/'.$start_date.'/'.$end_date.'?rep_settle=0')}}">{{$v->fail}}</a></td>
                            <td><a href="{{url('admin/repairitem/shop_show/'.$v->shop_id.'/'.$start_date.'/'.$end_date.'?star=5')}}">{{$v->five_star}}</a></td>
                            <td><a href="{{url('admin/repairitem/shop_show/'.$v->shop_id.'/'.$start_date.'/'.$end_date.'?star=4')}}">{{$v->four_star}}</a></td>
                            <td><a href="{{url('admin/repairitem/shop_show/'.$v->shop_id.'/'.$start_date.'/'.$end_date.'?star=3')}}">{{$v->three_star}}</a></td>
                            <td><a href="{{url('admin/repairitem/shop_show/'.$v->shop_id.'/'.$start_date.'/'.$end_date.'?star=2')}}">{{$v->two_star}}</a></td>
                            <td><a href="{{url('admin/repairitem/shop_show/'.$v->shop_id.'/'.$start_date.'/'.$end_date.'?star=1')}}">{{$v->one_star}}</a></td>
                        </tr>
                    @endforeach


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
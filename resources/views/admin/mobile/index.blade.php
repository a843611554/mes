@extends('layouts.admin')
@section('content')

    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">电话管理</a> &raquo; 电话列表
    </div>
    <!--面包屑导航 结束-->


    <!--搜索结果页面 列表 开始-->

    <form action="{{url('admin/mobile/search')}}" method="post">
        {{csrf_field()}}
        <div class="result_wrap">
            <div class="result_title">
                <h3>快捷操作</h3>

            </div>
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <a href="{{url('admin/mobile/create')}}"><i class="fa fa-plus"></i>新增电话</a>
                    <a href="{{url('admin/mobile/')}}"><i class="fa fa-refresh"></i>全部电话</a>
                    <table class="search_tab">
                        <tr>
                            <th width="70">关键字：</th>
                            <td><input type="text" name="keywords"  placeholder="输入关键字"></td>
                            <td><input type="submit"  value="查询"></td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--快捷导航 结束-->
        </div>

        <div class="result_wrap">
            <div class="result_content">
                <table class="list_tab">
                    <tr>


                        <th class="tc">ID</th>
                        <th>板块</th>
                        <th>电话号码</th>
                        <th>姓名</th>
                        <th>操作</th>
                    </tr>
                    @foreach($data as $v)
                        <tr>

                            <td class="tc">
                                {{$v->id}}
                            </td>

                            <td>
                                <a >{{$v->temp_name}}</a>
                            </td>

                            <td>
                                <a >{{$v->mobile}}</a>
                            </td>


                            <td>
                                <a >{{$v->hum_name}}</a>
                            </td>


                            <td>
                                <a href="{{url('admin/mobile/'.$v->id.'/edit')}}">修改</a>
                                <a href="javascript:void(0)" onclick="dellink({{$v->id}})">删除</a>
                            </td>
                        </tr>
                    @endforeach

                </table>

                <div class="pull_right">
                    {{ $data->links()}}
                </div>


            </div>
        </div>
    </form>


    <!--搜索结果页面 列表 结束-->
    <script>


        function dellink(id) {
            layer.confirm('您确定删除该电话号码吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('{{url('admin/mobile/')}}/' + id, {
                    '_method': 'delete',
                    '_token': '{{csrf_token()}}'
                }, function (data) {
                    if (data.status == 0) {
                        location.href= "{{url('admin/mobile/')}}";
                        layer.msg(data.msg, {icon: 6});
                    } else {
                        layer.msg(data.msg, {icon: 5});

                    }

                })

            }, function () {

            });


        }
    </script>

@endsection
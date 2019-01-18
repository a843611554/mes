@extends('layouts.admin')
@section('content')

    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">词典管理</a> &raquo; 词典列表
    </div>
    <!--面包屑导航 结束-->


    <!--搜索结果页面 列表 开始-->
    <form action="#" method="post">
        <div class="result_wrap">
            <div class="result_title">
                <h3>快捷操作</h3>

            </div>
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <a href="{{url('admin/dict/create')}}"><i class="fa fa-plus"></i>新增词典</a>
                    <a href="{{url('admin/dict/')}}"><i class="fa fa-refresh"></i>全部数据</a>
                </div>
            </div>
            <!--快捷导航 结束-->
        </div>

        <div class="result_wrap">
            <div class="result_content">
                <table class="list_tab">
                    <tr>
                        <th class="tc" width="5%">排序</th>

                        <th class="tc">ID</th>
                        <th>类别编号</th>
                        <th>类别名称</th>
                        <th>项目编号</th>
                        <th>项目名称</th>
                        <th>操作</th>
                    </tr>
                    @foreach($data as $v)
                        <tr>
                            <td class="tc"><input type="text" onchange="changeorder(this,{{$v->dic_id}})"
                                                  value="{{$v->dic_order}}">

                            </td>
                            <td class="tc">{{$v->dic_id}}</td>
                            <td>
                                <a href="#">{{$v->dic_cat}}</a>
                            </td>
                            <td>
                                <a href="#">{{$v->dic_cat_name}}</a>
                            </td>
                            <td>{{$v->dic_item_code}}</td>
                            <td>{{$v->dic_item_name}}</td>

                            <td>
                                <a href="{{url('admin/dict/'.$v->dic_id.'/edit')}}">修改</a>
                                <a href="javascript:void(0)" onclick="dellink({{$v->dic_id}})">删除</a>
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
        function changeorder(obj, dic_id) {
            var dic_order = $(obj).val();
            $.post('{{url('admin/dictangeorder')}}', {
                '_token': '{{csrf_token()}}',
                'dic_id': dic_id,
                'dic_order': dic_order
            }, function (data) {
                if (data.status == 0) {
                    layer.msg(data.msg, {icon: 6});
                } else {
                    layer.msg(data.msg, {icon: 5});

                }

            })
        }

        function dellink(nav_id) {
            layer.confirm('您删除该笔记录吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('{{url('admin/navs/')}}/' + nav_id, {
                    '_method': 'delete',
                    '_token': '{{csrf_token()}}'
                }, function (data) {
                    if (data.status == 0) {
                        location.href=location.href;
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


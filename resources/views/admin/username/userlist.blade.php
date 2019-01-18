@extends('layouts.admin')
@section('content')
    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="#">用户管理</a> &raquo; 添加用户
    </div>
    <!--面包屑导航 结束-->

    <!--结果页快捷搜索框 开始-->
    <div class="search_wrap">
        <form action="{{url('admin/user2key')}}" method="post">
            {{csrf_field()}}
            <table class="search_tab">
                <tr>
                    <th width="70">关键字:</th>
                    <td><input type="text" name="keywords"  placeholder="关键字"></td>
                    <td><input type="submit" name="sub" value="查询"></td>
                </tr>
            </table>
        </form>
    </div>
    <!--结果页快捷搜索框 结束-->

    <!--搜索结果页面 列表 开始-->
    <form action="#" method="post">
        <div class="result_wrap">
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <a href="{{url('admin/username/create')}}"><i class="fa fa-plus"></i>新增用户</a>
                    {{--<a href="#"><i class="fa fa-recycle"></i>批量删除</a>--}}
                    {{--<a href="#"><i class="fa fa-refresh"></i>更新排序</a>--}}
                </div>
            </div>
            <!--快捷导航 结束-->
        </div>

        <div class="result_wrap">
            <div class="result_content">
                <table class="list_tab">
                    <tr>
                        <th>用户名</th>
                        <th>中文名</th>
                        <th>组用户</th>
                        <th>所属公司</th>
                        <th>所属车间</th>
                        <th>工作中心</th>
                        <th>组员用户</th>
                        <th>操作</th>
                    </tr>
                    @foreach($data as $v)
                    <tr>
                        <td class="tc" style=" text-align: left; width: 10%" >{{$v->user_name}}</td>
                        <td class="tc" style=" text-align: left; width: 10%" >{{$v->cn_name}}</td>
                        <td class="tc" style=" text-align: left; width: 10%" >@if($v->isgroup==1) 组用户 @elseif($v->isgroup==0) 个人 @endif </td>
                        <td class="tc" style=" text-align: left; width: 10%">{{$v->company_name}}</td>
                        <td class="tc" style=" text-align: left; width: 10%">{{$v->Dpt_Name}}</td>
                        <td class="tc" style=" text-align: left; width: 10%">{{$v->wc_name}}</td>
                        <td class="tc" style=" text-align: left; width: 10%">@if($v->shop_role==0) 组员 @else 登录用户 @endif</td>
                        <td>
                            <a href="{{url('admin/username/'.$v->id.'/edit')}}">修改</a>
                            <a href="javascript:void(0)" onclick="delusername({{$v->id}})">删除</a>
                            <a href="javascript:void(0)" onclick="showpower({{$v->id}})">添加角色</a>
                        </td>
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
    <script>
        function delusername(user_id) {
            layer.confirm('您删除该笔记录吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('{{url('admin/username/')}}/' + user_id, {
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
        function showpower(pid) {
            layer.open({
                type: 2,
                area: ['800px', '600px'],
                fixed: false,
                maxmin: true,
                content: 'showrole/'+pid
            })
        }
    </script>

@endsection
@extends('layouts.admin')
@section('content')

    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="#">拼箱管理</a> &raquo;

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

            <!--快捷导航 结束-->
        </div>

        <div class="result_wrap">
            <div class="result_content">
                <table class="list_tab">
                    <tr>
                        <th class="tc">编号</th>
                        <th>订单号</th>
                        <th>客户号</th>
                        <th>箱尺寸</th>
                        <th>净重/毛重</th>
                        <th>说明</th>
                        <th>修改人</th>
                        <th>修改日期</th>
                        <th>审核状态</th>
                        <th>操作</th>
                    </tr>
                    @foreach($data as $v)
                        @if($v->pstate==0)
                            <tr style="color:#F00">
                        @else
                            <tr>
                                @endif
                                <td><a href="{{url('admin/package/packageDet/'.$v->id)}}">{{$v->pack_bill}}</a></td>
                                <td>
                                    {{$v->order_no}}
                                </td>
                                <td>{{$v->cust_no}}</td>
                                <td>{{$v->box_size}}</td>
                                <td>{{$v->singal_weight}}</td>
                                <td>{{$v->pnote}}</td>
                                <td>{{$v->modman}}</td>
                                <td>{{date('Y-m-d',$v->moddate)}}</td>
                                <td>@if($v->pstate==1)
                                        审核
                                    @elseif($v->pstate==-1)
                                       已作废
                                    @else
                                        <p> 未审核</p>
                                    @endif

                                </td>
                                <td>


                                    @if($v->pstate==0)
                                        <a href="{{url('admin/package/'.$v->id.'/edit')}}">修改</a>
                                        <a href="javascript:void(0)" onclick="delpackage({{$v->id}})">作废</a>
                                        <a href="javascript:void(0)" onclick="changepstate(this,{{$v->id}})">审核</a>

                                    @elseif($v->pstate==1)
                                        <a href="{{url('admin/packageCheckPrint/'.$v->id)}}">打印</a>
                                        <a href="javascript:void(0)" onclick="nochangepstate(this,{{$v->id}})">取消审核</a>

                                    @endif
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


        function delpackage(cate_id) {
            layer.confirm('您作废该笔记录吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('{{url('admin/package/')}}/' + cate_id, {
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


        function changepstate(obj, id) {
            layer.confirm('您确定审核该记录吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                var pstate = $(obj).val();
                $.post('{{url('admin/package/changepstate/')}}', {
                    'pstate': pstate,
                    'id':id,
                    '_token': '{{csrf_token()}}'
                }, function (data) {
                    if (data.status == 0) {
                        location.href = location.href;
                        layer.msg(data.msg, {icon: 6});
                    } else {
                        layer.msg(data.msg, {icon: 5});

                    }

                })

            }, function () {

            });

        }

        function nochangepstate(obj, id) {
            layer.confirm('您确定反审核该记录吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                var pstate = $(obj).val();
                $.post('{{url('admin/package/nochangepstate/')}}', {
                    'pstate': pstate,
                    'id':id,
                    '_token': '{{csrf_token()}}'
                }, function (data) {
                    if (data.status == 0) {
                        location.href = location.href;
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
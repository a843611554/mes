@extends('layouts.admin')
@section('content')

    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">异常管理</a> &raquo; 异常列表
    </div>
    <!--面包屑导航 结束-->


    <!--搜索结果页面 列表 开始-->

    <form action="{{url('admin/alert/search')}}" method="post">
        {{csrf_field()}}
        <div class="result_wrap">
            <div class="result_title">
                <h3>快捷操作</h3>

            </div>
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <a href="{{url('admin/alert/create')}}"><i class="fa fa-plus"></i>新增异常</a>
                    <a href="{{url('admin/alert/')}}"><i class="fa fa-refresh"></i>全部异常</a>
                    <table class="search_tab">
                        <tr>
                            <th>异常类型</th>
                            <td>
                                <select name="type_code">
                                    <option value="">选择异常类型查找</option>
                                    @foreach($alert_type as $v)
                                        @if(old('type_code') ==$v->dic_item_code)
                                            <option value="{{$v->dic_item_code}}" selected>{{$v->dic_item_name}}</option>
                                        @else
                                            <option value="{{$v->dic_item_code}}">{{$v->dic_item_name}}</option>
                                        @endif
                                    @endforeach
                                </select>
                            </td>

                            <th width="70">关键字：</th>
                            <td><input type="text" name="keywords"  placeholder="输入关键字" value="{{old('keywords')}}"></td>
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
                        <th>ID</th>
                        <th>异常分类</th>
                        <th>异常明细</th>
                        <th>修改人</th>
                        <th>修改时间</th>
                        <th>操作</th>
                    </tr>
                    @foreach($data as $v)
                    <tr>
                        <td>{{$v->atd_id}}</td>
                        <td>{{$v->alert_type_name}}</td>
                        <td>{{$v->alert_typedet}}</td>
                        <td>{{$v->modman}}</td>
                        <td>{{$v->moddate}}</td>
                        <td>
                            <a href="{{url('admin/alert/'.$v->atd_id.'/edit')}}"><i class="fa fa-pencil-square-o"></i>修改</a>
                            <a href="javascript:void(0)" onclick="del('{{$v->atd_id}}',this)"><i class="fa fa-trash-o"></i>删除</a>
                        </td>
                    </tr>
                    @endforeach


                </table>

                <div class="page_list">
                    {{ $data->links()}}
                </div>


            </div>
        </div>
    </form>


    <!--搜索结果页面 列表 结束-->
    <script>


        function del(id,r) {
            layer.confirm('您确定删除该异常吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('{{url('admin/alert/')}}/' + id, {
                    '_method': 'delete',
                    '_token': '{{csrf_token()}}'
                }, function (data) {
                    if (data.status == 1) {

                        $(r).parent().parent().remove();

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
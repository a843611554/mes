@extends('layouts.admin')
@section('content')

    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">分区管理</a> &raquo; 分区列表
    </div>
    <!--面包屑导航 结束-->


    <!--搜索结果页面 列表 开始-->

    <form action="{{url('admin/section/search')}}" method="post">
        {{csrf_field()}}
        <div class="result_wrap">
            <div class="result_title">
                <h3>快捷操作</h3>

            </div>
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <a href="{{url('admin/section/create')}}"><i class="fa fa-plus"></i>新增分区</a>
                    <a href="{{url('admin/section/')}}"><i class="fa fa-refresh"></i>全部分区</a>
                    <table class="search_tab">
                        <tr>
                            <th>车间：</th>
                            <td>
                                <select name="depart_id">
                                        <option value="">选择车间查找</option>
                                    @foreach($depart as $v)
                                        @if(old('depart_id') ==$v->id)
                                            <option value="{{$v->id}}" selected>{{$v->Dpt_Name}}</option>
                                        @else
                                            <option value="{{$v->id}}">{{$v->Dpt_Name}}</option>
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
                        <th>所属车间</th>
                        <th>区域名称</th>
                        <th>修改人</th>
                        <th>修改时间</th>
                        <th>操作</th>
                    </tr>
                    @foreach($data as $v)
                    <tr>
                        <td>{{$v->s_id}}</td>
                        <td>{{$v->Dpt_Name}}</td>
                        <td>{{$v->sect_name}}</td>
                        <td>{{$v->modman}}</td>
                        <td>{{$v->moddate}}</td>
                        <td>
                            <a href="{{url('admin/section/'.$v->s_id.'/edit')}}"><i class="fa fa-pencil-square-o"></i>修改</a>
                            <a href="javascript:void(0)" onclick="del('{{$v->s_id}}',this)"><i class="fa fa-trash-o"></i>删除</a>
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
            layer.confirm('您确定删除该分区吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('{{url('admin/section/')}}/' + id, {
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
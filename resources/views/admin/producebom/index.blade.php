@extends('layouts.admin')
@section('content')

    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">生产物料清单</a> &raquo; 清单列表
    </div>
    <!--面包屑导航 结束-->


    <!--搜索结果页面 列表 开始-->

    <form action="" method="get">
        {{csrf_field()}}
        <div class="result_wrap">
            <div class="result_title">
                <h3>快捷操作</h3>

            </div>
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <a href="{{url('admin/producebom/create')}}"><i class="fa fa-plus"></i>新增生产清单</a>
                    <a href="{{url('admin/producebom/')}}"><i class="fa fa-refresh"></i>查看生产清单</a>
                    <table class="search_tab">
                        <tr>
                            <th width="70">关键字：</th>
                            <td><input type="text" name="keywords"  placeholder="输入物料编号或名称" value="{{old('keywords')}}"></td>
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
                        <th>物料编号</th>
                        <th>物料名称</th>
                        <th>出成率</th>
                        <th>修改时间</th>
                        <th>修改人</th>
                        <th>子物料</th>
                        <th>操作</th>
                    </tr>
                    @foreach($data as $v)
                    <tr>
                        <td>{{$v->Pd_Code}}</td>
                        <td>{{$v->pname}}</td>
                        <td>{{$v->Pb_per}}</td>
                        <td>{{$v->moddate}}</td>
                        <td>{{$v->modman}}</td>
                        <td><a href="javascript:void(0)" onclick="show_child_pd('{{$v->Pd_Code}}')"><i class='fa fa-search-plus'></i>查看子物料</a></td>
                        <td>
                            <a href="{{url('admin/producebom/'.$v->Pd_Code.'/edit')}}"><i class="fa fa-pencil-square-o"></i>修改</a>
                            <a href="javascript:void(0)" onclick="del('{{$v->Pd_Code}}',this)"><i class="fa fa-trash-o"></i>删除</a>
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
        
        function show_child_pd(Pd_Code) {
            layer.open({
                title:'查看子物料',
                type:2,
                area: ['1200px', '600px'],
                fixed: false,
                shadeClose:true,
                maxmin: true,
                content: "{{url('admin/producebom/show_child_pd')}}"+'/'+Pd_Code
            });
        }


        function del(Pd_Code,r) {
            layer.confirm('您确定删除该生产清单吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('{{url('admin/producebom/')}}/' + Pd_Code, {
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
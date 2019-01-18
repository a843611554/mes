@extends('layouts.admin')
@section('content')

    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">设备管理</a> &raquo; 设备列表
    </div>
    <!--面包屑导航 结束-->


    <!--搜索结果页面 列表 开始-->

    <form action="{{url('admin/device/search')}}" method="post">
        {{csrf_field()}}
        <div class="result_wrap">
            <div class="result_title">
                <h3>快捷操作</h3>

            </div>
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <a href="{{url('admin/device/create')}}"><i class="fa fa-plus"></i>新增设备</a>
                    <a href="{{url('admin/device/')}}"><i class="fa fa-refresh"></i>全部设备</a>
                    <table class="search_tab">
                        <tr>
                        <th>车间:</th>
                        <td><select name="depart_id" id="depart_id">
                                <option value="">请选择车间</option>
                                @foreach($depart as $v)
                                    @if(old('depart_id')==$v->id)
                                        <option value="{{$v->id}}" selected>{{$v->Dpt_Name}}</option>
                                    @else
                                        <option value="{{$v->id}}">{{$v->Dpt_Name}}</option>
                                    @endif
                                @endforeach

                            </select></td>
                        <th>分区:</th>
                        <td>
                            <select name="section" id="section" style="width: 150px">
                                <option value="">请选择分区</option>
                                @if(isset($section))
                                    @foreach($section as $v)
                                        @if(old('section') == $v->s_id)
                                            <option value="{{$v->s_id}}" selected>{{$v->sect_name}}</option>
                                        @else
                                            <option value="{{$v->s_id}}" >{{$v->sect_name}}</option>
                                        @endif
                                    @endforeach
                                @endif
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
                        <th>设备编号</th>
                        <th>设备名称</th>
                        <th>所属车间</th>
                        <th>所在分区</th>
                        <th>厂家名称</th>
                        <th>技术文档编号</th>
                        <th>联系人</th>
                        <th>联系电话</th>
                        <th>设备状态</th>
                        <th>操作</th>
                    </tr>
                    @foreach($data as $v)
                    <tr>
                        <td>{{$v->device_code}}</td>
                        <td>{{$v->device_name}}</td>
                        <td>{{$v->Dpt_Name}}</td>
                        <td>{{$v->sect_name}}</td>
                        <td>{{$v->vender}}</td>
                        <td>{{$v->tech_code}}</td>
                        <td>{{$v->contactman}}</td>
                        <td>{{$v->contactphone}}</td>
                        <td>{{$v->device_state}}</td>
                        <td>
                            <a href="{{url('admin/device/'.$v->id.'/edit')}}"><i class="fa fa-pencil-square-o"></i>修改</a>
                            <a href="javascript:void(0)" onclick="del('{{$v->id}}',this)"><i class="fa fa-trash-o"></i>删除</a>
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
            layer.confirm('您确定删除该设备吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('{{url('admin/device/')}}/' + id, {
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

        $('#depart_id').on('change',function () {
            $("#section").children().remove();
            $.post("{{url('admin/device/get_section')}}",{'_token':'{{csrf_token()}}','depart_id':$('#depart_id').val()},
                function (data) {
                    if(data.length<=0){
                        layer.msg('此车间无分区');
                    }else{
                        $("#section").append("<option value=''>选择分区</option>");
                        $.each(data,function (idx,obj) {
                            var opt = "<option value='"+ obj.s_id +"'>"+obj.sect_name+ "</option>"
                            $("#section").append(opt);
                        });
                    }
                });

        })//根据车间加载分区



    </script>

@endsection
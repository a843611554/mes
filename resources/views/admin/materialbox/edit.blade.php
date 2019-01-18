@extends('layouts.admin')
        @section('content')

            <!--面包屑导航 开始-->
            <div class="crumb_warp">
                <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
                <i class="fa fa-home"></i> <a href="#">首页</a> &raquo;<a href="#">周转箱管理</a> &raquo; 周转箱添加
            </div>
            <!--面包屑导航 结束-->
            <div class="result_wrap">
            <!--结果集标题与导航组件 开始-->
            <div class="result_wrap">
                <div class="result_title">
                    <h3>快捷操作</h3>

                </div>
                <div class="result_title">
                    @if (count($errors)>0)
                        <div class="mark">
                            @if (is_object($errors))
                                @foreach($errors->all() as $error)
                                    <p>{{$error}}</p>
                                @endforeach
                            @else
                                <p> {{$errors}}</p>
                            @endif

                        </div>
                    @endif
                </div>
            </div>
                <div class="result_content">
                    <div class="short_wrap">
                        <a href="{{url('admin/materialbox/create')}}"><i class="fa fa-plus"></i>新增周转箱</a>
                        <a href="{{url('admin/materialbox/')}}"><i class="fa fa-refresh"></i>查看周转箱</a>
                    </div>
                </div>
            </div>
            <!--结果集标题与导航组件 结束-->


            <div class="result_wrap">
                <form action="{{url('admin/materialbox/'.$data->id)}}" method="post">
                    <input type="hidden" name="_method" value="put">
                    {{csrf_field()}}
                    <table class="add_tab">
                        <tbody>
                        <tr>
                            <th><i class="require">*</i>车间：</th>
                            <td>
                                <p>{{$depart->Dpt_Name}}</p>
                            </td>
                        </tr>
                        <tr>
                            <th><i class="require">*</i>识别码：</th>
                            <td>
                               <p>{{$data->box_identify}}</p>
                                <input type="hidden" name="box_identify" value="{{$data->box_identify}}">
                            </td>
                        </tr>


                        <tr>
                            <th><i class="require">*</i>检验周期：</th>
                            <td>
                                <input type="text" class="tc"  name="inspection_interval" value="{{$data->inspection_interval}}">
                            </td>
                        </tr>
                        <tr>
                            <th>材质：</th>
                            <td>
                                <input type="text" class="tc"  name="material" value="{{$data->material}}" placeholder="请入材质">
                            </td>
                        </tr>
                        <tr>
                            <th>长：</th>
                            <td>
                                <input type="text" class="tc"  value="{{$data->box_L}}" name="box_L" placeholder="请输入长度">
                            </td>
                        </tr>
                        <tr>
                            <th>宽：</th>
                            <td>
                                <input type="text" class="tc"  value="{{$data->box_W}}" name="box_W" placeholder="请输入宽度">
                            </td>
                        </tr>
                        <tr>
                            <th>高：</th>
                            <td>
                                <input type="text" class="tc"  value="{{$data->box_H}}" name="box_H" placeholder="请输入高度">
                            </td>
                        </tr>

                        <tr>
                            <th>皮重：</th>
                            <td>
                                <input type="text" class="tc" value="{{$data->box_tare}}" name="box_tare" placeholder="请输入毛重">
                            </td>
                        </tr>

                        <tr>
                            <th></th>
                            <td>
                                <input type="submit" value="提交">
                                <input type="button" class="back" onclick="history.go(-1)" value="返回">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <script>
                function auto_code() {
                    $.post("{{url('admin/materialbox/auto_code')}}",
                        {'_token':'{{csrf_token()}}','depart_id':$('#depart_id').val()},
                        function (data) {
                            if(data.status==1){
                                layer.msg(data.msg);
                                $('#box_identify').val(data.box_identify);


                            }else{
                                layer.msg(data.msg);
                            }
                        });
                }
            </script>

        @endsection


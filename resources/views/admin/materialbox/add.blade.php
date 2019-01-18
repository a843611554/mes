@extends('layouts.admin')
        @section('content')

            <!--面包屑导航 开始-->
            <div class="crumb_warp">
                <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
                <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">周转箱管理</a> &raquo; 周转箱添加
            </div>
            <!--面包屑导航 结束-->
            <div class="result_wrap">
            <!--结果集标题与导航组件 开始-->

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
                <!--快捷导航 开始-->
                <div class="result_content">
                    <div class="short_wrap">
                        <a href="{{url('admin/materialbox/')}}"><i class="fa fa-refresh"></i>查看周转箱</a>
                    </div>
                </div>
                <!--快捷导航 结束-->
            </div>
            <!--结果集标题与导航组件 结束-->


            <div class="result_wrap">
                <form action="{{url('admin/materialbox/')}}" method="post">
                    {{csrf_field()}}
                    <table class="add_tab">
                        <tbody>

                        <tr>
                            <th><i class="require">*</i>车间：</th>
                            <td>
                                <select name="depart_id" id="depart_id">
                                    <option  value="">请选择车间</option>
                                    @foreach($depart as $v)
                                        @if(old('depart_id')==$v->id)
                                            <option value="{{$v->id}}" selected>{{$v->Dpt_Name}}</option>
                                        @else
                                            <option value="{{$v->id}}" >{{$v->Dpt_Name}}</option>
                                        @endif
                                    @endforeach

                                </select>
                            </td>
                        </tr>

                        <tr>
                            <th><i class="require">*</i>识别码：</th>
                            <td>
                                <input type="text" id="box_identify"  class="tc" value="{{old('box_identify')}}" placeholder="请入识别码" name="box_identify">

                                <input type="button" value="自动生成" onclick="auto_code()">
                            </td>
                        </tr>


                        <tr>
                            <th>检验周期：</th>
                            <td>
                                <input type="text" class="tc" value="{{old('inspection_interval')}}" name="inspection_interval" placeholder="请入检验周期">
                            </td>
                        </tr>

                        <tr>
                            <th>材质：</th>
                            <td>
                                <input type="text" class="tc" value="{{old('material')}}" name="material" placeholder="请入材质">
                            </td>
                        </tr>
                        <tr>
                            <th>长：</th>
                            <td>
                                <input type="text" class="tc" value="{{old('box_L')}}" name="box_L" placeholder="请输入长度">
                            </td>
                        </tr>
                        <tr>
                            <th>宽：</th>
                            <td>
                                <input type="text" class="tc" value="{{old('box_W')}}" name="box_W" placeholder="请输入宽度">
                            </td>
                        </tr>
                        <tr>
                            <th>高：</th>
                            <td>
                                <input type="text" class="tc" value="{{old('box_H')}}" name="box_H" placeholder="请输入高度">
                            </td>
                        </tr>

                        <tr>
                            <th>皮重：</th>
                            <td>
                                <input type="text" class="tc" value="{{old('box_tare')}}" name="box_tare" placeholder="请输入皮重">
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


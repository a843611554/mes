@extends('layouts.admin')
        @section('content')

            <!--面包屑导航 开始-->
            <div class="crumb_warp">
                <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
                <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">设备管理</a> &raquo; 设备添加
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
                        <a href="{{url('admin/device/')}}"><i class="fa fa-refresh"></i>全部设备</a>
                    </div>
                </div>
                <!--快捷导航 结束-->
            </div>
            <!--结果集标题与导航组件 结束-->


            <div class="result_wrap">
                <form action="{{url('admin/device')}}" method="post">
                    {{csrf_field()}}
                    <table class="add_tab">
                        <tbody>

                        <tr>
                            <th><i class="require">*</i>车间：</th>
                            <td>
                                <select  id="depart_id">
                                    <option value="">请选择车间</option>
                                    @foreach($depart as $v)
                                            <option value="{{$v->id}}">{{$v->Dpt_Name}}</option>
                                    @endforeach

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><i class="require">*</i>分区:</th>
                            <td>
                                <select name="sect_id" id="section" style="width: 150px">
                                    <option value="">请选择分区</option>

                                </select>
                            </td>
                        </tr>
                        
                        <tr>
                           <th><i class="require">*</i>厂家：</th>
                            <td>
                                <select name="vender" id="vender">
                                    <option value="">请选择厂家</option>
                                    @foreach($vender_info as $v)

                                            <option value="{{$v->cust_nameCn}}" onclick="putinfo('{{$v->cust_LinkMan}}','{{$v->cust_tel}}')">{{$v->cust_nameCn}}</option>

                                    @endforeach
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>联系人：</th>
                            <td>
                                <input type="text" readonly name="contactman" id="contactman" >
                            </td>
                        </tr>

                        <tr>
                            <th>联系方式：</th>

                            <td>
                                <input type="text" readonly name="contactphone" id="contactphone" >
                            </td>
                        </tr>

                        <tr>
                            <th><i class="require">*</i>设备编号：</th>
                            <td>
                                <input type="text" name="device_code">
                            </td>
                        </tr>
                        <tr>
                            <th><i class="require">*</i>设备名称：</th>
                            <td>
                                <input type="text" name="device_name">
                            </td>
                        </tr>
                        <tr>
                            <th><i class="require">*</i>技术文档编号：</th>
                            <td>
                                <input type="text" name="tech_code">
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


                function putinfo(man,tel) {
                    $('#contactman').val(man);
                    $('#contactphone').val(tel);
                }
            </script>

        @endsection


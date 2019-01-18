@extends('layouts.admin')
        @section('content')
            <link rel="stylesheet" type="text/css" href="{{asset('js/DatePicker/skin/jedate.css')}}"/>
            <script type="text/javascript" src="{{asset('js/DatePicker/jquery.jedate.js')}}"></script>
            <!--面包屑导航 开始-->
            <div class="crumb_warp">
                <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
                <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="#">维修管理</a> &raquo; 添加人员
            </div>
            <!--面包屑导航 结束-->
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

                <div class="result_content">
                    <div class="short_wrap">
                        <a href="{{url('admin/repaircontact/')}}"><i class="fa fa-refresh"></i>查看维修人员</a>
                    </div>

                </div>

            </div>
            <!--结果集标题与导航组件 结束-->


            <div class="result_wrap">
                <form action="{{url('admin/repaircontact')}}" method="post">
                    {{csrf_field()}}
                    <table class="add_tab">
                        <tbody>

                        <tr>
                            <th><i class="require">*</i>员工号：</th>
                            <td>
                                <div class="sbtn" id="search-div">
                                    <input type="hidden" name="user2_id" id="user2_id" value="{{isset($data)?$data->user2_id:null}}">
                                    <input type="text" readonly id="user_name" value="{{isset($data)?$data->user_name:null}}">
                                    <button type="button" onclick="find_user2()" class="btnSearch" style="padding: 0 10px;height: 22px;vertical-align: middle;margin-right: 10px;color: #fff;letter-spacing: 2px;border-radius: 3px;background: #337ab7;border: 1px solid #286090;cursor: pointer">查询</button>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>中文名:</th>
                            <td>
                                <input type="text" readonly id="cn_name" value="{{isset($data)?$data->cn_name:null}}">
                            </td>
                        </tr>
                        <tr>
                            <th>手机号:</th>
                            <td>
                                <input type="text" readonly id="mobile" value="{{isset($data)?$data->Stf_Mobile:null}}">
                            </td>
                        </tr>
                        <tr>
                            <th>联系方式：</th>
                            <td>
                                短信 <input type="radio" name="contact_type" value="0" @if(isset($data)&&$data->contact_type=='0')checked @endif>
                                短信+电话 <input type="radio" name="contact_type" value="1" @if(isset($data)&&$data->contact_type=='1')checked @endif>
                            </td>
                        </tr>
                        <tr>
                            <th><i class="require">*</i>负责车间：</th>
                            <td>

                                <select name="depart" id="depart">
                                    <option value="">请选择车间</option>
                                    @if(isset($data))
                                        @foreach($depart as $v)
                                            @if($data->depart == $v->id)
                                            <option value="{{$v->id}}" selected>{{$v->Dpt_Name}}</option>
                                            @else
                                            <option value="{{$v->id}}" >{{$v->Dpt_Name}}</option>
                                            @endif
                                        @endforeach
                                    @else
                                        @foreach($depart as $v)
                                            <option value="{{$v->id}}">{{$v->Dpt_Name}}</option>
                                        @endforeach
                                    @endif
                                </select>

                                {{--<input type="hidden" name="depart" id="depart" value="{{isset($data)?$data->depart:null}}">--}}
                                {{--<input type="text" id="depart_name" readonly value="{{isset($data)?$data->Dpt_Name:null}}">--}}
                            </td>
                        </tr>
                        <tr>
                            <th>分区：</th>
                            <td>
                                <select name="section" id="section" style="width: 150px">
                                @if(isset($section))
                                    @foreach($section as $v)
                                        @if($data->section == $v->s_id)
                                            <option value="{{$v->s_id}}" selected>{{$v->sect_name}}</option>
                                        @else
                                            <option value="{{$v->s_id}}" >{{$v->sect_name}}</option>
                                        @endif
                                    @endforeach
                                 @endif
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>设备：</th>
                            <td>
                                <select name="device" id="device" style="width: 150px">
                                    @if(isset($device))
                                        @foreach($device as $v)
                                            @if($data->device == $v->id)
                                                <option value="{{$v->id}}" selected>({{$v->device_code}}){{$v->device_name}}</option>
                                            @else
                                                <option value="{{$v->id}}" >({{$v->device_code}}){{$v->device_name}}</option>
                                            @endif
                                        @endforeach
                                    @endif
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>异常类型：</th>
                            <td>
                                <select name="alert_type" id="alert_type"  style="width: 150px">
                                    <option value="">请选择异常类型</option>
                                    @if(isset($data))
                                        @foreach($alert_type as $v)
                                            @if($data->alert_type == $v->dic_item_code)
                                                <option value="{{$v->dic_item_code}}" selected>{{$v->dic_item_name}}</option>
                                            @else
                                                <option value="{{$v->dic_item_code}}">{{$v->dic_item_name}}</option>
                                            @endif
                                        @endforeach
                                    @else

                                    @foreach($alert_type as $v)
                                        <option value="{{$v->dic_item_code}}">{{$v->dic_item_name}}</option>
                                    @endforeach

                                    @endif
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <th>异常类型明细:</th>
                            <td>
                                <select name="alert_typedet" id="alert_typedet"  style="width: 150px">
                                    @if(isset($data))
                                        @foreach($alert_typedet as $v)
                                            @if($data->alert_typedet == $v->alert_typedet)
                                                <option value="{{$v->atd_id}}" selected>{{$v->alert_typedet}}</option>
                                            @else
                                                <option value="{{$v->atd_id}}">{{$v->alert_typedet}}</option>
                                            @endif
                                        @endforeach
                                    @endif
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <th><i class="require">*</i>上班时间：</th>
                            <td>
                                <input type="text" readonly="readonly" name="start_work" id="start_work"  value="{{isset($data)?$data->start_work:null}}">
                            </td>
                        </tr>

                        <tr>
                            <th><i class="require">*</i>下班时间：</th>
                            <td>
                                <input type="text" readonly="readonly" name="end_work" id="end_work"  value="{{isset($data)?$data->end_work:null}}">
                            </td>
                        </tr>

                        <tr>
                            <th><i class="require">*</i>排班类型：</th>
                            <td>
                                <select name="work_date_type" id="work_date_type">
                                    <option value="0" selected>一天</option>
                                    <option value="1">连续</option>
                                    <option value="2">隔天</option>
                                </select>
                            </td>
                        </tr>
                        
                        <tr>
                            <th><i class="require">*</i>排班日期：</th>
                            <td id="work_date_select">
                                <input type="text" readonly="readonly" name="work_date" id="work_date" >
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
            $(function () {
                $("#start_work").jeDate({
                    format: "hh:mm:ss",
                    skinCell: "jedateblue",
                    onClose: true
                });
            });
            $(function () {
                $("#end_work").jeDate({
                    format: "hh:mm:ss",
                    skinCell: "jedateblue",
                    onClose: true
                });
            });
            $(function () {
                $("#work_date").jeDate({
                    format: "YYYY-MM-DD",
                    skinCell: "jedateblue",
                    onClose: true
                });
            });

            //根据排班类型加载不同的日期选择方式
            $('#work_date_type').change(function () {

                $('#work_date_select').children().remove();
                switch ($('#work_date_type').val()){
                    case('0'):
                        var html = "<input type='text' readonly='readonly' name='work_date' id='work_date' >";
                        $('#work_date_select').append(html);
                        $("#work_date").jeDate({
                            format: "YYYY-MM-DD",
                            skinCell: "jedateblue",
                            onClose: true
                        });
                        break;
                    case('1'):
                        var html = "<input type='text' readonly='readonly' name='start_work_date' id='start_work_date' placeholder='开始日期'> <b>至</b> <input type='text' readonly='readonly' name='end_work_date' id='end_work_date' placeholder='结束日期'>";
                        $('#work_date_select').append(html);
                        $("#start_work_date").jeDate({
                            format: "YYYY-MM-DD",
                            skinCell: "jedateblue",
                            onClose: true
                        });
                        $("#end_work_date").jeDate({
                            format: "YYYY-MM-DD",
                            skinCell: "jedateblue",
                            onClose: true
                        });
                        break;
                    case('2'):
                        var html = "<input type='text' readonly='readonly' name='start_work_date' id='start_work_date' placeholder='开始日期'> <b>至</b> <input type='text' readonly='readonly' name='end_work_date' id='end_work_date' placeholder='结束日期'>";
                        $('#work_date_select').append(html);
                        $("#start_work_date").jeDate({
                            format: "YYYY-MM-DD",
                            skinCell: "jedateblue",
                            onClose: true
                        });
                        $("#end_work_date").jeDate({
                            format: "YYYY-MM-DD",
                            skinCell: "jedateblue",
                            onClose: true
                        });
                        break;
                    default:break;
                }
            });




            function find_user2() {
                    layer.open({
                        title:'选择员工',
                        type: 2,
                        area: ['800px', '550px'],
                        fixed: false,
                        maxmin: true,
                        content: "{{url('admin/repaircontact/add_user2')}}"
                    });
            }

            $('#alert_type').on('change',function () {
                $("#alert_typedet").children().remove();
                $.post("{{url('admin/repaircontact/get_alert_typedet')}}",{'_token':'{{csrf_token()}}','alert_type':$('#alert_type').val()},
                    function (data) {

                        if(data.length<=0){
                            layer.msg('此类型还无明细');
                        }else{
                            $("#alert_typedet").append("<option value=''>选择异常明细</option>");
                            $.each(data,function (idx,obj) {
                                var opt = "<option value='"+ obj.atd_id +"'>"+obj.alert_typedet+ "</option>"
                                $("#alert_typedet").append(opt);
                            });
                        }
                    });

            })  //根据维修类型加载维修明细



            $('#depart').on('change',function () {
                $("#section").children().remove();
                $.post("{{url('admin/repaircontact/get_section')}}",{'_token':'{{csrf_token()}}','depart_id':$('#depart').val()},
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

            })//车间加载分区


            $('#section').on('change',function () {
                $("#device").children().remove();
                $.post("{{url('admin/repaircontact/get_device')}}",{'_token':'{{csrf_token()}}','section_id':$('#section').val()},
                    function (data) {

                        if(data.length<=0){
                            layer.msg('此分区无可选设备');
                        }else{
                            $("#device").append("<option value=''>选择设备</option>");
                            $.each(data,function (idx,obj) {
                                var opt = "<option value='"+ obj.id +"'>"+'('+obj.device_code+')'+obj.device_name+ "</option>"
                                $("#device").append(opt);
                            });
                        }
                    });

            })//根据分区加载设备

        </script>
        @endsection
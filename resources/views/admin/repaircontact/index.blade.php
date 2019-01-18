@extends('layouts.admin')

@section('content')
    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">维修管理</a> &raquo; 联系列表
    </div>
    <!--面包屑导航 结束-->
    <!--搜索结果页面 列表 开始-->

    <form action="{{url('admin/repaircontact/search')}}" method="post">
        {{csrf_field()}}
        <div class="result_wrap">
            <div class="result_title">
                <h3>快捷操作</h3>
            </div>
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <a href="{{url('admin/repaircontact/create')}}"><i class="fa fa-plus"></i>添加维修人员</a>
                    <a href="{{url('admin/repaircontact/')}}"><i class="fa fa-refresh"></i>查看维修人员</a>



                    <table class="search_tab"  >
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
                                <select name="section" id="section" style="width: 130px">
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
                            <th>设备:</th>
                            <td>
                                <select name="device" id="device" style="width: 130px">
                                    <option value="">请选择设备</option>
                                    @if(isset($device))
                                        @foreach($device as $v)
                                            @if(old('device') == $v->id)
                                                <option value="{{$v->id}}" selected>({{$v->device_code}}){{$v->device_name}}</option>
                                            @else
                                                <option value="{{$v->id}}" >({{$v->device_code}}){{$v->device_name}}</option>
                                            @endif
                                        @endforeach
                                    @endif

                                </select>
                            </td>

                            <th>异常类型:</th>
                            <td>
                                <select name="alert_type" id="alert_type"  style="width: 130px">
                                    <option value="">请选择异常类型</option>
                                    @foreach($alert_type as $v)
                                        @if(old('alert_type') == $v->dic_item_code)
                                            <option value="{{$v->dic_item_code}}" selected>{{$v->dic_item_name}}</option>
                                        @else
                                            <option value="{{$v->dic_item_code}}">{{$v->dic_item_name}}</option>
                                        @endif
                                    @endforeach
                                </select>
                            </td>
                            {{--<th>异常明细:</th>--}}
                            {{--<td>--}}
                                {{--<select name="alert_typedet" id="alert_typedet"  style="width: 130px">--}}
                                    {{--@if(isset($alert_typedet))--}}
                                        {{--@foreach($alert_typedet as $v)--}}
                                            {{--@if(old('alert_typedet') == $v->atd_id)--}}
                                                {{--<option value="{{$v->atd_id}}" selected>{{$v->alert_typedet}}</option>--}}
                                            {{--@else--}}
                                                {{--<option value="{{$v->atd_id}}">{{$v->alert_typedet}}</option>--}}
                                            {{--@endif--}}
                                        {{--@endforeach--}}
                                    {{--@endif--}}
                                {{--</select>--}}
                            {{--</td>--}}



                            <th>员工关键字:</th>
                            <td>
                                <input type="text" name="keywords" value="{{old('keywords')}}" placeholder="输入员工关键字">
                            </td>
                            <td><input type="submit"  value="查询"></td>
                        </tr>
                    </table>
                </div>

            </div>
        </div>
    </form>
            <!--快捷导航 结束-->
    <div class="result_wrap">
        <div class="result_content">
            <table class="list_tab">
                <tr>

                    <th>员工号</th>
                    <th>员工姓名</th>
                    <th>负责车间</th>
                    <th>负责区域</th>
                    <th>维修类型</th>
                    <th>维修明细</th>
                    <th>负责设备</th>
                    <th>电话号码</th>
                    <th>联系方式</th>
                    <th>工作时间</th>
                    <th>排班日期</th>
                    <th>当前状态</th>
                    <th>操作</th>

                </tr>
                <tbody>
                    @foreach($data as $v)
                        <tr>
                            <td>{{$v->user_name}}</td>
                            <td>{{$v->cn_name}}</td>
                            <td>{{$v->Dpt_Name}}</td>
                            <td>{{$v->sect_name}}</td>
                            <td>{{$v->alert_type_name}}</td>
                            <td>{{$v->alert_typedet}}</td>
                            <td>{{$v->device_name}}</td>
                            <td>{{$v->Stf_Mobile}}</td>
                            <td>
                                @if($v->contact_type == '0')
                                    短信
                                @elseif($v->contact_type == '1')
                                    短信+电话
                                @else
                                    无
                                @endif
                            </td>
                            <td>{{$v->start_work}}-{{$v->end_work}}</td>
                            <td>{{date('Y-m-d',$v->work_date)}}</td>
                            <td>
                                @if($v->state == 1)
                                    <p style="color: #2ca02c">正在上班</p>
                                @else
                                    <p style="color: #5e5e5e">已下班</p>
                                @endif

                            </td>
                            <td>
                                <a href="{{url('admin/repaircontact/'.$v->id.'/edit')}}"><i class="fa fa-pencil-square-o"></i>修改</a>
                                <a href="{{url('admin/repaircontact/'.$v->id.'/add_scheduling')}}"><i class="fa fa-plus"></i>增加值班</a>
                                <a href="javascript:void(0)" onclick="del('{{$v->id}}',this)"><i class="fa fa-trash-o"></i>删除</a>
                            </td>
                        </tr>
                    @endforeach


                </tbody>
            </table>
            <div class="page_list">
                {{ $data->links()}}
            </div>
        </div>
    </div>

    <script>
        function del(id,r) {
            layer.confirm('您确定删除该维修人员？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('{{url('admin/repaircontact/')}}/' + id, {
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
            $.post("{{url('admin/repaircontact/get_section')}}",{'_token':'{{csrf_token()}}','depart_id':$('#depart_id').val()},
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

        {{--$('#alert_type').on('change',function () {--}}
            {{--$("#alert_typedet").children().remove();--}}
            {{--$.post("{{url('admin/repaircontact/get_alert_typedet')}}",{'_token':'{{csrf_token()}}','alert_type':$('#alert_type').val()},--}}
                {{--function (data) {--}}

                    {{--if(data.length<=0){--}}
                        {{--layer.msg('此类型还无明细');--}}
                    {{--}else{--}}
                        {{--$("#alert_typedet").append("<option value=''>选择异常明细</option>");--}}
                        {{--$.each(data,function (idx,obj) {--}}
                            {{--var opt = "<option value='"+ obj.atd_id +"'>"+obj.alert_typedet+ "</option>"--}}
                            {{--$("#alert_typedet").append(opt);--}}
                        {{--});--}}
                    {{--}--}}
                {{--});--}}

        {{--})  //根据维修类型加载维修明细--}}
    </script>

@endsection
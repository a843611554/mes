@extends('layouts.admin')

@section('content')
    <link rel="stylesheet" type="text/css" href="{{asset('js/DatePicker/skin/jedate.css')}}"/>
    <script type="text/javascript" src="{{asset('js/DatePicker/jquery.jedate.js')}}"></script>
    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="{{url('admin/repairitem')}}">维修报表</a> &raquo; <a href="{{url('admin/repairitem/repairman')}}">维修人员</a>&raquo;{{$repairman->cn_name}}
    </div>
    <!--面包屑导航 结束-->
    <!--搜索结果页面 列表 开始-->

    <form action="" method="post">
        {{csrf_field()}}
        <div class="result_wrap">
            <div class="result_title">
                <h3>快捷操作</h3>
            </div>
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <table class="search_tab"  >

                        <th>时间范围：</th>
                        <td>
                            <input type="text" readonly name="start_date" id="start_date" value="@if(isset($start_date)&&$start_date>0){{date('Y-m-d',$start_date)}}@else{{old('start_date')}}@endif"> 至
                            <input type="text" readonly name="end_date" id="end_date" value="@if(isset($end_date)){{date('Y-m-d',$end_date)}}@else{{old('end_date')}}@endif">
                        </td>


                        <th>关键字:</th>
                        <td>
                            <input type="text" name="keywords" placeholder="输入维修单号" value="{{old('keywords')}}">
                            <td><input type="submit"  value="查询"></td>
                        </td>
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
                    <th>维修单号</th>
                    <th>车间</th>
                    <th>分区</th>
                    <th>设备编号</th>
                    <th>设备名称</th>
                    <th>异常类型</th>
                    <th>异常明细</th>
                    <th>创建时间</th>
                    <th>创建人</th>
                    <th>订单状态</th>
                    <th>维修人状态</th>
                    <th>星级</th>
                    <th>评价</th>
                    <th>搁置时长(分）</th>
                    <th>处理时长(分）</th>
                    <th>签到地址</th>
                    <th>签到图片</th>
                    <th>异常图片</th>
                    <th>操作</th>
                </tr>
                <tbody>

                    @foreach($data as $v)
                        <tr>
                            <td>{{$v->repair_bill}}</td>
                            <td>{{$v->Dpt_name}}</td>
                            <td>{{$v->sect_name}}</td>
                            <td>{{$v->device_code}}</td>
                            <td>{{$v->device_name}}</td>
                            <td>{{$v->alert_type}}</td>
                            <td>{{$v->alert_typedet}}</td>
                            <td>@if(isset($v->createdate)){{date('Y-m-d h:m:s',$v->createdate)}}@endif</td>
                            <td>{{$v->createman_name}}</td>
                            <td>
                               @switch($v->pstate)
                                    @case('0')
                                        已提交
                                    @break
                                    @case('1')
                                        已签到
                                    @break
                                    @case('4')
                                        已评价
                                    @break

                                    @default

                               @endswitch
                            </td>
                            <td>
                                @switch($v->settle_state)
                                @case('0')
                                未签到
                                @break
                                @case('1')
                                已签到
                                @break
                                @case('3')
                                已处理
                                @break

                                @default

                                @endswitch
                            </td>
                            <td>{{$v->review_star}}</td>
                            <td>{{$v->review_text}}</td>

                            <td>
                                @if($v->checkdate-$v->penddate>60*60*5)
                                <p style="color:#ffa500 ">{{floor(($v->checkdate-$v->penddate)/60)}}</p>
                                @else
                                <p >{{floor(($v->checkdate-$v->penddate)/60)}}</p>
                                @endif
                            </td>
                            <td>{{floor(($v->createdate-$v->checkdate)/60)}}</td>
                            <td>
                                @if($v->pstate == 0)
                                    <p style="color: #5e5e5e">待签到</p>
                                @else
                                <a href="javascript:void(0)" onclick="show_map('{{$v->check_lng}}','{{$v->check_lat}}')">查看地图</a>
                                @endif
                            </td>
                            <td>
                                @if($v->check_image == '')
                                    <p style="color: #5e5e5e">待签到</p>
                                @else
                                    <a href="javascript:void(0)" onclick="show_img('{{asset($v->check_image)}}')">查看图片</a>
                                @endif
                            </td>
                            <td>
                                @if($v->image_path == '')
                                    <p style="color: #5e5e5e">无</p>
                                @else
                                    <a href="javascript:void(0)" onclick="show_img('{{asset($v->image_path)}}')">查看异常</a>
                                @endif
                            </td>

                            <td>
                                <a href="javascript:void (0)" onclick="edit({{$v->repair_bill}})"><i class="fa fa-pencil-square-o"></i>修改</a>
                            </td>

                        </tr>
                    @endforeach

                </tbody>
            </table>
                <div class="page_list">
                    {{$data->links()}}
                </div>



            <div class="page_list">

            </div>
        </div>
    </div>

    <script>
        $(function () {
            $("#start_date").jeDate({
                format: "YYYY-MM-DD",
                skinCell: "jedateblue",
                onClose: true
            });
            $("#end_date").jeDate({
                format: "YYYY-MM-DD",
                skinCell: "jedateblue",
                onClose: true
            });
        });
        
        function show_map(longitude,latitude) {
            layer.open({
                title:'查看签到位置',
                type:2,
                area: ['600px', '600px'],
                fixed: false,
                shadeClose:true,
                maxmin: true,
                content: "{{url('admin/repairitem/show_map')}}"+'/'+longitude+'/'+latitude
            });
        }
        function edit(repair_bill) {
            layer.open({
                title:'修改信息',
                type:2,
                area: ['600px', '300px'],
                fixed: false,
                shadeClose:true,
                maxmin: true,
                content: "{{url('admin/repairitem/repairman_show_edit')}}"+'/'+repair_bill,

                btn: ['确认', '取消'],
                yes: function(index){
                    var body = layer.getChildFrame('body', index); //得到iframe页的body内容
//                    alert(body.find("[name='review_star']:checked").val());

                    $.post("{{url('admin/repairitem/repairman_show_update')}}",
                        {
                            '_token':"{{csrf_token()}}",
                            'repair_bill':repair_bill,
                            'review_star':body.find("[name='review_star']:checked").val(),
                            'pstate':body.find("[name='pstate']:checked").val(),
                            'settle_state':body.find("[name='settle_state']:checked").val(),
                            'review_text':body.find("[name='review_text']").val(),
                        },function (data) {
                            if(data.status ==1){
                                layer.msg(data.msg);
                                window.location.href=window.location.href;
                            }else{
                                layer.msg(data.msg);
                            }
                        })

                },
            });

        }

        function show_img(src) {
                     layer.open({
                        title: '查看图片',
                        type: 2,
                        area: ['500px','600px'],
                        fixed: false,
                        shadeClose: true,
                        maxmin: true,

                        content: "{{url('admin/repairitem/show_image')}}"+'?src='+src,

                    });


        }

        
    </script>


@endsection
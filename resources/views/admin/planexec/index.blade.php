@extends('layouts.admin')
@section('content')
    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="{{url('admin/planexec')}}">计划执行</a>
    </div>
    <!--面包屑导航 结束-->

    <div class="search_wrap">
        <form action="{{url('admin/planexecfindkey')}}" method="post">
            {{csrf_field()}}
            <table class="search_tab">
                <tr>
                    <th width="70">关键字:</th>
                    <td><input type="text" name="keywords" placeholder="二维码/产品编码" value="{{old('keywords')}}"></td>
                    <td><input type="submit" name="sub" onclick="vervalue()" value="查询"></td>
                </tr>
            </table>

        </form>
    </div>

    <!--搜索结果页面 列表 开始-->
    <form action="#" method="post">
        <div class="result_wrap">
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <a href="{{url('admin/planexec/create')}}"><i class="fa fa-plus"></i>新增执行计划</a>
                </div>
            </div>
            <!--快捷导航 结束-->
        </div>

        <div class="result_wrap">
            <div class="result_content">
                <table class="list_tab">
                    <tr>
                        <th>执行编码</th>
                        <th>计划名称</th>
                        <th>产品编码</th>
                        <th>产品名称</th>
                        <th>计划类别</th>
                        <th>工艺编码</th>
                        <th>工艺名称</th>
                        <th>炉号</th>
                        <th>材料数量</th>
                        <th>状态</th>
                        <th>日期</th>

                        <th>操作</th>
                    </tr>
                    @foreach($data as $v)
                    <tr>
                        <td>{{$v->exec_qrcode}}</td>
                        <td>
                            <a href="#">{{$v->plan_name}}</a>
                        </td>
                        <td>{{$v->pcode}}</td>
                        <td>{{$v->pname}}</td>
                        <td>{{$v->plan_type_name}}</td>
                        <td>{{$v->art_id}}</td>
                        <td>{{$v->art_name}}</td>
                        <td>{{$v->stove_num}}</td>

                        <td>{{$v->material_num}}</td>
                        <td>@if($v->pstate==1) 已审核   @elseif($v->pstate==3) <p class="complete">已完成</p> @elseif($v->pstate==-1) <p class="im">已作废</p>@else <p class="begin">未审核</p> @endif</td>
                        <td>{{date('Y-m-d h:m',$v->exec_date)}}</td>
                        <td>
                            <a href="javascript:void(0)" onclick="destorypstate({{$v->id}})" >@if($v->pstate<>3) 作废    @endif</a>
                        </td>
                    </tr>
                    @endforeach
                </table>
                <div class="page_list">
                        {{$data->links()}}
                </div>
            </div>
        </div>
    </form>

    {{--今日计划执行弹出框--}}
    <div class="result_content" id="todayexec" hidden>
        <table class="list_tab" >
            <tr>
                <th>计划编号</th>
                <th>计划名称</th>
                <th>计划类别</th>
                <th>产品名称</th>
                <th>订单数量</th>
                <th>加料数量</th>
                <th>计划班产</th>
                <th>计划剩余</th>
                <th>计划日期</th>
                <th>交付日期</th>
                <th>备注</th>
                <th>操作</th>

            </tr>
            <tbody id="todayexeclist">

            </tbody>

        </table>

    </div>
    </div>



    <!--搜索结果页面 列表 结束-->
    <style>
        .im {

            color: red;
        }
        .complete {

            color: green;
        }
        .begin {

            color: darkorange;
        }
    </style>
    <script>
        function timestampToTime(timestamp) {
            var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
            Y = date.getFullYear() + '-';
            M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
            D = date.getDate() <10  ?  '0'+date.getDate() : date.getDate();
            return Y+M+D;
        }
        $(document).ready(function () {
            $.post("{{url('admin/todayexec')}}",{  '_token': '{{csrf_token()}}'}
            ,function (data) {
                    if(data.status == 0){
                        layer.msg(data.msg);
                    }else {
                        $.each(data.todayexec ,function (k,v) {

                            var tr="<tr>" +
                                "<td>"+v.plan_code+"</td>"+
                                "<td>"+v.plan_name+"</td>"+
                                "<td>"+v.plan_type_name+"</td>"+
                                "<td>"+v.pname+"</td>"+
                                "<td>"+v.order_num+"</td>"+
                                "<td>"+v.add_material_num+"</td>"+
                                "<td>"+v.plan_dept_num+"</td>"+
                                "<td>"+v.surplus+"</td>"+
                                "<td>"+timestampToTime(v.plan_date)+"</td>"+
                                "<td>"+timestampToTime(v.delivery_date)+"</td>"+
                                "<td>"+v.pnote+"</td>"+
                                "<td>"+"<a href='{{url("admin/planexec/addtodayexec/")}}/"+v.plan_code+"'>执行计划</a>"+"</td>"+

                                "</tr>"

                            $("#todayexeclist").append(tr);


                        });


                        layer.open({
                            type:1,
                            title:'今日计划',
                            area: ['80%','70%'],
                            shadeClose: true,
                            content:$('#todayexec'),
                            btn:['确认']
                        });
                    }
                });
        });


        function destorypstate(id) {

            layer.confirm('请先确认该计划是否有产量信息，您作废该笔记录吗？', {
                btn: ['确认', '取消'] //按钮

            }, function () {
                $.post('{{url('admin/planexec')}}/' + id, {
                    '_method': 'delete',
                    '_token': '{{csrf_token()}}'
                }, function (data) {
                    if (data.status == 0) {
                        location.href=location.href;
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
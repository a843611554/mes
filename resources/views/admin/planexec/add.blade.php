@extends('layouts.admin')
@section('content')
    <link rel="stylesheet" type="text/css" href="{{asset('js/DatePicker/skin/jedate.css')}}"/>
    <script type="text/javascript" src="{{asset('js/DatePicker/jquery.jedate.js')}}"></script>
    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="{{url('admin/planexec')}}">计划执行</a>
    </div>
    <!--面包屑导航 结束-->

	<!--结果集标题与导航组件 开始-->
	<div class="result_wrap">
        <div class="result_title">
            <h3>快捷操作</h3>
        </div>
        <div class="result_content">
            <div class="short_wrap">
                <a href="{{url('admin/planexec/create')}}"><i class="fa fa-plus"></i>新增执行计划</a>
            </div>
        </div>
    </div>
    <!--结果集标题与导航组件 结束-->
    <div class="result_wrap">
        <form action="{{url('admin/planexec')}}" method="post" >
            {{csrf_field()}}
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
            <table class="add_tab">
                <tbody>

                <tr>

                    <th><i class="require">*</i>计划条码：</th>
                    <td>
                        <div class="sbtn" id="search-div">


                            <input type="text" value="@if(isset($data)){{$data->plan_code}}@endif" name="plan_code"
                                   id="plan_code" />
                            <button type="button" onclick="popshow('/admin/popplanexec/-1')" class="btnSearch" id="plan_pp" style="padding: 0 10px;height: 22px;vertical-align: middle;margin-right: 10px;color: #fff;letter-spacing: 2px;border-radius: 3px;background: #337ab7;border: 1px solid #286090;cursor: pointer">
                                查询
                            </button>
                            <div class="suggest" id="search-att" style="display:none;">
                                <ul id="search-result">
                                </ul>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>计划名称：</th>
                    <td>
                        <input type="text" name="plan_name" value="@if(isset($data)){{$data->plan_name}}@endif" id="plan_name" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <th>产品编号：</th>
                    <td>
                        <input hidden name="pid" id="pid" readonly="readonly" value="@if(isset($data)){{$data->product_id}}@endif">
                        <input type="text" name="pcode" id="pcode" readonly="readonly" value="@if(isset($data)){{$data->pcode}}@endif">
                    </td>
                </tr>
                <tr>
                    <th>产品名称：</th>
                    <td>
                        <input type="text" name="pname" id="pname" readonly="readonly" value="@if(isset($data)){{$data->pname}}@endif">
                    </td>
                </tr>
                <tr>
                    <th>工艺编号：</th>
                    <td>
                        <input type="hidden" name="art_id" id="art_id" readonly="readonly" value="@if(isset($data)){{$data->art_id}}@endif">
                        <input type="text" name="acode" id="acode" readonly="readonly" value="@if(isset($data)){{$data->Art_code}}@endif">
                    </td>
                </tr>
                <tr>
                    <th>工艺名称：</th>
                    <td>
                        <input type="text" name="art_name" id="aname" readonly="readonly" value="@if(isset($data)){{$data->Art_name}}@endif">
                    </td>
                </tr>
                <tr>
                    <th>执行日期：</th>
                    <td>
                        <input type="text" class="tc" value="" name="exec_date" id="exec_date" readonly>
                        <span>必填</span>
                    </td>
                </tr>
                <tr>
                    <th>炉号：</th>
                    <td>
                        <input type="text" name="stove_num" id="stove_num" value="">
                    </td>
                </tr>
                <tr>
                    <th>托盘重量：</th>
                    <td>
                        <input type="text" name="plate_weight" id="plate_weight">
                    </td>
                </tr>
                <tr>
                    <th>毛重：</th>
                    <td>
                        <input type="text" name="gross_weight" id="gross_weight">
                    </td>
                </tr>
                <tr>
                    <th>材料数量：</th>
                    <td>
                        <input type="text" name="material_num" id="material_num">
                    </td>
                </tr>
                <tr style="display: none">
                    <th>状态：</th>
                    <td>
                        <input type="text" name="pstate">
                    </td>
                </tr>
                <tr style="display: none">
                    <th>修改人：</th>
                    <td>
                        <input type="text" name="modman">

                    </td>
                </tr>
                <tr style="display: none">
                    <th>修改时间：</th>
                    <td>
                        <input id="date" name="moddate" type="text" >
                        <script language="JavaScript">
                            var today=new Date();
                            var submitTime=today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate()+' '+today.getHours()+':'+today.getMinutes()+':'+today.getSeconds();
                            $("#date").attr('value',submitTime);
                        </script>
                    </td>
                </tr>

                <tr>
                    <th>描述：</th>
                    <td>
                        <textarea name="pnote" id="pnote"></textarea>
                    </td>
                </tr>


                <th></th>
                        <td>
                            <input type="button" onclick="check_child()" value="提交">
                            <input type="button" class="back" onclick="history.go(-1)" value="返回">
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>


{{--子执行计划弹出框--}}
    <div class="result_content" id="child_plan_exec" hidden>
        <table class="list_tab" >
            <tr>
                {{--<th>计划条码</th>--}}
                {{--<th>计划名称</th>--}}
                <th>产品编号</th>
                <th>产品名称</th>
                <th>工艺编号</th>
                <th>工艺名称</th>
                <th>炉号</th>
                <th>托盘重量</th>
                <th>毛重</th>
                <th>材料数量</th>
                <th>描述</th>
            </tr>
            <tbody id="child_plan_exec_list">

            </tbody>

        </table>

    </div>
    <script>
        //隐藏下拉层
        function blus(tag1) {
            $(tag1).hide();
        }

        function popshow(path) {
            layer.open({
                type: 2,
                area: ['800px', '550px'],
                fixed: false,
                maxmin: true,
                content: path
            })
        }

            $(function () {
                $("#exec_date").jeDate({
                    format: "YYYY-MM-DD",
                    skinCell: "jedateblue",
                    onClose: true
                });

            });
        $(document).bind('click', function () {
            $('#search-att').hide();
        });

        $(document).delegate('li', 'click', function () {
            var val = $(this).text();
            var pval = $(this).attr('id');
            var idval = pval.replace('plan_code', 'hide');
            $('#plan_code').val(val);
            $("#plan_id").val($("#" + pval).text());

        });

        function check_child(){
            var plan_code = $('#plan_code').val();//得到计划生产编号
            var pcode = $('#pcode').val(); //得到计划生产的物料编号
            var material_num = $('#material_num').val(); //获取计划生产的数量
            var exec_date = $('#exec_date').val();//获取执行日期

            $.post("{{url('admin/planexec/check_child')}}",{
                '_token':"{{csrf_token()}}",
                'plan_code':plan_code,
                'pcode':pcode,
                'material_num':material_num,
                'exec_date':exec_date
            },function (data) {
                $('#child_plan_exec_list').children().remove();

                switch (data.status){
                    case '1':var item = data.child_plan_exec;
                        for(var i in item){
                            //获取子执行计划数据，遍历显示到前端
                            var tr="<tr>"
//                                +"<td><p>"+isnull(item[i].plan_code)+"</p></td>"
//                                +"<td><p>"+isnull(item[i].plan_name)+"</p></td>"
                                +"<td><p>"+item[i].pcode+"</p></td>"
                                +"<td><p>"+item[i].pname+"</p></td>"
                                +"<td><p>"+item[i].art_code+"</p></td>"
                                +"<td><p>"+item[i].art_name+"</p></td>"
                                +"<td width='100px'>"+"<input type='text'  style='width: 90%; border:1px #FFFFFF solid' >"+"</td>"
                                +"<td width='100px'>"+"<input type='text'  style='width: 90%;border:1px #FFFFFF solid'>"+"</td>"
                                +"<td width='100px'>"+"<input type='text'  style='width: 90%;border:1px #FFFFFF solid'>"+"</td>"
                                +"<td width='100px'>"+"<input type='text' value='"+item[i].plan_exec_num+"'  style='width: 90%;border:1px #FFFFFF solid'>"+"</td>"
                                +"<td width='100px'>"+"<input type='text'  value='"+item[i].pnote+"'  style='width: 90%;border:1px #FFFFFF solid'>"+"</td>"

                                +"<td hidden>"+"<input type='hidden' value='"+item[i].product_id+"'  style='width: 90%;border:1px #FFFFFF solid'>"+"</td>"
                                +"<td hidden>"+"<input type='hidden' value='"+item[i].art_id+"'  style='width: 90%;border:1px #FFFFFF solid'>"+"</td>"
                                +"</tr>";

                            $('#child_plan_exec_list').append(tr);
                        }

                        layer.open({
                            type:1,
                            title:'子物料计划执行',
                            area: ['90%','70%'],
                            shadeClose: true,
                            content:$('#child_plan_exec'),
                            btn:['确认提交','不添加子物料，直接提交'],
                            yes:function () {
//                                得到父级的计划执行数据
                                var plan_code = $('#plan_code').val();
                                var plan_name = $('#plan_name').val();
                                var pid = $('#pid').val();
                                var pname = $('#pname').val();
                                var art_id = $('#art_id').val();
                                var art_name = $('#aname').val();
                                var exec_date = $('#exec_date').val();
                                var stove_num = $('#stove_num').val();
                                var plate_weight = $('#plate_weight').val();
                                var gross_weight = $('#gross_weight').val();
                                var material_num = $('#material_num').val();
                                var pnote=$('#pnote').val();

                                //遍历子集计划执行数据
                                var eachcount=0;
                                var child_exec_list=[];//json列表
                                $("#child_plan_exec_list tr").each(function () {
                                    //遍历获取子物料数据
//                                    var child_plan_code = $(this).children().eq(0).children().html();
//                                    var child_plan_name = $(this).children().eq(1).children().html();
                                    var child_pid = $(this).children().eq(9).children().val();
                                    var child_pname = $(this).children().eq(1).children().html();
                                    var child_art_id = $(this).children().eq(10).children().val();
                                    var child_art_name = $(this).children().eq(3).children().html();
                                    var child_stove_num = $(this).children().eq(4).children().val();
                                    var child_plate_weight = $(this).children().eq(5).children().val();
                                    var child_gross_weight = $(this).children().eq(6).children().val();
                                    var child_material_num = $(this).children().eq(7).children().val();
                                    var child_pnote = $(this).children().eq(8).children().val();
//                                alert(child_plan_code);
                                    eachcount++; //$.each是异步的，防止数据未全部请求成功就刷新页面
                                    if(eachcount<=$("#child_plan_exec_list tr").length){
                                        child_exec_list.push({
//                                            'plan_code':child_plan_code,
//                                            'plan_name':child_plan_name,
                                            'pid':child_pid,
                                            'pname':child_pname,
                                            'art_id':child_art_id,
                                            'art_name':child_art_name,
                                            'stove_num':child_stove_num,
                                            'plate_weight':child_plate_weight,
                                            'gross_weight':child_gross_weight,
                                            'material_num':child_material_num,
                                            'pnote':child_pnote,

                                        });
                                    }
                                });
                                $.post("{{url('admin/planexec/')}}",{
                                    "_token":'{{csrf_token()}}',
                                    'plan_code':plan_code,
                                    'plan_name':plan_name,
                                    'pid':pid,
                                    'pname':pname,
                                    'art_id':art_id,
                                    'art_name':art_name,
                                    'stove_num':stove_num,
                                    'exec_date':exec_date,
                                    'plate_weight':plate_weight,
                                    'gross_weight':gross_weight,
                                    'material_num':material_num,
                                    'pnote':pnote,
                                    'child_exec_list':child_exec_list
                                },function (data) {
                                    if(data.status=='1'){
                                        window.location.href="{{url('admin/planexec')}}";
                                    }else{
                                        layer.msg(data.msg);
                                    }
                                });


                            },
                            btn2:function (index) {
                                only_parent();//只提交父级
                            }
                        });break;
                    case '0':only_parent();break;

                    case '-1':layer.msg(data.msg);break;
                    default:return false;break;
                }

            });


        }
        function isnull(value) {
            if(value==null){
                return ''
            }else{
                return value;
            }
        }

        function only_parent() {
            //得到父级的计划执行数据
            var plan_code = $('#plan_code').val();
            var plan_name = $('#plan_name').val();
            var pid = $('#pid').val();
            var pname = $('#pname').val();
            var art_id = $('#art_id').val();
            var art_name = $('#aname').val();
            var exec_date = $('#exec_date').val();
            var stove_num = $('#stove_num').val();
            var plate_weight = $('#plate_weight').val();
            var gross_weight = $('#gross_weight').val();
            var material_num = $('#material_num').val();
            var pnote=$('#pnote').val();

            $.post("{{url('admin/planexec/')}}",{
                "_token":'{{csrf_token()}}',
                'plan_code':plan_code,
                'plan_name':plan_name,
                'pid':pid,
                'pname':pname,
                'art_id':art_id,
                'art_name':art_name,
                'stove_num':stove_num,
                'exec_date':exec_date,
                'plate_weight':plate_weight,
                'gross_weight':gross_weight,
                'material_num':material_num,
                'pnote':pnote,
                'child_exec_list':null

            },function (data) {
                if(data.status=='1'){
                    window.location.href="{{url('admin/planexec')}}";
                }
                if(data.status=='3'){
                    window.location.href="{{url('admin/assist_index')}}";
                }
                else{
                    layer.msg(data.msg);
                }
            });
        }


    </script>

@endsection
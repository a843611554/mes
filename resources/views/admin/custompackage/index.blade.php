@extends('layouts.admin')
@section('content')

    <link rel="stylesheet" type="text/css" href="{{asset('js/DatePicker/skin/jedate.css')}}"/>
    <script type="text/javascript" src="{{asset('js/DatePicker/jquery.jedate.js')}}"></script>
    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="#">装箱</a> &raquo; 添加
    </div>
    <!--面包屑导航 结束-->

    <div class="result_content" style=" padding-left: 20px;margin-top: 10px">
        <div class="short_wrap">

            <a href="{{url('admin/custompackage/show')}}"><i class="fa fa-refresh"></i>查看装箱</a>

        </div>
    </div>
    <div class="result_wrap">

        <form action="" method="post" autocomplete="off">

            {{csrf_field()}}
            <table class="add_tab">

                <tbody>
                <tr>
                        <th><i class="require">*</i>装箱单号：</th>
                    <td>
                        @if($code == '')
                            <p style="color: red">获取单号失败，请刷新页面重试！</p>
                        @else
                            <p>{{$code}}</p>
                            <input type="hidden" id="pack_bill" value="{{$code}}">
                        @endif

                    </td>
                </tr>

                <tr>
                    <th><i class="require">*</i>订单号：</th>

                    <td>
                        <input type="text" id="order_no">
                    </td>
                </tr>

                <tr>
                    <th>客户号：</th>

                    <td>
                        <input type='text' list="cust_list" id="cust_code" onkeyup="select_cust_code(event,this.value)" name="cust_code">

                        <datalist id="cust_list">

                        </datalist>

                        <input type="button" value="查询客户" onclick="find_cust()">
                    </td>
                </tr>

                <tr>
                    <th>规格：</th>

                    <td>
                        <input type="text" id="box_size">
                    </td>
                </tr>
                <tr>
                    <th>单重：</th>

                    <td>
                        <input type="text" id="singal_weight">
                    </td>
                </tr>

                <tr>
                    <th><i class="require">*</i>装箱日期：</th>

                    <td>
                        <input type="text" readonly="readonly" name="fromdate" id="moddate" placeholder="装箱日期">
                    </td>
                </tr>

                <tr>
                    <th>备注：</th>
                    <td>
                        <input type="text" id="pnote">
                    </td>
                </tr>

                <tr>
                    <th></th>
                    <td >
                        <input type="button" value="添加明细" id="add_detail_btn">
                    </td>
                </tr>


                </tbody>
            </table>


            <div class="result_content">
                <table class="list_tab">
                    <tr>
                        <th class="tc">物料编号</th>
                        <th>物料名称</th>
                        <th>型号</th>
                        <th>规格</th>
                        <th>修改日期</th>
                        <th>修改者</th>
                        <th>数量</th>
                        <th>操作</th>
                    </tr>
                    <tbody  id="detail_list">
                    </tbody>
                </table>
            </div>

        </form>

            {{--添加详单弹出框--}}
            <table class="add_tab" id="add_detail" hidden>

                <tbody>

                <tr>
                    <th><i class='require'>*</i>物料编号：</th>
                    <td>
                        <input type='text' list="plist" id="pcode" onkeyup="select_pcode(event,this.value);get_pinfo(this.value)" onchange="get_pinfo(this.value)" name="pcode">

                        <datalist id="plist">

                        </datalist>

                        <input type="button" value="查询物料" onclick="find_pcode()">
                    </td>
                </tr>

                <tr>
                    <th><i class='require'>*</i>物料名称：</th>
                    <td>
                        <p id="pname"></p>

                    </td>
                </tr>

                <tr>
                    <th><i class='require'>*</i>型号：</th>
                    <td>
                        <p id="pmodel"></p>
                    </td>
                </tr>

                <tr>
                    <th><i class='require'>*</i>规格：</th>
                    <td>
                        <p id="pstyle"></p>
                    </td>
                </tr>

                <tr>
                    <th><i class='require'>*</i>修改日期：</th>
                    <td>
                        <p id="moddate"></p>
                    </td>
                </tr>
                <tr>
                    <th><i class='require'>*</i>修改者：</th>
                    <td>
                        <p id="modman"></p>
                    </td>
                </tr>




                <tr>
                    <th><i class='require'>*</i>产品数量：</th>
                    <td>
                        <input type="text" id="box_num" onkeyup="checkNum(this)">
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <input type='button' value="提交" onclick="sub_detail()">

                    </td>
                </tr>

                </tbody>
            </table>
            {{--查询物料弹出框--}}
            <div class="result_content" id="find_pcode" hidden>
                <table class="search_tab">
                    <tr>
                        <th width="70">关键字：</th>
                        <td><input type="text" name="cust_keywords" id="p_keywords"></td>
                        <td><input type="button"  value="查询" onclick="pkeyword()"></td>
                    </tr>
                </table>
                <table class="list_tab">
                    <tr>
                        <th class="tc">物料编号</th>
                        <th>物料名称</th>
                        <th>型号</th>
                        <th>规格</th>
                        <th>修改日期</th>
                        <th>修改者</th>


                    </tr>
                    <tbody  id="find_pcode_list">
                    </tbody>
                </table>
            </div>






    </div>

    <script>

        $(function () {
            $("#moddate").jeDate({
                format: "YYYY-MM-DD hh:mm:ss",
                skinCell: "jedateblue",
                onClose: true
            });
        });
        function select_cust_code(event,keywords){
            if (event.keyCode==38 || event.keyCode==40){
                return false;
            } //输入上下方向键移动不触发ajax
            $.post("{{url('admin/custompackage/select_cust_code')}}", { "keywords": keywords ,'_token': '{{csrf_token()}}'},
                function(data){
                    $("#cust_list").children().remove();
                    $.each(data,function (idx,obj) {
                        var opt =  "<option value='"+obj.cust_code+"' >"+obj.cust_code+'('+obj.cust_nameCn+')'+"</option>";
                        $("#cust_list").append(opt);
                    })

                },"json");

        }


        function find_cust(){
            layer.open({
                title:'选择客户',
                type: 2,
                area: ['800px', '550px'],
                fixed: false,
                maxmin: true,
                content: "{{url('admin/custompackage/find_cust')}}"
            });
        }


        function select_pcode(event,keywords){
            if (event.keyCode==38 || event.keyCode==40){
                return false;
            } //输入上下方向键移动不触发ajax
            $.post("{{url('admin/custompackage/select_pcode')}}", { "keywords": keywords ,'_token': '{{csrf_token()}}'},
                function(data){
                    $("#plist").children().remove();
                    $.each(data,function (idx,obj) {
                        var opt =  "<option value='"+obj.pcode+"' >"+obj.pcode+"</option>";
                        $("#plist").append(opt);
                    })

                },"json");

        }
        function get_pinfo(pcode) {
//            alert(pcode);
            $.post("{{url('admin/custompackage/get_pinfo')}}", { "pcode": pcode ,'_token': '{{csrf_token()}}'},
                function(data){
                    $("p#pname").html(is_set(data[0].pname));
                    $("p#pmodel").html(is_set(data[0].pmodel));
                    $("p#pstyle").html(is_set(data[0].pstyle));
                    $("p#moddate").html(timestampToTime(data[0].moddate));
                    $("p#modman").html(is_set(data[0].modman));

                },"json");
        }




        //添加详单按钮
        $("#add_detail_btn").click(function () {
            $("#pcode").val('');
            $("#box_num").val('');
            $("p#pname").html('');
            $("p#pmodel").html('');
            $("p#pstyle").html('');
            $("p#moddate").html('');
            $("p#modman").html('');
            //每次添加时，清空表格数据
              layer.open({
                title:'添加详单',
                type: 1,
                area: ['800px', '300px'],
                shadeClose: true,
                content: $("#add_detail")
            });
        });

        //选择产品
        function find_pcode(){
            $("#find_pcode_list").children().remove();
            $("#p_keywords").val('');
            $.post("{{url('admin/custompackage/find_pcode')}}",{'_token':'{{csrf_token()}}'},
                function (data) {
                    $.each(data,function (idx,obj) {

                        var tr = "<tr>"+
                            "<td><a href='javascript:void(0)' ondblclick='choice_pcode(this)'>"+obj.pcode+"</a></td>"+
                            "<td>"+obj.pname+"</td>"+
                            "<td>"+obj.pmodel+"</td>"+
                            "<td>"+obj.pstyle+"</td>"+
                            "<td>"+timestampToTime(obj.moddate)+"</td>"+
                            "<td>"+obj.modman+"</td>"+
                            "</tr>"
                        $("#find_pcode_list").append(tr);
                    })
                });

             layer.open({
                title: '查询产品',
                type: 1,
                area: ['80%', '80%'],
                shadeClose: true,
                content: $("#find_pcode")
            });
        }

        function pkeyword(){
            $("#find_pcode_list").children().remove();

            $.post("{{url('admin/custompackage/pkeyword')}}",{'_token':'{{csrf_token()}}','keywords':$('#p_keywords').val()},
                function (data) {
                    $.each(data,function (idx,obj) {

                        var tr = "<tr>"+
                            "<td><a href='javascript:void(0)' ondblclick='choice_pcode(this)'>"+obj.pcode+"</a></td>"+
                            "<td>"+obj.pname+"</td>"+
                            "<td>"+obj.pmodel+"</td>"+
                            "<td>"+obj.pstyle+"</td>"+
                            "<td>"+timestampToTime(obj.moddate)+"</td>"+
                            "<td>"+obj.modman+"</td>"+
                            "</tr>"
                        $("#find_pcode_list").append(tr);
                    })
                });
        }

        function choice_pcode(p) {
            $("#pcode").val(p.innerHTML);

            get_pinfo(p.innerHTML);

            layer.close(layer.index); //关闭最上层的弹出层
        }

        //数量只能输入正整数
        function checkNum(obj)
        {
            if(obj.value.length == 1) {
                obj.value = obj.value.replace(/[^1-9]/g, '')
            } else {
                obj.value = obj.value.replace(/\D/g, '')
            }
        }


        //提交详单
        function sub_detail() {
            //获取数据
            var pcode = $("#pcode").val();
            var pname = $("#pname").html();
            var pmodel = $("#pmodel").html();
            var pstyle = $("#pstyle").html();
            var moddate = $("#moddate").html();
            var modman = $("#modman").html();
            var box_num = $("#box_num").val();

            if(box_num == ''){
                alert("请输入数量");
                return false;
            }
            //验证数据
            $.post("{{url('admin/custompackage/check_detail')}}", { "pcode": pcode ,'_token': '{{csrf_token()}}'},
                function(data){
                    if(data.status == 1){
                        layer.closeAll()
                        layer.msg(data.msg, {icon: 5});
                        return false;
                    }else {
                        var tr = "<tr>" +
                        "<td hidden>"+ "<input type='hidden' value='"+(data[0].pcode)+"'>"+ "</td>" +
                            "<td>"+is_set(data[0].pcode)+"</td>"+
                            "<td>"+is_set(data[0].pname)+"</td>"+
                            "<td>"+is_set(data[0].pmodel)+"</td>"+
                            "<td>"+is_set(data[0].pstyle)+"</td>"+
                            "<td>"+is_set(timestampToTime(data[0].moddate))+"</td>"+
                            "<td>"+is_set(data[0].modman)+"</td>"+
                            "<td>"+is_set(box_num)+"</td>"+
                            "<td><a href='javascript:void(0)' onclick='del_row(this)'>删除</a></td>"+
                         "<td hidden>" +  "<input type='hidden' value='"+box_num+"'>"+ "</td>"+

                            "</tr>";
                        //  插入行
                        $("#detail_list").append(tr);

                        //加入提交按钮
                        if($("#sub_package").length <=0){

                            var btn = "<input  id='sub_package'  type='button' value='提交'>"
                            $("#add_detail_btn").after(btn);
                        }

                        layer.closeAll()
                        layer.msg(data[1].msg, {icon: 6});
                    }

                },"json");



        }
        //删除一行详单
        function del_row(r) {
            $(r).parent().parent().remove();

            if($("#detail_list tr").length == 0){
                $("#sub_package").remove(); //详单数据为空，删除提交按钮
            }
        }


        //提交全部数据
        $("body").on("click","#sub_package",function () {
            //获取基本装箱信息
            var pack_bill = $("#pack_bill").val();
            var pnote = $("#pnote").val();
            var order_no = $("#order_no").val();
            var cust_no = $("#cust_code").val();
//            alert(cust_no);
            var box_size = $("#box_size").val();
            var singal_weight = $("#singal_weight").val();
            var moddate = $("#moddate").val();


            if(order_no==""){
                layer.alert("请输入订单号",{icon:7});
                return false;
            }
//            if(cust_no==""){
//                layer.alert("请输入客户号",{icon:7});
//                return false;
//            }
//            if(box_size==""){
//                layer.alert("请输入规格",{icon:7});
//                return false;
//            }
//            if(singal_weight==""){
//                layer.alert("请输入单重",{icon:7});
//                return false;
//            }
            if(moddate==0||moddate==""){
                layer.alert("请输入时间",{icon:7});
                return false;
            }else{
                moddate = Date.parse($("#moddate").val())/1000;//时间戳处理
            } //时间验证

            var eachcount=0;
            var detail_json=[];//json列表
            $("#detail_list tr").each(function () {
                //遍历获取详单pcode  和  数量
                var pcode = $(this).children("td:first").children().val();
                var box_num = $(this).children("td:last").children().val();

                eachcount++; //$.each是异步的，防止数据未全部请求成功就刷新页面
                if(eachcount<=$("#detail_list tr").length){
                    detail_json.push({'pcode':pcode,'box_num':box_num});
                }
            });

            //提交信息
            $.post("{{url('admin/custompackage/save_pack')}}",
                {
                    "pack_bill": pack_bill ,
                    'order_no':order_no,
                    'cust_no':cust_no,
                    'pnote':pnote,
                    'box_size':box_size,
                    'singal_weight':singal_weight,
                    'moddate':moddate,
                    'pstate':0,
                    "detail_json":detail_json,
                    '_token': '{{csrf_token()}}'
                },
                function(data){
                    if(data.status == 1){
                        layer.msg(data.msg,{icon:6});

                        location.reload();//操作完成 刷新页面
                    }else{
                        layer.msg(data.msg,{icon:5});
                    }
                });




        });


        function timestampToTime(timestamp) {
            var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
            Y = date.getFullYear() + '-';
            M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
            D = date.getDate() + ' ';
            h = date.getHours() + ':';
            m = date.getMinutes() + ':';
            s = date.getSeconds();
            return Y+M+D+h+m+s;
        }

        function  is_set(obj) {
            if(obj == null || obj==''){
                return "无";
            }else{
                return obj;
            }
        } //空数据处理





    </script>
@endsection
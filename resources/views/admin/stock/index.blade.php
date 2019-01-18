@extends("layouts.admin")

@section("content")
    <link rel="stylesheet" type="text/css" href="{{asset('js/DatePicker/skin/jedate.css')}}"/>
    <script type="text/javascript" src="{{asset('js/DatePicker/jquery.jedate.js')}}"></script>

    <script type="text/javascript" src="{{asset('js/zTree/js/jquery.ztree.core.js')}}"></script>
    <link rel="stylesheet" type="text/css" href="{{asset('js/zTree/css/zTreeStyle/zTreeStyle.css')}}"/>


    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; 出入库
    </div>
    <!--面包屑导航 结束-->
    <div class="result_wrap">


                <table class="add_tab">
                    <tbody>
                    <tr>
                        <th><i class="require">*</i>单号:</th>
                        <td> @if($code == '')
                                <p style="color: red">获取单号失败，请刷新页面重试！</p>
                            @else
                                <p>{{$code}}</p>
                                <input type="hidden" id="si_no" value="{{$code}}">
                            @endif </td>

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
                        <th><i class="require">*</i>操作类型:</th>
                        <td>
                            <input type='text' autocomplete="off" list="oper_list" id="oper_id" data-id="" onkeyup="select_oper_id(event,this.value)" name="oper_id">

                            <datalist id="oper_list">

                            </datalist>

                            <input type="button" value="查询操作类型" onclick="find_oper()"></td>


                        </td>

                    </tr>
                    <tr>
                        <th><i class="require">*</i>日期:</th>
                        <td>
                            <input type="text" autocomplete="off" readonly="readonly" name="fromdate" id="si_date" placeholder="出入库时间">
                        </td>
                    </tr>


                    <tr>
                        <th></th>
                        <td>
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
                        <th>仓库编码</th>
                        <th>操作</th>
                    </tr>
                    <tbody  id="detail_list">
                    </tbody>
                </table>
            </div>

    </div>



{{--------------------------弹出窗体-----------------------------------}}



    {{--查询客户弹出框--}}
    <div class="result_content" id="find_cust" hidden>
        <table class="search_tab">
            <tr>
                <th width="70">关键字：</th>
                <td><input type="text" name="cust_keywords" id="cust_keywords"></td>
                <td><input type="button"  value="查询" onclick="custkeyword()"></td>
            </tr>
        </table>
        <table class="list_tab">
            <tr>
                <th class="tc">客户编号</th>
                <th>中文名</th>
                <th>英文名</th>
            </tr>
            <tbody  id="find_cust_list">
            </tbody>
        </table>
    </div>
    {{--查询操作弹出框--}}
    <div class="result_content" id="find_oper" hidden>
        <table class="list_tab">
            <tr>
                <th class="tc">操作编号</th>
                <th>操作名</th>

            </tr>
            <tbody  id="find_oper_list">
            </tbody>
        </table>
    </div>
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
            <th><i class="require">*</i>仓库位置:</th>
            <td>
                <input type="hidden" id="stor_id" value="">
                <input type="text" readonly id="stor_pos">
                <input type="button" value="选择仓库" onclick="select_stor()">


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

    {{--选择仓库--}}
    <div id="select_stor" hidden >
        <ul id="stor_tree" class="ztree" style="width:260px; overflow:auto;"></ul>
    </div>



    <script>




        $(function () {
            $("#si_date").jeDate({
                format: "YYYY-MM-DD hh:mm:ss",
                skinCell: "jedateblue",
                onClose: true
            });//时间输入框

            var setting = {
                view: {
                    dblClickExpand: false,
                    showLine: true,
                    selectedMulti: false
                },
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "id",
                        pIdKey: "pid",
                        rootPId: "0"
                    }
                },
                callback: {
                    onClick: zTreeOnClick
                }
            }
            function zTreeOnClick(event, treeId, treeNode) {
                if(!treeNode.isParent) {
                    var stor_pos =treeNode.name;
                    var pNode = treeNode.getParentNode();
                    while (pNode != null){
                        stor_pos = pNode.name+'-'+stor_pos;
                        pNode = pNode.getParentNode();
                    }


                    $("#stor_id").val(treeNode.id);
                    $("#stor_code").val(treeNode.code);
                    $('#stor_pos').val(stor_pos);
                    layer.close(layer.index);
                }else{
                    return false;
                } //只可选择叶节点

            };
            var zNodes=[
                    @foreach($stor as $v)
                        {id:'{{$v->Stor_id}}',pid:'{{$v->Sp_ParentNo}}',name:'{{$v->Stor_name}}',code:'{{$v->Stor_code}}' },
                    @endforeach
            ];

            $(document).ready(function () {
                var stor = $("#stor_tree");
                stor = $.fn.zTree.init(stor, setting, zNodes);
            });

        });




        //选择仓库
        function select_stor() {
            layer.open({
                title: '选择仓库',
                type:1,
                area:['40%','80%'],
                shadeClose: true,
                content:$('#select_stor')
            });
        }



        function select_cust_code(event,keywords){
            if (event.keyCode==38 || event.keyCode==40){
                return false;
            } //输入上下方向键移动不触发ajax
            $.post("{{url('admin/stock/select_cust_code')}}", { "keywords": keywords ,'_token': '{{csrf_token()}}'},
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





        //选择操作
        function select_oper_id(event,keywords){
            if (event.keyCode==38 || event.keyCode==40){
                return false;
            } //输入上下方向键移动不触发ajax
            $.post("{{url('admin/stock/select_oper_id')}}", { "keywords": keywords ,'_token': '{{csrf_token()}}'},
                function(data){
                    $("#oper_list").children().remove();
                    $.each(data,function (idx,obj) {
                        var opt =  "<option value='"+obj.Oper_name+"'  data-id='"+obj.Oper_code+"'>"+obj.Oper_code+obj.Oper_name+"</option>";
                        $("#oper_list").append(opt);
                    })

                },"json");

        }
        //查询操作
        function find_oper() {
            $("#find_oper_list").children().remove();
            $.post("{{url('admin/stock/find_oper')}}",{'_token':'{{csrf_token()}}'},
                function (data) {
                    $("#find_cust_list").children().remove();

                    $.each(data,function (idx,obj) {
                        var tr = "<tr>"+
                            "<td><a href='javascript:void(0)' ondblclick='choice_oper("+'"'+obj.Oper_code+'"'+',"'+obj.Oper_name+'"'+")'>"+obj.Oper_code+"</a></td>"+
                            "<td>"+obj.Oper_name+"</td>"+

                            "</tr>"
                        $("#find_oper_list").append(tr);
                    })
                });

            layer.open({
                title: '查询操作',
                type: 1,
                area: ['500px', '70%'],
                shadeClose: true,
                content: $("#find_oper")
            });
        }

        //选择操作按钮
        function choice_oper(Oper_code,Oper_name) {
            $("#oper_id").attr("data-id",Oper_code);
            $("#oper_id").val(Oper_name);

            layer.closeAll();
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
            $('#stor_pos').val('');
            $('#stor_id').val('');


            //每次添加时，清空表格数据

            layer.open({
                title:'添加详单',
                type: 1,
                area: ['800px', '400px'],
                shadeClose: true,
                content: $("#add_detail")
            });
        });

        /*添加详单*/

        //数量只能输入正整数
        function checkNum(obj)
        {
            if(obj.value.length == 1) {
                obj.value = obj.value.replace(/[^1-9]/g, '')
            } else {
                obj.value = obj.value.replace(/\D/g, '')
            }
        }

        //模糊查询产品
        function select_pcode(event,keywords){
            if (event.keyCode==38 || event.keyCode==40){
                return false;
            } //输入上下方向键移动不触发ajax
            $.post("{{url('admin/stock/select_pcode')}}", { "keywords": keywords ,'_token': '{{csrf_token()}}'},
                function(data){
                    $("#plist").children().remove();
                    $.each(data,function (idx,obj) {
                        var opt =  "<option value='"+obj.pcode+"' >"+obj.pcode+"</option>";
                        $("#plist").append(opt);
                    })

                },"json");

        }

        //选择产品
        function find_pcode(){
            $("#find_pcode_list").children().remove();
            $("#p_keywords").val('');
            $.post("{{url('admin/stock/find_pcode')}}",{'_token':'{{csrf_token()}}'},
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

            $.post("{{url('admin/stock/pkeyword')}}",{'_token':'{{csrf_token()}}','keywords':$('#p_keywords').val()},
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




        //获取产品信息
        function get_pinfo(pcode) {

            $.post("{{url('admin/stock/get_pinfo')}}", { "pcode": pcode ,'_token': '{{csrf_token()}}'},
                function(data){
                    $("p#pname").html(is_set(data[0].pname));
                    $("p#pmodel").html(is_set(data[0].pmodel));
                    $("p#pstyle").html(is_set(data[0].pstyle));
                    $("p#moddate").html(timestampToTime(data[0].moddate));
                    $("p#modman").html(is_set(data[0].modman));

                },"json");
        }

        //添加产品详单
        function sub_detail() {
            //获取数据
            var pcode = $("#pcode").val();
            var pname = $("#pname").html();
            var pmodel = $("#pmodel").html();
            var pstyle = $("#pstyle").html();
            var moddate = $("#moddate").html();
            var modman = $("#modman").html();
            var box_num = $("#box_num").val();
            var stor_pos = $("#stor_pos").val();
            var stor_id = $('#stor_id').val();



            if(pcode == ''){
                layer.alert('物料编码不能为空',{icon:0});
                return false;
            }

            if(box_num == ''){
               layer.alert('请输入数量',{icon:0});
                return false;
            }
            if(stor_id == ''){
                layer.alert('请选择仓库',{icon:0});
                return false;
            }
            //验证数据
            $.post("{{url('admin/stock/check_detail')}}", { "pcode": pcode ,'_token': '{{csrf_token()}}'},
                function(data){
                    if(data.status == 1){
                        layer.closeAll()
                        layer.msg(data.msg, {icon: 5});
                        return false;
                    }else {
                        var tr = "<tr>" +
                            "<td hidden>" + "<input type='hidden' value='"+(data[0].pcode)+"'>"+ "</td>" +
                            "<td hidden>" + "<input type='hidden' value='"+box_num+"'>"+ "</td>"+
                            "<td hidden>" + "<input type='hidden' value='"+stor_id+"'>"+ "</td>"+
                            "<td>"+is_set(data[0].pcode)+"</td>"+
                            "<td>"+is_set(data[0].pname)+"</td>"+
                            "<td>"+is_set(data[0].pmodel)+"</td>"+
                            "<td>"+is_set(data[0].pstyle)+"</td>"+
                            "<td>"+is_set(timestampToTime(data[0].moddate))+"</td>"+
                            "<td>"+is_set(data[0].modman)+"</td>"+
                            "<td>"+is_set(box_num)+"</td>"+
                            "<td>"+is_set(stor_pos)+"</td>"+
                            "<td><a href='javascript:void(0)' onclick='del_row(this)'>删除</a></td>"+

                            "</tr>";
                        //  插入行
                        $("#detail_list").append(tr);

                        //加入提交按钮
                        if($("#sub_stock").length <=0){

                            var btn = "<input  id='sub_stock'  type='button' value='提交'>"
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

            layer.msg('已删除',{icon:1});

            if($("#detail_list tr").length == 0){
                $("#sub_package").remove(); //详单数据为空，删除提交按钮
            }
        }

        //提交信息
        $("body").on("click","#sub_stock",function (){
             //获取单号基本信息
            var si_no = $("#si_no").val(); //单号
            var cust_code = $("#cust_code").val();//客户号
            var oper_id = $('#oper_id').attr('data-id');//获取操作编号
            var si_date = $('#si_date').val();//获取时间


            if(cust_code==""){
                layer.alert("请输入客户号",{icon:7});
                return false;
            }
            if(oper_id==""){
                layer.alert("请输入操作编号",{icon:7});
                return false;
            }
            if(si_date=="" || si_date==0){
                layer.alert("请选择时间",{icon:7});
                return false;
            }

            if(si_date==0 || si_date==0){
                layer.alert('时间不能为空',{icon:7});
            }else{
                si_date = Date.parse($("#si_date").val())/1000;//时间戳处理
            }

            var eachcount=0;
            var detail_json=[];//json列表
            $("#detail_list tr").each(function () {
                //遍历获取详单pcode   仓库    数量
                var pcode = $(this).children().eq(0).children().val();
                var box_num = $(this).children().eq(1).children().val();
                var stor_id = $(this).children().eq(2).children().val();

                eachcount++; //$.each是异步的，防止数据未全部请求成功就刷新页面
                if(eachcount<=$("#detail_list tr").length){
                    detail_json.push({'pcode':pcode,'box_num':box_num,'stor_id':stor_id});

                }
            });

            $.post("{{url('admin/stock/save_stock')}}",
                {
                    "si_no" :si_no,
                    "cust_code":cust_code,
                    "oper_id":oper_id,
                    "si_date":si_date,

                    "detail_json":detail_json,
                    '_token': '{{csrf_token()}}'
                },
                function(data){
                    if(data.status == 1){
//                        layer.alert(data.msg+'3秒后自动刷新',{icon:6});

                        layer.confirm(data.msg+'! 3秒后自动刷新', {
                            btn: ['立刻刷新','知道了'] //按钮
                        }, function(){
                            location.reload();
                        }, function(){

                        });

                        setTimeout("location.reload()",3000); //操作完成 3秒后刷新


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
@extends('layouts.admin')
        @section('content')

            <!--面包屑导航 开始-->
            <div class="crumb_warp">
                <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
                <i class="fa fa-home"></i> <a href="#">首页</a> &raquo;<a href="#">生产物料清单</a> &raquo; 修改
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
                        <a href="{{url('admin/producebom/create')}}"><i class="fa fa-plus"></i>新增生产清单</a>
                        <a href="{{url('admin/producebom/')}}"><i class="fa fa-refresh"></i>查看生产清单</a>
                    </div>
                </div>
            </div>
            <!--结果集标题与导航组件 结束-->


            <div class="result_wrap">

                    {{csrf_field()}}
                    <table class="add_tab">
                        <tbody>

                        <tr>
                            <th>物料编号：</th>
                            <td>
                                <input type='text' readonly list="plist" id="Pd_Code" AUTOCOMPLETE="off" name="Pd_Code" value="{{$Pd_Info->Pd_Code}}">

                            </td>

                        </tr>
                        <tr>
                            <th>物料名称：</th>
                            <td>
                                <p id="Pd_Name">{{$Pd_Info->Pd_Name}}</p>
                            </td>
                        </tr>
                        <tr>
                            <th>型号：</th>
                            <td>
                                <p id="Pd_Model">{{$Pd_Info->Pd_Model}}</p>
                            </td>
                        </tr>

                        <tr>
                            <th>规格：</th>
                            <td>
                                <p id="Pd_Style">{{$Pd_Info->Pd_Style}}</p>
                            </td>
                        </tr>

                        <tr>
                            <th>出成率：</th>
                            <td>
                                <input type="text" value="{{$Pd_Info->Pb_per}}" name="Pb_Per" id="Pb_Per" onkeyup="checkFloat(this)" onblur="fomatFloat(this,4)" >
                            </td>
                        </tr>



                        <tr>
                            <th></th>
                            <td>
                                <input type="button" onclick="submit()" value="提交">
                                <input type="button" class="back" onclick="history.go(-1)" value="返回">
                            </td>
                        </tr>


                        </tbody>
                    </table>

                    <table class="list_tab">
                        <tr>
                            <th>子物料编号</th>
                            <th>子物料名称</th>
                            <th>型号</th>
                            <th>规格</th>
                            <th>子物料毛数量</th>
                            <th>子物料净数量</th>
                            <th>子物料出成率</th>
                            <th>是否可选</th>
                            <th>备注</th>
                            <th>操作</th>
                        </tr>
                        <tbody id="child_list">
                            @foreach($Child_Pd_Info as $child)
                                <tr>
                                    <td>{{$child->Pb_ChildCode}}</td>
                                    <td>{{$child->Pb_Child_Name}}</td>
                                    <td>{{$child->Pb_Child_Model}}</td>
                                    <td>{{$child->Pb_Child_Style}}</td>
                                    <td>{{$child->Pb_ChildGross}}</td>
                                    <td>{{$child->Pb_ChildNet}}</td>
                                    <td>{{$child->Pb_ChildPer}}</td>
                                    <td>@if($child->Pb_ChildMay=='1')可选@else不可选@endif</td>
                                    <td>{{$child->Pb_Note}}</td>
                                    <td><a href='javascript:void(0)' onclick=del_child_pd(this)>删除</a></td>


                                    <td hidden><input hidden id='Pb_ChildCode' value='{{$child->Pb_ChildCode}}'></td>
                                    <td hidden><input hidden id='Pb_ChildGross' value='{{$child->Pb_ChildGross}}'></td>
                                    <td hidden><input hidden id='Pb_ChildNet' value='{{$child->Pb_ChildNet}}'></td>
                                    <td hidden><input hidden id='Pb_ChildPer' value='{{$child->Pb_ChildPer}}'></td>
                                    <td hidden><input hidden id='Pb_ChildMay' value='{{$child->Pb_ChildMay}}'></td>
                                    <td hidden><input hidden id='Pb_Note' value='{{$child->Pb_Note}}'></td>
                                </tr>

                            @endforeach
                        </tbody>

                        <tr >
                            <td colspan="10" style="text-align: center">
                                <a href="javascript:void(0)"   onclick="add_child_pd()"><i class="fa fa-plus"></i>添加子物料</a>
                            </td>
                        </tr>

                    </table>

            </div>

            <script>


                function select_pcode(event,keywords){
                    if (event.keyCode==38 || event.keyCode==40){
                        return false;
                    } //输入上下方向键移动不触发ajax
                    $.post("{{url('admin/producebom/select_pcode')}}", { "keywords": keywords ,'_token': '{{csrf_token()}}'},
                        function(data){
                            $("#plist").children().remove();
                            $.each(data,function (idx,obj) {
                                var opt =  "<option value='"+obj.pcode+"' >"+obj.pcode+"</option>";
                                $("#plist").append(opt);
                            })

                        });

                }

                function get_pinfo(Pd_Code) {
                    $('#Pd_Name').html('');
                    $('#Pd_Model').html('');
                    $('#Pd_Style').html('');
                    $.post("{{url('admin/producebom/get_pinfo')}}", { "Pd_Code": Pd_Code ,'_token': '{{csrf_token()}}'},
                        function(data){
                            $('#Pd_Name').html(data.pname);
                            $('#Pd_Model').html(data.pmodel);
                            $('#Pd_Style').html(data.pstyle);

                        });
                }

                function find_pcode() {
                    layer.open(
                        {
                            title:'查找物料',
                            type:2,
                            area: ['600px', '600px'],
                            shadeClose: true,
                            content: "{{url('admin/producebom/find_pcode')}}"
                        }
                    );
                }

                function add_child_pd() {
                    if($('#Pb_Per').val()==''){
                        layer.msg('请先填写完整物料信息');
                        return false;
                    }

                    layer.open(
                        {
                            title:'添加物料',
                            type:2,
                            area: ['800px', '500px'],
                            shadeClose: true,
                            content: "{{url('admin/producebom/add_child_pd')}}"
                        }
                    );
                }

                function del_child_pd(r) {
                    layer.confirm('您确定删除该子物料吗？', {
                        btn: ['确认', '取消'] //按钮
                    }, function () {
                        $(r).parent().parent().remove();
                        layer.msg('已删除');
                    }, function () {

                    });
                }

                function submit() {
                    //获取物料信息
                    var Pd_Code = "{{$Pd_Info->Pd_Code}}";
                    var Pb_Per  = $('#Pb_Per').val();

                    //获取子物料信息
                    var eachcount=0;
                    var child_pd_list=[];//json列表
                    $("#child_list tr").each(function () {
                        //遍历获取子物料数据
                        var Pb_ChildCode = $(this).children().eq(10).children().val();
                        var Pb_ChildGross = $(this).children().eq(11).children().val();
                        var Pb_ChildNet = $(this).children().eq(12).children().val();
                        var Pb_ChildPer = $(this).children().eq(13).children().val();
                        var Pb_ChildMay = $(this).children().eq(14).children().val();
                        var Pb_Note = $(this).children().eq(15).children().val();

                        eachcount++; //$.each是异步的，防止数据未全部请求成功就刷新页面
                        if(eachcount<=$("#child_list tr").length){
                            child_pd_list.push({'Pb_ChildCode':Pb_ChildCode,
                                'Pb_ChildGross':Pb_ChildGross,
                                'Pb_ChildNet':Pb_ChildNet,
                                'Pb_ChildPer':Pb_ChildPer,
                                'Pb_ChildMay':Pb_ChildMay,
                                'Pb_Note':Pb_Note,
                            });
                        }
                    });


                    if(child_pd_list.length<=0){
                        layer.msg('请选择子物料');
                        return false;
                    }

                    $.post("{{url('admin/producebom/')}}"+'/'+Pd_Code,{
                        "_token":'{{csrf_token()}}',
                        '_method':'put',
                        'Pd_Code':Pd_Code,
                        'Pb_Per':Pb_Per,
                        'child_pd_list':child_pd_list
                    },function (data) {
                        if(data.status=='1'){
                            window.location.href="{{url('admin/producebom')}}";
                        }else{
                            layer.msg(data.msg);
                        }
                    });
                }


                //保留n位小数并格式化输出（不足的部分补0）
                var fomatFloat = function(obj, n) {
                    var value = obj.value;
                    var f = Math.round(value*Math.pow(10,n))/Math.pow(10,n);
                    var s = f.toString();
                    var rs = s.indexOf('.');
                    if (rs < 0) {
                        s += '.';
                    }
                    for(var i = s.length - s.indexOf('.'); i <= n; i++){
                        s += "0";
                    }
                    if(s>100){
                        obj.value='0.0000';
                        layer.msg('出成率不能大于100');
                    }else {
                        obj.value = s;
                    }
                }
                //出成率只能输入浮点数
                function checkFloat(obj)
                {
                    //先把非数字的都替换掉，除了数字和.

                    obj.value = obj.value.replace(/[^\d.]/g,"");

                    //保证只有出现一个.而没有多个.

                    obj.value = obj.value.replace(/\.{2,}/g,".");

                    //必须保证第一个为数字而不是.

                    obj.value = obj.value.replace(/^\./g,"");

                    //保证.只出现一次，而不能出现两次以上

                    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");

                    //只能输入两个小数

                    obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d\d\d).*$/,'$1$2.$3');
                }
            </script>


        @endsection


@extends('layouts.admin')
@section('content')


    <div class="result_wrap">
        <form action="{{url('admin/producebom/')}}" method="post">
            {{csrf_field()}}
            <table class="add_tab">
                <tbody>
                <tr>
                    <th><i class="require">*</i>物料编号：</th>
                    <td>
                        <input type='text' list="plist" id="Pd_Code" AUTOCOMPLETE="off"   onkeyup="select_pcode(event,this.value);get_pinfo(this.value)" onchange="get_pinfo(this.value)" name="Pb_ChildCode">

                        <datalist id="plist">

                        </datalist>
                        <input type="button" value="查询物料" onclick="find_pcode()">
                    </td>

                </tr>
                <tr>
                    <th>物料名称：</th>
                    <td>
                        <p id="Pb_Child_Name"></p>
                    </td>
                </tr>
                <tr>
                    <th>型号：</th>
                    <td>
                        <p id="Pb_Child_Model"></p>
                    </td>
                </tr>

                <tr>
                    <th>规格：</th>
                    <td>
                        <p id="Pb_Child_Style"></p>
                    </td>
                </tr>

                <tr>
                    <th><i class="require">*</i>子物料毛数量：</th>
                    <td>
                        <input type="text" name="Pb_ChildGross" id="Pb_ChildGross" onkeyup="checkNum(this)">
                    </td>
                </tr>
                <tr>
                    <th><i class="require">*</i>子物料净数量：</th>
                    <td>
                        <input type="text" name="Pb_ChildNet" id="Pb_ChildNet" onkeyup="checkNum(this)">
                    </td>
                </tr>
                <tr>
                    <th><i class="require">*</i>子物料出成率：</th>
                    <td>
                        <input type="text" name="Pb_ChildPer" id="Pb_ChildPer" onkeyup="checkFloat(this)" onblur="fomatFloat(this,4)" >
                    </td>
                </tr>

                <tr>
                    <th><i class="require">*</i>是否可选：</th>
                    <td>
                        是<input type="radio" name="Pb_ChildMay" value='1' checked>
                        否<input type="radio" name="Pb_ChildMay" value='0'>
                    </td>
                </tr>
                <tr>
                    <th>备注：</th>
                    <td>
                        <input type="text" name="Pb_Note" id="Pb_Note"  >
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <input type="button" value="添加" onclick="add_child_pd()">
                        <input type="button" class="back" onclick="history.go(-1)" value="返回">
                    </td>
                </tr>


                </tbody>
            </table>


        </form>
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
            $('#Pb_Child_Name').html('');
            $('#Pb_Child_Model').html('');
            $('#Pb_Child_Style').html('');
            $.post("{{url('admin/producebom/get_pinfo')}}", { "Pd_Code": Pd_Code ,'_token': '{{csrf_token()}}'},
                function(data){
                    $('#Pb_Child_Name').html(data.pname);
                    $('#Pb_Child_Model').html(data.pmodel);
                    $('#Pb_Child_Style').html(data.pstyle);

                });
        }

        function find_pcode() {
            layer.open(
                {
                    title:'查找子物料',
                    type:2,
                    area: ['600px', '450px'],
                    shadeClose: true,
                    content: "{{url('admin/producebom/find_child_pcode/')}}"
                }
            );
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

        //数量只能输入正整数
        function checkNum(obj)
        {
            if(obj.value.length == 1) {
                obj.value = obj.value.replace(/[^1-9]/g, '')
            } else {
                obj.value = obj.value.replace(/\D/g, '')
            }
        }

        //数量只能输入浮点数
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

        function add_child_pd() {
            var index = parent.layer.getFrameIndex(window.name);

            if($('#Pd_Code').val()==''){
                layer.msg('子物料编号不能为空');
                return false;
            }
            if($('#Pb_ChildGross').val()==''){
                layer.msg('子物料毛数量不能为空');
                return false;
            }
            if($('#Pb_ChildNet').val()==''){
                layer.msg('子物料净数量不能为空');
                return false;
            }
            if($('#Pb_ChildPer').val()==''){
                layer.msg('子物料出成率不能为空');
                return false;
            }
            if($("[name = 'Pb_ChildMay']:checked").val()==''){
                layer.msg('请选择是否可选');
                return false;
            }

            if($("[name = 'Pb_ChildMay']:checked").val()=='1'){
                var Pb_ChildMay_txt= '可选'
            }else{
                var Pb_ChildMay_txt= '不可选'
            }

            var tr = "<tr>"+
                "<td>"+$('#Pd_Code').val()+"</td>"+
                "<td>"+$('#Pb_Child_Name').html()+"</td>"+
                "<td>"+$('#Pb_Child_Model').html()+"</td>"+
                "<td>"+$('#Pb_Child_Style').html()+"</td>"+
                "<td>"+$('#Pb_ChildGross').val()+"</td>"+
                "<td>"+$('#Pb_ChildNet').val()+"</td>"+
                "<td>"+$('#Pb_ChildPer').val()+"</td>"+
                "<td>"+Pb_ChildMay_txt+"</td>"+
                "<td>"+$('#Pb_Note').val()+"</td>"+
                "<td><a href='javascript:void(0)' onclick=del_child_pd(this)>删除</a></td>"+


                //实际要遍历上传的数据
                "<td hidden><input hidden id='Pb_ChildCode' value='"+$('#Pd_Code').val()+"'></td>"+
                "<td hidden><input hidden id='Pb_ChildGross' value='"+$('#Pb_ChildGross').val()+"'></td>"+
                "<td hidden><input hidden id='Pb_ChildNet' value='"+$('#Pb_ChildNet').val()+"'></td>"+
                "<td hidden><input hidden id='Pb_ChildPer' value='"+$('#Pb_ChildPer').val()+"'></td>"+
                "<td hidden><input hidden id='Pb_ChildMay' value='"+$("[name = 'Pb_ChildMay']:checked").val()+"'></td>"+
                "<td hidden><input hidden id='Pb_Note' value='"+$('#Pb_Note').val()+"'></td>"+
                "</tr>";

            parent.$('#child_list').append(tr);

            parent.layer.close(index);
        }


        function add_child() {
                var index = parent.layer.getFrameIndex(window.name);

                if($('#Pd_Code').val()==''){
                    layer.msg('子物料编号不能为空');
                    return false;
                }
                if($('#Pb_ChildGross').val()==''){
                    layer.msg('子物料毛数量不能为空');
                    return false;
                }
                if($('#Pb_ChildNet').val()==''){
                    layer.msg('子物料净数量不能为空');
                    return false;
                }
                if($('#Pb_ChildPer').val()==''){
                    layer.msg('子物料出成率不能为空');
                    return false;
                }
                if($("[name = 'Pb_ChildMay']:checked").val()==''){
                    layer.msg('请选择是否可选');
                    return false;
                }



                $.ajax({
                    url:"{{url('admin/producebom/put_redis')}}",
                    async:false, //设为同步
                    type:'post',
                    data:{
                        '_token':'{{csrf_token()}}',
//                        'Pd_Code':parent.$('#Pd_Code').val(),
//                        'Pb_Per':parent.$('#Pb_Per').val(),
                        'Pb_ChildCode':$('#Pd_Code').val(),
                        'Pb_ChildGross':$('#Pb_ChildGross').val(),
                        'Pb_ChildNet':$('#Pb_ChildNet').val(),
                        'Pb_ChildPer':$('#Pb_ChildPer').val(),
                        'Pb_ChildMay':$("[name = 'Pb_ChildMay']:checked").val(),
                        'Pb_Note':$('#Pb_Note').val(),
                    },
                    success:function (data) {
                        if(data.status=="1"){
                            layer.msg(data.msg);
                            get_child_list(); //请求成功之后，获取新的数据，列入child_list

                        }else{
                            layer.msg('出错了');
                            return false;
                        }
                    },
                    error:function () {
                        layer('服务器请求失败');
                        return false;
                    }
                });


                function get_child_list() {
                    $.ajax({
                        url:"{{url('admin/producebom/get_child_list')}}",
                        async:false, //设为同步
                        type:'post',
                        data:{ '_token':'{{csrf_token()}}'},
                        success:function (data) {
                            parent.$('#child_list').children().remove();
                            for(var i in data){
                                if(data[i].Pb_ChildMay=='1'){
                                    var Pb_ChildMay_txt= '可选'
                                }else{
                                    var Pb_ChildMay_txt= '不可选'
                                }

                                if(data[i].Pb_Note==null){
                                    data[i].Pb_Note='';
                                }
                                var tr = "<tr>"+
                                            "<td>"+data[i].Pb_ChildCode+"</td>"+
                                            "<td>"+$('#Pb_Child_Name').html()+"</td>"+
                                            "<td>"+$('#Pb_Child_Model').html()+"</td>"+
                                            "<td>"+$('#Pb_Child_Style').html()+"</td>"+
                                            "<td>"+data[i].Pb_ChildGross+"</td>"+
                                            "<td>"+data[i].Pb_ChildNet+"</td>"+
                                            "<td>"+data[i].Pb_ChildPer+"</td>"+
                                            "<td>"+Pb_ChildMay_txt+"</td>"+
                                            "<td>"+data[i].Pb_Note+"</td>"+
                                             "<td><a href='javascript:void(0)' onclick=del_child_pd('"+data[i].Pb_ChildCode+"',this)>删除</a></td>"+
                                          "</tr>";

                                parent.$('#child_list').append(tr);
                            }

                            parent.layer.close(index);
                        },
                        error:function () {
                            layer('服务器请求失败');
                            return false;
                        }
                    });
                }




        }
    </script>



@endsection
 

 

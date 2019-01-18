@extends('layouts.admin')
        @section('content')

            <!--面包屑导航 开始-->
            <div class="crumb_warp">
                <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
                <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">仓库管理</a> &raquo; 库位添加
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
                        <a href="{{url('admin/datstorage/')}}"><i class="fa fa-refresh"></i>查询库位</a>
                    </div>
                </div>
                <!--快捷导航 结束-->
            </div>
            <!--结果集标题与导航组件 结束-->


            <div class="result_wrap">
                <form action="{{url('admin/datstorage')}}" method="post">
                    {{csrf_field()}}
                    <table class="add_tab">
                        <tbody>

                        <tr>
                            <th><i class="require">*</i>仓库：</th>
                            <td>
                                <select name="storage" id="storage" >
                                    <option value="">选择仓库</option>
                                    @foreach($storage as $s)
                                        @if(old('storage') == $s->Stor_code)
                                            <option value="{{$s->Stor_code}}" selected>{{$s->Stor_name}}</option>
                                        @else
                                            <option value="{{$s->Stor_code}}">{{$s->Stor_name}}</option>
                                        @endif
                                    @endforeach
                                </select>
                                <input type="button" value="添加仓库" onclick="add_stor()">
                                <input type="button" value="查看仓库" onclick="find_stor()">
                            </td>
                        </tr>

                        <tr>
                            <th><i class="require">*</i>架位：</th>
                            <td>
                                <input type="text" readonly name="rack" id="rack">
                                <input type="button" value="添加架位" onclick="add_rack()">
                                <input type="button" value="查询架位" onclick="find_rack()">

                            </td>
                        </tr>

                        <tr>
                            <th><i class="require">*</i>添加库位：</th>
                            <td>
                                <input type="button" value="选择" onclick="add_No()">
                                <input type="button" class="back" onclick="history.go(-1)" value="返回">
                            </td>
                        </tr>


                        </tbody>
                    </table>
                </form>
            </div>

            {{--添加仓库--}}
            <div id="add_stor" hidden style="margin: 50px">
                设置编号： <input onkeyup="checkNum(this)" type="text" id="Stor_code">
                <br><br>
                设置名称： <input  type="text" id="Stor_name">
            </div>

            {{--添加架位--}}
            <div id="add_rack" hidden style="margin: 50px">
                开始编号： <span class="storage_code"></span><input onkeyup="checkNum(this)" type="text" id="start_rack">
                <br><br>
                结束编号： <span class="storage_code"></span><input onkeyup="checkNum(this)" type="text" id="end_rack">
            </div>

            {{--添加库位--}}
            <div id="add_No" hidden style="margin: 50px ;width: 300px">
                开始编号： <span class="rack_code"></span><input onkeyup="checkNum(this)" type="text" id="start_No">
                <br><br>
                结束编号： </span><span class="rack_code"></span><input onkeyup="checkNum(this)" type="text" id="end_No">
            </div>

            <script>
                $('#storage').on('change',function () {
                    var stor_code = $('#storage').val();
                    $('#rack').val('');
                    if(stor_code == ''){
                        return false;
                    }

                    $.post("{{url('admin/datstorage/loadrack')}}",{'_token':"{{csrf_token()}}",'stor_code':stor_code},
                        function (data) {
                            if(data.length>0){
                                $.each(data,function (idx,obj) {
                                    var opt =  "<option value='"+obj.Stor_code+"' >"+'('+obj.Stor_code+')'+obj.Stor_name+"</option>";
                                    $("#rack_list").append(opt);
                                })
                            }else{
                                layer.msg('此仓库无架位');
                            }
                        });
                });

                layer.config({extend: 'extend/layer.ext.js'});
                function add_stor() {
                    layer.open({
                        title:'添加仓库',
                        type: 1,
                        shadeClose: true,
                        fixed: false,
                        maxmin: true,
                        content: $('#add_stor'),
                        btn: ['确认', '取消'],
                        yes: function(index){
                            $.post("{{url('admin/datstorage/add_stor')}}",{'_token':"{{csrf_token()}}",'Stor_name':$('#Stor_name').val(),'Stor_code':$('#Stor_code').val()},
                                function (data) {
                                    if(data.status ==1){
                                        layer.msg(data.msg);
                                        layer.close(index);
                                        location.reload();
                                    }else{
                                        layer.msg(data.msg);
                                    }
                                });
                        },
                    });

                }

                function add_rack() {
                    if($('#storage').val()==''){
                        layer.msg('请先选择仓库');
                        return false;
                    }
                    $('.storage_code').html($('#storage').val());

                    layer.open({
                        title:'添加架位',
                        type: 1,
                        shadeClose: true,
                        fixed: false,
                        maxmin: true,
                        content: $('#add_rack'),
                        btn: ['确认', '取消'],
                        yes: function(index){
                            if($('#end_rack').val()< $('#start_rack').val()){
                                layer.msg('结束值要大于起始值');
                                return false;
                            }
                            var start_rack = $('#storage').val().toString() + $('#start_rack').val().toString();
                            var end_rack = $('#storage').val().toString() + $('#end_rack').val().toString();

                            if( start_rack.length !=end_rack.length){
                                layer.msg('字符长度不同');
                                return false;
                            }
                            $.post("{{url('admin/datstorage/add_rack')}}",
                                {
                                    '_token':'{{csrf_token()}}',
                                    'start_rack':start_rack,
                                    'end_rack':end_rack,
                                    'storage':$('#storage').val().toString()
                                },function (data) {
                                    if(data.status==1){
                                        layer.msg(data.msg);
                                        layer.close(index);

                                    }else{
                                        layer.msg(data.msg);
                                    }
                                });

                        },
                    });
                }

                function add_No() {
                    if($('#rack').val()==''){
                        layer.msg('请先选择架位');
                        return false;
                    }
                    $('.rack_code').html($('#rack').val());

                    layer.open({
                        title:'添加库位',
                        type: 1,
                        shadeClose: true,
                        fixed: false,
                        maxmin: true,
                        content: $('#add_No'),
                        btn: ['确认', '取消'],
                        yes: function(index){
                            if($('#end_No').val()< $('#start_No').val()){
                                layer.msg('结束值要大于起始值');
                                return false;
                            }


                            var start_No = $('#rack').val().toString() + $('#start_No').val().toString();
                            var end_No = $('#rack').val().toString() + $('#end_No').val().toString();

                            if( start_No.length !=end_No.length){
                                layer.msg('字符长度不同');
                                return false;
                            }
                            $.post("{{url('admin/datstorage/add_No')}}",
                                {
                                    '_token':'{{csrf_token()}}',
                                    'start_No':start_No,
                                    'end_No':end_No,
                                    'rack':$('#rack').val().toString()
                                },function (data) {
                                    if(data.status==1){
                                        layer.msg(data.msg);
                                        layer.close(index);
                                        location.reload();

                                    }else{
                                        layer.msg(data.msg);
                                    }
                                });

                        },
                    });
                }

                function find_rack() {
                    var stor_code = $('#storage').val();//得到仓库编号
                    if(stor_code == ''){
                        layer.msg('请先选择仓库');
                        return false;
                    }

                        layer.open({
                            title:'选择架位',
                            type: 2,
                            area: ['500px', '550px'],
                            fixed: false,
                            maxmin: true,
                            content: "{{url('admin/datstorage/find_rack')}}"+'/'+stor_code
                        });

                }

                function find_stor() {
                    layer.open({
                        title:'查看仓库',
                        type: 2,
                        area: ['500px', '550px'],
                        fixed: false,
                        maxmin: true,
                        content: "{{url('admin/datstorage/find_stor')}}"+'/0'
                    });

                }

                function checkNum(obj)
                {
                    obj.value = obj.value.replace(/\D/g, '')
                }

            </script>

        @endsection


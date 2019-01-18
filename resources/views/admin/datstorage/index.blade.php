@extends('layouts.admin')

@section('content')


    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; 仓库管理
    </div>
    <!--面包屑导航 结束-->

    <!--搜索结果页面 列表 开始-->

    <form action="" method="get">
        {{csrf_field()}}
        <div class="result_wrap">
            <div class="result_title">
                <h3>快捷操作</h3>

            </div>
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <a href="{{url('admin/datstorage/create')}}"><i class="fa fa-plus"></i>新增仓库空间</a>
                    <table class="search_tab">
                        <tr>
                            <th>仓库号:</th>
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
                            </td>


                            <th>架位：</th>
                            <td>
                                <input type='text' name="rack" list="rack_list" id="rack" value="{{old('rack')}}">

                                <input type="button" value="查询架位" onclick="find_rack()">
                            </td>

                            <td><input type="submit"  value="查找"></td>

                            <td><input type="button"  value="显示全部" onclick="show_all()"></td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--快捷导航 结束-->
        </div>
    </form>


    <div class="result_wrap">
        <div class="result_content">
            <table class="list_tab">
                @if(isset($data))
                        <tr>
                            <th>库号</th>
                            <th>名称</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                    @foreach($data as $v)
                        <tr>
                            <td>{{$v->Stor_code}}</td>
                            <td>{{$v->Stor_name}}</td>
                            <td>
                                @if($v->Stor_usable ==1)
                                    <p style="color: #2ca02c">可用</p>
                                @else
                                    <p style="color: #5e5e5e">不可用</p>
                                @endif
                            </td>
                            <td>
                                <a href="{{url('admin/datstorage/'.$v->Stor_id.'/edit')}}"><i class="fa fa-pencil-square-o"></i>修改</a>
                                <a href="javascript:void(0)" onclick="del('{{$v->Stor_code}}',this)"><i class="fa fa-trash-o"></i>删除</a>
                            </td>
                        </tr>
                    @endforeach


            </table>

                        <div class="page_list">
                            {{ $data->links()}}
                        </div>

            @else
                <tr>
                    <td align="center">
                        请选择仓库和架位!
                    </td>
                </tr>

            @endif

            {{--添加架位--}}
            <div id="add_rack" hidden style="margin: 50px">
                开始编号： <span class="storage_code"></span><input type="text" id="start_rack">
                <br><br>
                结束编号： <span class="storage_code"></span><input type="text" id="end_rack">
            </div>

        </div>
    </div>



    <script>
        $('#storage').on('change',function () {
            var stor_code = $('#storage').val();
            $('#rack').val('');
            $("#rack_list").children().remove();
            if(stor_code == ''){
                return false;
            }

            $.post("{{url('admin/datstorage/loadrack')}}",{'_token':"{{csrf_token()}}",'stor_code':stor_code},
            function (data) {
                if(data.length>0){
                }else{
                    layer.msg('此仓库无架位');
                }
            });
        });


        function del(code,r) {
            layer.confirm('您确定删除该库位吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('{{url('admin/datstorage/')}}/' + code, {
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


        function show_all() {
            layer.open({
                title:'查看仓库',
                type: 2,
                area: ['500px', '550px'],
                fixed: false,
                maxmin: true,
                content: "{{url('admin/datstorage/show_all')}}"
            });
        }
    </script>


@endsection
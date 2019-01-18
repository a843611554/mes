@extends('layouts.admin')
@section('content')


    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="#">装箱</a> &raquo; 查看
    </div>
    <!--面包屑导航 结束-->


    <form action="{{url('admin/custompackage/show/search')}}" method="post">
        {{csrf_field()}}
        <table class="search_tab">
            <tr>
                <th width="70">关键字：</th>
                <td><input type="text" name="keywords"  placeholder="输入装箱号"></td>
                <td><input type="submit"  value="查询"></td>
                <td><input type="button"  value="添加" onclick="window.location.href='{{url("admin/custompackage")}}'"></td>
            </tr>
        </table>
        <div class="result_wrap">
            <div class="result_content">
                <table class="list_tab">
                    <tr>
                        <th class="tc">装箱号</th>
                        <th>订单号</th>
                        <th>客户</th>
                        <th>装箱规格</th>
                        <th>单重</th>
                        <th>备注</th>
                        <th>状态</th>
                        <th>查看清单</th>
                        <th>操作</th>
                    </tr>
                    @foreach($data as $v)
                        <tr>

                            <td class="tc">
                                {{$v->pack_bill}}
                            </td>

                            <td>
                                {{$v->order_no}}
                            </td>

                            <td>
                                {{$v->cust_nameCn}}
                            </td>

                            <td>
                                {{$v->box_size}}
                            </td>

                            <td>
                                {{$v->singal_weight}}
                            </td>


                            <td>
                                {{$v->pnote}}
                            </td>


                            <td>
                                @if($v->pstate==1)
                                    通过
                                @elseif($v->pstate==-1)
                                    作废
                                @else
                                    未审核
                                @endif
                            </td>

                            <td>
                                <a href="javascript:void (0)" onclick="show_detail({{$v->id}})">查看清单</a>
                            </td>

                            <td>
                                @if($v->pstate==0)
                                    <a href="javascript:void (0)" onclick="check('{{$v->id}}',1)">通过</a>
                                    <a href="javascript:void (0)" onclick="check('{{$v->id}}',-1)">作废</a>
                                @else
                                    <a href="javascript:void (0)" style="color: #5e5e5e">已审核</a>
                                    @if($v->pstate==1)
                                        <a href="javascript:void (0)" onclick="show_print('{{url('admin/custompackage/check_print/'.$v->pack_bill)}}')">条形码</a>

                                    @endif
                                @endif

                            </td>
                        </tr>
                    @endforeach

                </table>

                <div class="page_list">
                    {{ $data->links()}}
                </div>


            </div>
        </div>
    </form>

    <div  id="show_detail" hidden >
        <div class="result_content">
            <table class="list_tab">
                <th>物料编号</th>
                <th>物料名称</th>
                <th>规格</th>
                <th>炉号</th>
                <th>数量</th>
                <th>修改时间</th>
                <th>修改人</th>

                <tbody id="detail_body">

                </tbody>
                
            </table>
        </div>

    </div>

    <script>
        //加载条形码
        function show_print(url) {
            layer.open({
                title:'查看条形码',
                type: 2,
                closeBtn:1,
                area: ['500px', '500px'],
                shadeClose: true,
                content: url,
            });
        }

        //查看清单
        function show_detail(id) {
            //清除上次点击加载的内容
            $('#detail_body').children().remove();
            $.ajax({
                type:"POST",
                async:false,
                url:"{{url('admin/custompackage/show_detail')}}",
                data:{'pack_id':id , '_token': '{{csrf_token()}}'},

                beforeSend:function () {
                    layer.msg('载入中',{icon:16});
                },

                success:function (data) {
//                    alert(1);
                    layer.closeAll(); //关闭layer所有弹窗

                    var tr //设置一行数据


                    $.each(JSON.parse(data),function (n,v) {
                        tr="<tr>" +
                            "<td>"+v.pcode+"</td>"+
                            "<td>"+v.pname+"</td>"+
                            "<td>"+v.pstyle+"</td>"+
                            "<td>"+v.stove_code+"</td>"+
                            "<td>"+v.box_num+"</td>"+
                            "<td>"+timestampToTime(v.moddate)+"</td>"+
                            "<td>"+v.modman+"</td>"+
                            "</tr>";
                        $("#detail_body").append(tr);

                    });
                    layer.open({
                        title:'查看详单',
                        type: 1,
                        closeBtn: 1,
                        area: ['800px', '300px'],
                        shadeClose: true,
                        content: $("#show_detail")
                    });

                },
                error: function () {
                  layer.alert("请求错误");
                },
                });


        }

        function check(id,check) {
            if(check ==1 || check ==-1){
                $.post("{{url('admin/custompackage/show/check')}}",
                    {
                        '_token':'{{csrf_token()}}',
                        'pstate':check,
                        'id':id
                    },function (data) {
                        if(data.status){
                            layer.msg(data.msg,{icon:6});
                            location.reload();
                        }else{
                            layer.msg(data.msg,{icon:5});
                        }
                    });
            }else{
                return false;
            }
        }



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

    </script>

@endsection
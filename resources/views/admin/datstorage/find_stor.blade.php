@extends('layouts.admin')

@section('content')



    <!--结果页快捷搜索框 开始-->

    <div class="search_wrap">

        <form action="" method="post">

            {{csrf_field()}}

            <table class="search_tab">
                    <th>关键字:</th>
                    <td><input type="text" name="keywords" placeholder="关键字"></td>
                    <td><input type="submit"  value="查询" class="btnSearch"></td>
                    <td><input type="button" value="添加仓库" onclick=" window.parent.add_stor();"></td>
                </tr>

            </table>

        </form>

    </div>

    <!--结果页快捷搜索框 结束-->

    <!--搜索结果页面 列表 开始-->

    <form action="{{url('admin/')}}" method="post">

        <div class="result_popwrap">

            <div class="result_popcontent">

                <table class="list_tab">

                    <tr>
                        <th>仓库号</th>
                        <th>名称</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                        @foreach($data as $v)
                            <tr>
                                <td><a href="javascript:void(0)">{{$v->Stor_code}}</a></td>
                                <td>{{$v->Stor_name}}</td>
                                <td>
                                    @if($v->Stor_usable ==1)
                                        <p style="color: #2ca02c">可用</p>
                                    @else
                                        <p style="color: #5e5e5e">不可用</p>
                                    @endif
                                </td>
                                <td>
                                    <a target="_parent" href="{{url('admin/datstorage/'.$v->Stor_id.'/edit')}}"><i class="fa fa-pencil-square-o"></i>修改</a>
                                    <a href="javascript:void(0)" onclick="del('{{$v->Stor_code}}',this)"><i class="fa fa-trash-o"></i>删除</a>
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
    <!--搜索结果页面 列表 结束-->

    <script>

        function del(code,r) {
            layer.confirm('您确定删除该仓库吗？', {
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

    </script>

@endsection

 

 

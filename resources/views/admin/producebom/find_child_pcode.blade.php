@extends('layouts.admin')

@section('content')



    <!--结果页快捷搜索框 开始-->

    <div class="search_wrap">

        <form action="" method="post">

            {{csrf_field()}}

            <table class="search_tab">
                <tr>
                    <th>关键字:</th>
                    <td><input type="text" name="keywords" placeholder="关键字" value="{{old('keywords')}}"></td>
                    <td><input type="submit"  value="查询" class="btnSearch"></td>
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
                        <th>物料编号</th>
                        <th>物料名称</th>
                        <th>物料型号</th>
                        <th>物料规格</th>
                    </tr>

                    @if(isset($data))

                        @foreach($data as $v)

                            <tr>
                                <td><a href="javascript:void(0);"
                                       ondblclick="select('{{$v->pcode}}')">{{$v->pcode}}</a></td>
                                <td>{{$v->pname}}</td>
                                <td>{{$v->pmodel}}</td>
                                <td>{{$v->pstyle}}</td>


                            </tr>

                        @endforeach

                </table>
                        <div class="page_list">
                            {{$data->links()}}
                        </div>
                     @endif

            </div>

        </div>

    </form>

    <!--搜索结果页面 列表 结束-->

    <script>

        function  select(Pd_Code) {
            var index = parent.layer.getFrameIndex(window.name);

            var pcode = parent.parent.$('#Pd_Code').val();

            if(Pd_Code == pcode){
                layer.msg('子物料不能与父物料相同');
                return false;
            }

            parent.$('#Pd_Code').val(Pd_Code);
            parent.get_pinfo(Pd_Code);
            parent.layer.close(index);

        }

    </script>

@endsection

 

 

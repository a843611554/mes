@extends('layouts.admin')

@section('content')



    <!--结果页快捷搜索框 开始-->

    <div class="search_wrap">

        <form action="" method="post">

            {{csrf_field()}}

            <table class="search_tab">
                <tr>
                    <th>关键字:</th>
                    <td><input type="text" name="keywords" placeholder="关键字"></td>
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
                        <th>姓名</th>
                        <th>手机号</th>
                        <th>身份证号</th>
                    </tr>

                    @if(isset($data))

                        @foreach($data as $v)

                            <tr>
                                <td><a href="javascript:void(0);"
                                       ondblclick="select('{{$v->Stf_Id}}','{{$v->Stf_NameCn}}')">{{$v->Stf_NameCn}}</a></td>
                                <td>{{$v->Stf_Mobile}}</td>
                                <td>{{$v->Stf_CarId}}</td>


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
        function  select(Stf_Id,Stf_NameCn) {
            var index = parent.layer.getFrameIndex(window.name);

            parent.$('#Stf_Id').val(Stf_Id);
            parent.$('#cn_name').val(Stf_NameCn);
            parent.layer.close(index);


        }
    </script>

@endsection

 

 

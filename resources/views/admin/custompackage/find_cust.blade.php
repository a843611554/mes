@extends('layouts.admin')

@section('content')



    <!--结果页快捷搜索框 开始-->

    <div class="search_wrap">

        <form action="{{url('admin/custompackage/custkeyword')}}" method="post">

            {{csrf_field()}}

            <table class="search_tab">

                <tr>
                    <th>关键字:</th>
                    <td><input type="text" name="keywords" placeholder="关键字"></td>
                    <td><input type="submit" name="sub" value="查询" class="btnSearch"></td>
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
                        <th class="tc">客户编号</th>
                        <th>中文名</th>
                        <th>英文名</th>
                        <th>联系人</th>
                    </tr>

                    @if(isset($data))

                        @foreach($data as $v)

                            <tr>
                                <td><a href='javascript:void(0)' ondblclick='choice_cust(this)'>{{$v->cust_code}}</a></td>
                                <td>{{$v->cust_nameCn}}</td>
                                <td>{{$v->cust_NameEn}}</td>
                                <td>{{$v->cust_LinkMan}}</td>
                            </tr>

                        @endforeach

                </table>
                @endif

                <div class="page_list">
                    {{ $data->links()}}
                </div>
            </div>


        </div>

    </form>

    <!--搜索结果页面 列表 结束-->

    <script>

        function choice_cust(c) {
            var index = parent.layer.getFrameIndex(window.name);
            parent.$('#cust_code').val( c.innerHTML);
            parent.layer.close(index);
        }



    </script>

@endsection

 

 

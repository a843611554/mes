@extends('layouts.admin')

@section('content')



    <!--结果页快捷搜索框 开始-->

    <div class="search_wrap">

        <form action="{{url('admin/repaircontact/find_user2')}}" method="post">

            {{csrf_field()}}

            <table class="search_tab">
                <tr>
                    <th>车间：</th>
                    <td>
                        <select name="Dpt_DptCode">
                            <option value="">请选择车间</option>
                            @foreach($depart as $v)
                                <option value="{{$v->id}}">{{$v->Dpt_Name}}</option>
                            @endforeach
                        </select>
                    </td>

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
                        <th>员工编号</th>
                        <th>姓名</th>
                        <th>所属车间</th>
                        <th>手机号</th>
                    </tr>

                    @if(isset($data))

                        @foreach($data as $v)

                            <tr>
                                <td><a href="javascript:void(0);"
                                       ondblclick="select('{{$v->id}}','{{$v->user_name}}','{{$v->cn_name}}','{{$v->Dpt_Name}}','{{$v->shopid}}','{{$v->Stf_Mobile}}')">{{$v->user_name}}</a></td>
                                <td>{{$v->cn_name}}</td>
                                <td>{{$v->Dpt_Name}}</td>
                                <td>{{$v->Stf_Mobile}}</td>

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
        function  select(id,user_name,cn_name,Dpt_Name,shopid,Stf_Mobile) {
            var index = parent.layer.getFrameIndex(window.name);
            parent.$("#section").children().remove();
            $.post("{{url('admin/repaircontact/get_section')}}",{'_token':'{{csrf_token()}}','depart_id':shopid},
                function (data) {
                    if(data.length<=0){
                        parent.layer.msg('此车间无分区');
                        parent.$('#user2_id').val(id);
                        parent.$('#user_name').val(user_name);
                        parent.$('#cn_name').val(cn_name);
                        parent.$('#depart_name').val(Dpt_Name);
                        parent.$('#depart').val(shopid);
                        parent.$('#mobile').val(Stf_Mobile);

                        parent.layer.close(index);

                    }else{
                        parent.$("#section").append("<option value=''>选择分区</option>");

                        $.each(data,function (idx,obj) {
                                var opt = "<option value='"+ obj.s_id +"'>"+obj.sect_name+ "</option>";
                                parent.$("#section").append(opt);
                        });
                                parent.$('#user2_id').val(id);
                                parent.$('#user_name').val(user_name);
                                parent.$('#cn_name').val(cn_name);
                                parent.$('#depart_name').val(Dpt_Name);
                                parent.$('#depart').val(shopid);
                                parent.$('#mobile').val(Stf_Mobile);

                                parent.layer.close(index);

                    }

                });


        }
    </script>

@endsection

 

 

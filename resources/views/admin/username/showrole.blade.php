@extends('layouts.admin')
@section('content')

    <!--搜索结果页面 列表 开始-->
    <form action="#" method="post">
        <div class="result_popwrap">
            <div class="result_popcontent">
                <table class="list_poptab">
                    <tr>

                        <th><a href="">选择</a></th>
                        <th>权限名称</th>


                    </tr>
                   @if(is_object($data))
                        @foreach($data as $v)

                            <tr>
                                <td class="tc">
                                    <input type="checkbox" name="rightselect" value="{{$v->id}}"  @foreach($user_role as $k) @if($v->id==$k->role_id) checked @endif @endforeach></td>
                                <td>{{$v->display_name}}</td>

                            </tr>
                        @endforeach
                    @endif

                </table>

            </div>

        </div>

    </form>
    <table>
        <tbody>
        <tr>

            <input type="button" style="float:right;margin-right:40px;margin-top: 20px " onclick="shopaddrole({{$user_id}})" value="确认">

        </tr>
        </tbody>
    </table>
    <!--搜索结果页面 列表 结束-->

    <script>



        function shopaddrole($user_id){
            var boxes = document.getElementsByTagName("input");
            var val = [];
            for(i=0;i<boxes.length;i++){
                if(boxes[i].name=="rightselect" && boxes[i].checked == true){
                    val.push(boxes[i].value);
                }
            }
            if (val!='')
            {
                $.post('{{url('admin/shoproleadd')}}', {
                    '_token': '{{csrf_token()}}',
                    'user_id':$user_id,
                    'role_array': val
                }, function (data) {
                    if (data.status == 'true') {
                        layer.msg(data.msg, {icon: 6});
                        parent.location.reload();
                        parent.layer.close(index);
                    } else {
                        layer.msg(data.msg, {icon: 5});
                    }
                });

            }

        }

    </script>

@endsection


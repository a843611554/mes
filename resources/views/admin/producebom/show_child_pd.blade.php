@extends('layouts.admin')

@section('content')



    <!--结果页快捷搜索框 开始-->

    <div class="search_wrap">

        <form action="" method="get">

            {{csrf_field()}}

            <table class="search_tab">
                    <th>关键字:</th>
                    <td><input type="text" name="keywords" value="{{old('keywords')}}" placeholder="关键字"></td>
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
                        <th>物料毛数量</th>
                        <th>物料净数量</th>
                        <th>出成率</th>
                        <th>是否可选</th>
                        <th>备注</th>
                        <th>修改时间</th>
                        <th>修改人</th>
                        <th>查看子物料</th>

                    </tr>
                        @foreach($data as $v)
                            <tr class="{{$v->Pd_code}}">
                                <td>{{$v->Pb_ChildCode}}</td>
                                <td>{{$v->pname}}</td>
                                <td>{{$v->Pb_ChildGross}}</td>
                                <td>{{$v->Pb_ChildNet}}</td>
                                <td>{{$v->Pb_ChildPer}}</td>
                                <td>
                                    @if($v->Pb_ChildMay ==1)
                                        <p style="color: #2ca02c">可选</p>
                                    @else
                                        <p style="color: #5e5e5e">不可选</p>
                                    @endif
                                </td>
                                <td>{{$v->Pb_Note}}</td>
                                <td>{{$v->moddate}}</td>
                                <td>{{$v->modman}}</td>
                                <td><a href="javascript:void(0)" onclick="show_child_list('{{$v->Pb_ChildCode}}','',this)"><i class='fa fa-search-plus'></i>查看子物料</a></td>
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

        function show_child_list(pcode,prefix,n) {

            $.post("{{url('admin/producebom/show_child_list')}}",
            {
                '_token':"{{csrf_token()}}",
                'Pd_Code':pcode
            }, function (data) {
                    if(data.status=='1'){
                        var list = data.list;
                        prefix_remove=prefix;//收起列表要传递的前缀
                        prefix="├──"+prefix; //前缀

                        for(var i in list){
                            if(list[i].Pb_ChildMay=='1'){
                                var   Pb_ChildMay_txt  = "<p style='color: #2ca02c'>可选</p>";
                            }else{
                                var   Pb_ChildMay_txt  = "<p style='color: #5e5e5e'>不可选</p>";
                            }
                            var parent_class =  $(n).parent().parent().attr('class');
                            var class_tr = pcode+" "+parent_class;

                            var tr = "<tr class='"+class_tr+"'>" +
                                    "<td>"+prefix+list[i].Pb_ChildCode+"</td>"+
                                "<td>"+list[i].pname+"</td>"+
                                "<td>"+list[i].Pb_ChildGross+"</td>"+
                                "<td>"+list[i].Pb_ChildNet+"</td>"+
                                "<td>"+list[i].Pb_ChildPer+"</td>"+
                                "<td>"+Pb_ChildMay_txt+"</td>"+
                                "<td>"+list[i].Pb_Note+"</td>"+
                                "<td>"+list[i].moddate+"</td>"+
                                "<td>"+list[i].modman+"</td>"+
                                "<td>"+"<a href='javascript:void(0)' onclick='show_child_list("+"\""+list[i].Pb_ChildCode+"\",\""+prefix+"\""+",this)'><i class='fa fa-search-plus'></i>查看子物料</a>"+"</td>"+
                                "<tr>";

                            $(n).parent().parent().after(tr);
                        }

                        var code = $(n).parent().siblings().eq(0).html();
                        code = code.replace("├──",'');

                        $(n).parent().html("<a href='javascript:void(0)' onclick='remove_child("+"\""+code+"\",\""+pcode+"\",\""+prefix_remove+"\",this)'><i class='fa fa-minus' aria-hidden='true'></i>收起列表</a>");
                    }else{
                        layer.msg(data.msg);
                        $(n).parent().html('无子物料');
                    }
                }
            );


        }

        function remove_child(code,child,prefix,n) {
            child = "."+child;

            $(child).remove();
            $(n).parent().html("<a href='javascript:void(0)' onclick='show_child_list("+"\""+code+"\",\""+prefix+"\""+",this)'><i class='fa fa-search-plus'></i>查看子物料</a>");
        }
    </script>

@endsection

 

 

@extends('layouts.admin')

@section('content')



    <!--结果页快捷搜索框 开始-->

    <div class="search_wrap">

        <form action="{{url('admin/popfindplanexec')}}" method="post">

            {{csrf_field()}}

            <table class="search_tab">

                <tr>

                    <th width="70">类别:</th>
                    <td>
                        <select name="ptype">
                            <option value="%">请选择</option>
                            @foreach($ptype as $p)
                                <option value="{{$p->dic_item_code}}" @if($p->dic_item_code==Session('plan_type')) selected @endif>{{$p->dic_item_name}}</option>
                            @endforeach
                        </select>
                    </td>
                    <th>关键字</th>
                    <td><input type="text" name="keywords" placeholder="关键字"></td>

                    <td><input type="submit"  value="查询"></td>



                </tr>

            </table>

        </form>

    </div>

    <!--结果页快捷搜索框 结束-->





    <!--搜索结果页面 列表 开始-->

    <form action="{{url('admin/planexec/add')}}" method="post">

        <div class="result_popwrap">

            <div class="result_popcontent">

                <table class="list_poptab">

                    <tr>

                        <th width="100px">计划条码</th>
                        <th width="100px">计划名称</th>
                        <th width="100px">类别</th>

                        <th width="100px">计划日期</th>
                        <th width="100px">产品编号</th>
                        <th width="100px">产品名称</th>

                        <th width="100px">计划班产</th>
                        <th width="100px">订单编号</th>
                        <th width="100px">工艺名称</th>

                    </tr>

                    @if(is_object($data))

                        @foreach($data as $v)

                            <tr>

                                @if($v->pstate==1)

                                    <td class="tc">

                                        <a href="javascript:void(0)" id="plan_code" ondblclick="selectkey('{{$v->plan_code}}','{{$v->plan_name}}','{{$v->productid}}','{{$v->pcode}}','{{$v->pname}}','{{$v->art_id}}','{{$v->Art_code}}','{{$v->Art_name}}')">{{$v->plan_code}}</a></td>

                                    <td>{{$v->plan_name}}</td>
                                    <td>{{$v->plan_type_name}}</td>
                                    <td>{{date('Y-m-d',$v->plan_date)}}</td>
                                    <td>{{$v->pcode}}</td>

                                    <td>{{$v->pname}}</td>

                                    <td>{{$v->plan_dept_num}}</td>
                                    <td>{{$v->order_no}}</td>
                                    <td>{{$v->Art_name}}</td>

                                @endif

                            </tr>

                        @endforeach




                </table>
                <div class="page_list">

                    {!! $data->links() !!}

                </div>
                @endif

            </div>

        </div>

    </form>

    <!--搜索结果页面 列表 结束-->



    <script>


        function selectkey($k,$w,$e,$f,$r,$t,$a,$v) {

            var index = parent.layer.getFrameIndex(window.name);

            var value =$k;

            var value_name =$w;
            var value_pid =$e;
            var value_pcode =$f;

            var value_pname =$r;

            var value_acode =$a;

            var value_aname =$v;

            parent.$('#plan_code').val(value);

            parent.$('#plan_name').val(value_name);
            parent.$('#pid').val(value_pid);
            parent.$('#pcode').val(value_pcode);

            parent.$('#pname').val(value_pname);
            parent.$('#art_id').val($t);
            parent.$('#acode').val(value_acode);

            parent.$('#aname').val(value_aname);
            parent.layer.close(index);

        }

    </script>



@endsection

 

 

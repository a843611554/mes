@extends('layouts.admin')
@section('content')

    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">周转箱管理</a> &raquo; 周转箱列表
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
                    <a href="{{url('admin/materialbox/create')}}"><i class="fa fa-plus"></i>新增周转箱</a>
                    <a href="{{url('admin/materialbox/')}}"><i class="fa fa-refresh"></i>查看周转箱</a>
                    <table class="search_tab">
                        <tr>
                            <th>车间：</th>
                            <td>
                                <select name="depart_id">
                                        <option value="">选择车间查找</option>
                                    @foreach($depart as $v)
                                        @if(old('depart_id') ==$v->id)
                                            <option value="{{$v->id}}" selected>{{$v->Dpt_Name}}</option>
                                        @else
                                            <option value="{{$v->id}}">{{$v->Dpt_Name}}</option>
                                        @endif
                                    @endforeach
                                </select>
                            </td>

                            <th>出入库：</th>
                            <td>
                                全部 <input type="radio" name="stock_state" value="" {{old('stock_state')!=''?(old('stock_state')==''?'checked':''):'checked'}} >
                                出库 <input type="radio" name="stock_state" value="-1" {{old('stock_state')!=''?(old('stock_state')=='-1'?'checked':''):''}} >
                                在库 <input type="radio" name="stock_state" value="1" {{old('stock_state')!=''?(old('stock_state')=='1'?'checked':''):''}}>
                            </td>

                            <th>使用状态：</th>
                            <td>
                                全部 <input type="radio" name="use_state" value="" {{old('use_state')!=''?(old('use_state')==''?'checked':''):'checked'}} >
                                使用中 <input type="radio" name="use_state" value="0" {{old('use_state')!=''?(old('use_state')=='0'?'checked':''):''}} >
                                未使用 <input type="radio" name="use_state" value="-1" {{old('use_state')!=''?(old('use_state')=='-1'?'checked':''):''}}>
                            </td>

                            <th width="70">关键字：</th>
                            <td><input type="text" name="keywords"  placeholder="输入周转箱识别码" value="{{old('keywords')}}"></td>
                            <td><input type="submit"  value="查询"></td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--快捷导航 结束-->
        </div>

        <div class="result_wrap">
            <div class="result_content">
                <table class="list_tab">
                    <tr>
                        <th>识别码</th>
                        <th>检验周期</th>
                        <th>车间</th>
                        <th>材质</th>
                        <th>长</th>
                        <th>宽</th>
                        <th>高</th>
                        <th>皮重(kg)</th>
                        <th>出入库</th>
                        <th>状态</th>
                        <th>经办时间</th>
                        <th>经办人</th>
                        <th>操作</th>
                    </tr>
                    @foreach($data as $v)
                    <tr>
                        <td>{{$v->box_identify}}</td>
                        <td>{{$v->inspection_interval}}</td>
                        <td>{{$v->Dpt_Name}}</td>
                        <td>{{$v->material}}</td>
                        <td>{{$v->box_L}}</td>
                        <td>{{$v->box_W}}</td>
                        <td>{{$v->box_H}}</td>
                        <td>{{$v->box_tare}}</td>
                        <td>
                            @switch($v->stock_state)
                            @case(1)
                            <p style="color: #2ca02c">在库</p>
                            @break
                            @case(-1)
                            <p style="color: #5e5e5e">出库</p>
                            @break
                            @default

                            @endswitch
                        </td>
                        <td>
                            @switch($v->use_state)
                            @case('0')
                            <p style="color: #2ca02c">使用中</p>
                            @break
                            @case('-1')
                            <p style="color: #5e5e5e">未使用</p>
                            @break
                            @default

                            @endswitch

                        </td>
                        <td>{{$v->moddate}}</td>
                        <td>{{$v->modman}}</td>
                        <td>
                            <a href="{{url('admin/materialbox/'.$v->id.'/edit')}}"><i class="fa fa-pencil-square-o"></i>修改</a>
                            <a href="javascript:void(0)" onclick="del('{{$v->id}}',this)"><i class="fa fa-trash-o"></i>删除</a>
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


    <!--搜索结果页面 列表 结束-->
    <script>


        function del(id,r) {
            layer.confirm('您确定删除该周转箱吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('{{url('admin/materialbox/')}}/' + id, {
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
@extends('layouts.admin')
@section('content')

    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">计划加料管理</a> &raquo; 加料列表
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
                    <a href="{{url('admin/plan_add_material/create')}}"><i class="fa fa-plus"></i>新增加料</a>
                    <a href="{{url('admin/plan_add_material/')}}"><i class="fa fa-refresh"></i>全部加料</a>
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

                            <th width="70">关键字：</th>
                            <td><input type="text" name="keywords"  placeholder="输入关键字" value="{{old('keywords')}}"></td>
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


                        <th class="tc">计划编码</th>
                        <th>计划名称</th>
                        <th>车间</th>
                        <th>物料编号</th>
                        <th>物料名称</th>
                        <th>订单数量</th>
                        <th>加料数量</th>
                        <th>修改日期</th>
                        <th>修改者</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    @foreach($data as $v)
                        <tr>

                            <td class="tc">
                                {{$v->plan_code}}
                            </td>

                            <td>
                                {{$v->plan_name}}
                            </td>

                            <td>
                                {{$v->Dpt_Name}}
                            </td>
                            <td>
                                {{$v->pcode}}
                            </td>
                            <td>
                                {{$v->pname}}
                            </td>
                            <td>
                                {{$v->order_num}}
                            </td>
                            <td>
                                {{$v->add_material_num}}
                            </td>
                            <td>
                                {{date('Y-m-d h:m:s',$v->moddate)}}
                            </td>
                            <td>
                                {{$v->modman}}
                            </td>
                            <td class="{{$v->id}}">

                                @if($v->state == '0')
                                    <p style="color: #5e5e5e">已作废</p>
                                @else
                                    <p style="color: #008200">正常</p>
                                @endif

                            </td>

                            <td class="{{$v->id}}">
                                @if($v->state == '0')
                                    <p style="color: #5e5e5e">已作废</p>
                                @else
                                    <a href="javascript:void(0)" onclick="cancel({{$v->id}})">作废</a>
                                @endif

                            </td>
                        </tr>
                    @endforeach

                </table>

                <div class="pull_right">
                    {{ $data->links()}}
                </div>


            </div>
        </div>
    </form>


    <!--搜索结果页面 列表 结束-->
    <script>
        function cancel(id) {
            layer.confirm(
                '确认作废加料吗？',
                {
                    btn:['确认','取消'],
                },function () {
                    $.post("{{url('admin/plan_add_material/cancel')}}/"+id,
                        {
                            '_token':"{{csrf_token()}}",
                        },function (data) {
                            if(data.status=='1'){
                                layer.msg(data.msg);

                                $("."+id).html("<p style='color: #5e5e5e'>已作废</p>");
                            }else{
                                layer.msg(data.msg);
                            }
                        })
                },function () {
                    
                }
            );
        }
        


    </script>

@endsection
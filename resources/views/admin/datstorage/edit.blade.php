@extends('layouts.admin')
        @section('content')

            <!--面包屑导航 开始-->
            <div class="crumb_warp">
                <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
                <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="#">仓库管理</a> &raquo; 修改信息
            </div>
            <!--面包屑导航 结束-->
            <div class="result_wrap">
            <!--结果集标题与导航组件 开始-->
            <div class="result_wrap">
                <div class="result_title">
                    <h3>快捷操作</h3>

                </div>
                <div class="result_title">
                    @if (count($errors)>0)
                        <div class="mark">
                            @if (is_object($errors))
                                @foreach($errors->all() as $error)
                                    <p>{{$error}}</p>
                                @endforeach
                            @else
                                <p> {{$errors}}</p>
                            @endif

                        </div>
                    @endif
                </div>
            </div>
                <div class="result_content">
                    <div class="short_wrap">
                        <a href="{{url('admin/datstorage/create')}}"><i class="fa fa-plus"></i>新增库位</a>
                        <a href="{{url('admin/datstorage/')}}"><i class="fa fa-refresh"></i>查看库位</a>
                    </div>
                </div>
            </div>
            <!--结果集标题与导航组件 结束-->


            <div class="result_wrap">
                <form action="{{url('admin/datstorage/'.$data->Stor_id)}}" method="post">
                    <input type="hidden" name="_method" value="put">
                    {{csrf_field()}}
                    <input type="hidden" name="Sp_ParentNo" value="{{$data->Sp_ParentNo}}">
                    <table class="add_tab">
                        <tbody>
                        <tr>
                            <th><i class="require">*</i>库位编号：</th>
                            <td>
                                <input type="text" name="Stor_code" value="{{$data->Stor_code}}" onkeyup="checkNum(this)">
                            </td>
                        </tr>

                        <tr>
                            <th><i class="require">*</i>名称：</th>
                            <td>
                                <input type="text" name="Stor_name" value="{{$data->Stor_name}}">
                            </td>

                        </tr>

                        <tr>

                            <th><i class="require">*</i>是否可用：</th>
                            <td>
                                可用 <input type="radio" name="Stor_usable" value="1" {{$data->Stor_usable!=''?($data->Stor_usable=='1'?'checked':''):''}}>
                                不可用 <input type="radio" name="Stor_usable" value="0" {{$data->Stor_usable!=''?($data->Stor_usable=='0'?'checked':''):''}}>
                            </td>
                        </tr>


                        <tr>
                            <th></th>
                            <td>
                                <input type="submit" value="提交">
                                <input type="button" class="back" onclick="history.go(-1)" value="返回">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>

            <script>
                function checkNum(obj)
                {
                    obj.value = obj.value.replace(/\D/g, '')
                }
            </script>

        @endsection


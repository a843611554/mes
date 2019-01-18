@extends('layouts.admin')
        @section('content')

            <!--面包屑导航 开始-->
            <div class="crumb_warp">
                <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
                <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="#">电话管理</a> &raquo; 修改信息
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
                        <a href="{{url('admin/mobile/create')}}"><i class="fa fa-plus"></i>新增电话</a>
                        <a href="{{url('admin/mobile/')}}"><i class="fa fa-refresh"></i>全部电话</a>
                    </div>
                </div>
            </div>
            <!--结果集标题与导航组件 结束-->


            <div class="result_wrap">
                <form action="{{url('admin/mobile/'.$field->id)}}" method="post">
                    <input type="hidden" name="_method" value="put">
                    {{csrf_field()}}
                    <table class="add_tab">
                        <tbody>
                        <tr>
                            <th><i class="require">*</i>ID：</th>
                            <td>
                                <p>{{$field->id}}</p>

                            </td>
                        </tr>

                        <tr>
                            <th><i class="require">*</i>板块：</th>

                             <td>
                                <select name="temp_id">

                                    @foreach($temp as $v)
                                        @if($field->temp_id == $v->id)
                                            <option value="{{$v->id}}" selected>{{$v->temp_name}}</option>
                                        @else
                                            <option value="{{$v->id}}" >{{$v->temp_name}}</option>
                                        @endif

                                    @endforeach

                                </select>
                             </td>
                        </tr>


                        <tr>

                            <th><i class="require">*</i>电话号码：</th>
                            <td>
                                <input type="text" class="lg" value="{{$field->mobile}}" name="mobile">
                            </td>
                        </tr>
                        <tr>
                            <th><i class="require">*</i>姓名：</th>
                            <td>
                                <input type="text" class="lg" value="{{$field->hum_name}}" name="hum_name">

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

        @endsection


@extends('layouts.admin')
        @section('content')

            <!--面包屑导航 开始-->
            <div class="crumb_warp">
                <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
                <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">异常管理</a> &raquo; 添加异常
            </div>
            <!--面包屑导航 结束-->
            <div class="result_wrap">
            <!--结果集标题与导航组件 开始-->

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
                <!--快捷导航 开始-->
                <div class="result_content">
                    <div class="short_wrap">
                        <a href="{{url('admin/alert/')}}"><i class="fa fa-refresh"></i>全部异常</a>
                    </div>
                </div>
                <!--快捷导航 结束-->
            </div>
            <!--结果集标题与导航组件 结束-->


            <div class="result_wrap">
                <form action="{{url('admin/alert')}}" method="post">
                    {{csrf_field()}}
                    <table class="add_tab">
                        <tbody>

                        <tr>
                            <th><i class="require">*</i>异常类型：</th>
                            <td>
                                    <select name="type_code">
                                        <option value="">选择异常类型查找</option>
                                        @foreach($alert_type as $v)
                                            @if(old('type_code') ==$v->dic_item_code)
                                                <option value="{{$v->dic_item_code}}" selected>{{$v->dic_item_name}}</option>
                                            @else
                                                <option value="{{$v->dic_item_code}}">{{$v->dic_item_name}}</option>
                                            @endif
                                        @endforeach
                                    </select>



                            </td>
                        </tr>

                        <tr>
                            <th><i class="require">*</i>异常明细：</th>
                            <td>
                                <input type="text" class="tc" value="{{old('alert_typedet')}}" name="alert_typedet">
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


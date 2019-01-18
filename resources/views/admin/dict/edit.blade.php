@extends('layouts.admin')
        @section('content')

            <!--面包屑导航 开始-->
            <div class="crumb_warp">
                <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
                <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="#">词典管理</a> &raquo; 添加词典
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
                        <a href="{{url('admin/navs/create')}}"><i class="fa fa-plus"></i>新增词典</a>
                        <a href="{{url('admin/navs/')}}"><i class="fa fa-refresh"></i>全部词典</a>
                    </div>
                </div>
            </div>
            <!--结果集标题与导航组件 结束-->


            <div class="result_wrap">
                <form action="{{url('admin/dict/'.$field->dic_id)}}" method="post">
                    <input type="hidden" name="_method" value="put">
                    {{csrf_field()}}
                    <table class="add_tab">
                        <tbody>
                        <tr>
                            <th><i class="require">*</i>类别编号：</th>
                            <td>
                                <input type="text" class="tc" value="{{$field->dic_cat}}" name="dic_cat">

                            </td>

                        <tr>
                            <th><i class="require">*</i>类别名称：</th>
                            <td>
                                <input type="text" class="lg" value="{{$field->dic_cat_name}}" name="dic_cat_name">
                            </td>
                        </tr>
                        <tr>
                            <th><i class="require">*</i>项目编号：</th>
                            <td>
                                <input type="text" class="lg" value="{{$field->dic_item_code}}" name="dic_item_code">

                            </td>
                        </tr>
                        <tr>
                            <th><i class="require">*</i>项目名称：</th>
                            <td>
                                <input type="text" value="{{$field->dic_item_name}}" name="dic_item_name">

                            </td>
                        </tr>

                        <tr>
                            <th>排序：</th>
                            <td>
                                <input type="text" class="sm" value="{{$field->dic_order}}" name="dic_order">

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


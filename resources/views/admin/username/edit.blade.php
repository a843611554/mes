@extends('layouts.admin')
@section('content')
    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="#">用户管理</a> &raquo; 添加用户
    </div>
    <!--面包屑导航 结束-->

    <!--结果集标题与导航组件 开始-->
    <div class="result_wrap">
        <div class="result_title">
            <h3>快捷操作</h3>
        </div>
        <div class="result_content">
            <div class="short_wrap">
                <a href="{{url('admin/username/create')}}"><i class="fa fa-plus"></i>新增用户</a>
                <a href="{{url('admin/username')}}"><i class="fa fa-recycle"></i>全部用户</a>
                {{--<a href="#"><i class="fa fa-refresh"></i>更新排序</a>--}}
            </div>
        </div>
    </div>
    <!--结果集标题与导航组件 结束-->

    <div class="result_wrap">
        <form action="{{url('admin/username/'.$field->id)}}" method="post">
            <input type="hidden" name="_method" value="put">
            {{csrf_field()}}
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
            <table class="add_tab">
                <tbody>
                <tr>
                    <th width="120"><i class="require">*</i>所属公司：</th>
                    <td>
                        <select name="company_id">
                            <option value="">==请选择==</option>
                            @foreach($data as $d)
                                <option value="{{$d->id}}"
                                @if($d->id==$field->company_id)selected @endif
                                >{{$d->company_name}}</option>
                            @endforeach
                        </select>

                    </td>
                    <th width="120"><i class="require">*</i>工作中心：</th>
                    <td>
                        <select name="wc_id">
                            <option value="">==请选择==</option>
                            @foreach($work as $f)
                                <option value="{{$f->id}}"
                                        @if($f->id==$field->wc_id)selected @endif
                                >{{$f->wc_name}}</option>
                            @endforeach
                        </select>
                    </td>
                </tr>

                <tr>
                    <th><i class="require">*</i>用户名称：</th>
                    <td style="width: 30%">
                        <input type="text" class="lg" name="user_name" style="width: 100px" value="{{$field->user_name}}">
                    </td>
                    <th><i class="require">*</i>中文名称：</th>
                    <td >
                        <input type="hidden" name="Stf_Id" id="Stf_Id" value="{{$field->Stf_Id}}">
                        <input type="type" class="lg" name="cn_name" readonly value="{{$field->cn_name}}" id="cn_name" style="width: 100px">

                        <input type="button" value="选择员工" onclick="find_humstuff()">
                    </td>


                </tr>
                <tr>
                    <th><i class="require">*</i>所属车间：</th>
                    <td>
                        <select name="shopid" id="shopid">
                            <option value="">==请选择==</option>
                            @foreach($workshop as $v)
                                <option value="{{$v->id}}"    @if($v->id==$field->shopid) selected @endif>{{$v->Dpt_Name}}</option>
                            @endforeach
                        </select>
                        <span>必填</span>
                    </td>
                    <th><i class="require">*</i>组用户：</th>
                    <td >
                        <input hidden class="groupuser" name="groupuser" id="groupuser">
                        <input type="checkbox" id="isgroup" name="isgroup"  @if($field->isgroup==1) value="1" checked='checked' @else value="0"  @endif style="float: left"/>
                        <button type="button" @if($field->isgroup==0) hidden   @endif   onclick="popshow('/admin/username/searchuser/{{$field->id}}')"
                                id="part_popart"  style="float: left">添加
                        </button>
                    </td>
                </tr>
                <tr>

                    <th><i class="require">*</i>用户密码：</th>
                    <td>
                        <input type="password" name="user_pass" value=""> </i>密码6-20位</span>
                        {{--<span><i class="fa fa-exclamation-circle yellow"></i>这里是短文本长度</span>--}}
                    </td>
                    <th><i class="require">*</i>确认密码：</th>
                    <td>
                        <input type="password" name="user_pass_confirmation" value=""> </i></span>
                    </td>
                </tr>
                <tr>
                    <th><i class="require">*</i>车间角色：</th>
                    <td>
                        <select name="shop_role">
                            <option value="">==请选择==</option>
                            <option value="0" @if($field->shop_role==0) selected @endif>组员用户</option>
                            <option value="1" @if($field->shop_role==1) selected @endif>登录用户</option>
                            <option value="2" @if($field->shop_role==2) selected @endif>质检用户</option>
                        </select>注：如果是组用户系统会强制设为登录用户
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
        function popshow(path) {
            layer.open({
                type: 2,
                area: ['700px', '600px'],
                fixed: false,
                maxmin: true,
                content: path
            })
        }

        $("#isgroup").change(function() {

            var btnObj = document.getElementById("part_popart");
            var bigObj = document.getElementById("isgroup");
            if (bigObj.checked == true)
            //  btnObj.attr("style","display:block;");
                document.getElementById("part_popart").style.display="block";
            else
                document.getElementById("part_popart").style.display="none";
        });

        function find_humstuff() {
            layer.open({
                type: 2,

                title:'查找员工',

                area: ['700px', '600px'],

                fixed: false,

                maxmin: true,

                shadeClose:true,

                content: "{{url('admin/username/add/find_humstuff')}}"
            });
        }

        </script>
@endsection
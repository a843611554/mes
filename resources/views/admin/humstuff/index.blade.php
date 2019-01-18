@extends('layouts.admin')

@section('content')
    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; <a href="#">人事管理</a> &raquo; 员工列表
    </div>
    <!--面包屑导航 结束-->
    <!--搜索结果页面 列表 开始-->

    <form action="{{url('admin/humstuff/search')}}" method="post">
        {{csrf_field()}}
        <div class="result_wrap">
            <div class="result_title">
                <h3>快捷操作</h3>
            </div>
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <a href="{{url('admin/humstuff/create')}}"><i class="fa fa-plus"></i>添加员工</a>
                    <a href="{{url('admin/humstuff/')}}"><i class="fa fa-refresh"></i>查看员工</a>
                </div>
            </div>

            <table class="search_tab">
                <tr>
                    <th width="70">关键字：</th>
                    <td><input type="text" name="keywords"  placeholder="输入关键字"></td>
                    <td><input type="submit"  value="查询"></td>
                </tr>
            </table>
        </div>
    </form>



    <div class="result_wrap">
        <div class="result_content">
            <table class="list_tab">
                <tr>
                    <th>员工编码</th>
                    <th>中文名</th>
                    <th>所属部门</th>
                    <th>电话</th>
                    <th>工作形式</th>
                    <th>入职时间</th>
                    <th>性别</th>
                    <th>备注</th>
                    <th>操作</th>
                </tr>
                <tbody>
                    @foreach($data as $v)
                        <tr>
                            <td>{{$v->Stf_Id}}</td>
                            <td>{{$v->Stf_NameCn}}</td>
                            <td>{{$v->Dpt_Name}}</td>
                            <td>{{$v->Stf_Mobile}}</td>
                            <td>{{$v->Wt_WorkType}}</td>
                            <td>{{$v->Stf_InFac}}</td>
                            <td>{{$v->Stf_sex}}</td>
                            <td>{{$v->Stf_Note}}</td>
                            <td>
                                <a href="javascript:void(0)" onclick="showdetail(this)"><i class="fa fa-search"></i>查看详情</a>
                                <a href="{{url('admin/humstuff/'.$v->Stf_Id.'/edit')}}"><i class="fa fa-pencil-square-o"></i>修改</a>
                                <a href="javascript:void(0)" onclick="del('{{$v->Stf_Id}}',this)"><i class="fa fa-trash-o"></i>删除</a>
                            </td>
                        </tr>
                        <tr hidden class="detail">
                            <td colspan="9">
                                {{--详情--}}
                                    <div style="width: 90%;margin-left: 5%">
                                        <div style=" width: 10%;">
                                            <img src="{{asset($v->Stf_Photo)}}" width="100%" alt="员工照片">
                                        </div>


                                    </div>

                                    <div style="width: 90%;margin-left: 5%">
                                        <div style=" width: 20% ;float: left;">
                                            英文名：{{$v->Stf_NameEn}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            出生日期：{{$v->Stf_Brithday}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            籍贯：{{$v->Stf_NaPlace}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            民族：{{$v->Stf_Folk}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            户口性质：{{$v->Sto_BookId}}
                                        </div>
                                    </div>

                                    <div style="width: 90%;margin-left: 5%">
                                        <div style=" width: 20% ;float: left;">
                                           身份证号：{{$v->Stf_CarId}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            家庭住址：{{$v->Stf_Adress}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            家庭电话：{{$v->Stf_HomePhone}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            移动电话：{{$v->Stf_Mobile}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            电子邮件：{{$v->Stf_Email}}
                                        </div>
                                    </div>

                                    <div style="width: 90%;margin-left: 5%">
                                        <div style=" width: 20% ;float: left;">
                                            婚姻状况：{{$v->Sto_Marriage}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            工作形式：{{$v->Wt_WorkType}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            基本工资：{{$v->Stf_Wagebase}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            学历：{{$v->Edu_Level}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            学位：{{$v->Deg_Degree}}
                                        </div>
                                    </div>

                                    <div style="width: 90%;margin-left: 5%">
                                        <div style=" width: 20% ;float: left;">
                                            转正时间：{{$v->Stf_Regular}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            毕业时间：{{$v->Sto_GradDate}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            毕业学校：{{$v->Sto_GradSchool}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            主修专业：{{$v->Stf_SubjectMain}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            原工作单位：{{$v->Sto_OldCommpany}}
                                        </div>
                                    </div>

                                    <div style="width: 90%;margin-left: 5%">
                                        <div style=" width: 20% ;float: left;">
                                            进入本系统时间：{{$v->Sto_EnterDate}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            可否操作本系统：{{$v->Stf_OS}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            职称：{{$v->grd_Grade}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            入职时间：{{$v->Stf_InFac}}
                                        </div>
                                        <div style="width: 20%;float: left">
                                            离职时间：{{$v->Stf_OutFac}}
                                        </div>
                                    </div>

                            </td>


                        </tr>

                    @endforeach
                </tbody>
            </table>

            <div class="page_list">
                {{$data->links()}}
            </div>
        </div>
    </div>

    <script>
        function showdetail(n){

            $(".detail").not( $(n).parent().parent().next() ).hide();
            $(n).parent().parent().next().toggle();
        }



        function del(id,r) {
            layer.confirm('您确定删除该员工吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('{{url('admin/humstuff/')}}/' + id, {
                    '_method': 'delete',
                    '_token': '{{csrf_token()}}'
                }, function (data) {
                    if (data.status == 1) {
                        $(r).parent().parent().next().remove();
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
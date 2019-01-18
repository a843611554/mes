@extends('layouts.admin')
        @section('content')
            <link rel="stylesheet" type="text/css" href="{{asset('js/DatePicker/skin/jedate.css')}}"/>
            <script type="text/javascript" src="{{asset('js/DatePicker/jquery.jedate.js')}}"></script>

            {{--<script src="{{asset('js/dropzone/jquery.js')}}"></script>--}}
            <link rel="stylesheet" href="{{asset('js/dropzone/bootstrap-3.min.css')}}">
            <link href="{{asset('js/dropzone/dropzone.min_4.0.1.css')}}" rel="stylesheet">
            <script src="{{asset('js/dropzone/dropzone.min_4.2.js')}}"></script>
            <!--面包屑导航 开始-->
            <div class="crumb_warp">
                <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
                <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="#">人事管理</a> &raquo; 添加员工
            </div>
            <!--面包屑导航 结束-->
            <div class="result_wrap">
            <!--结果集标题与导航组件 开始-->
            <div class="result_wrap">
                <div class="result_title">
                    <h3>快捷操作</h3>

                </div>

                <div class="result_content">
                    <div class="short_wrap">
                        <a href="{{url('admin/humstuff/')}}"><i class="fa fa-refresh"></i>查看员工</a>
                    </div>
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

            </div>
            <!--结果集标题与导航组件 结束-->


            <div class="result_wrap">
                <form action="{{url('admin/humstuff')}}" method="post">
                    {{csrf_field()}}
                    <table class="add_tab">
                        <tbody>
                            <tr>
                                <th><i class="require">*</i>姓名：</th>
                                <td>
                                    <input type="text" name="Stf_NameCn" value="{{old('Stf_NameCn')}}">
                                </td>

                                <th><i class="require">*</i>性别：</th>
                                <td>
                                    男 <input type="radio" name="Stf_sex" value="M" {{old('Stf_sex')!=''?(old('Stf_sex')=='M'?'checked':''):''}} >
                                    女 <input type="radio" name="Stf_sex" value="F" {{old('Stf_sex')!=''?(old('Stf_sex')=='F'?'checked':''):''}}>
                                </td>

                                <th><i class="require">*</i>部门：</th>
                                <td>
                                    <select name="Dpt_DptCode">
                                        <option value="">请选择部门</option>
                                        @foreach($depart as $d)
                                            @if(old('Dpt_DptCode') ==$d->id)
                                                <option value="{{$d->id}}" selected>{{$d->Dpt_Name}}</option>
                                            @else
                                                <option value="{{$d->id}}">{{$d->Dpt_Name}}</option>
                                            @endif

                                        @endforeach
                                    </select>
                                </td>

                                <th rowspan="5"><input type="button" value="上传图片" id="stfphoto"></th>
                                <td rowspan="5">
                                    <input type="text" hidden name="Stf_Photo" id="Stf_Photo" value="">

                                    <div id="" class="" style="margin: 0 0 ; padding: 0 0; width: 150px;" >

                                        <img id="stf_img" src="" width="80%" alt="">

                                    </div>

                                </td>
                            </tr>

                            <tr>
                                <th><i class="require">*</i>手机号：</th>
                                <td>
                                    <input type="text" name="Stf_Mobile" value="{{old('Stf_Mobile')}}">
                                </td>

                                <th>家庭电话：</th>
                                <td>
                                    <input type="text" name="Stf_HomePhone" value="{{old('Stf_HomePhone')}}">
                                </td>


                                <th>出生日期：</th>
                                <td>
                                <input type="text" readonly="readonly" name="Stf_Brithday" id="brithday" value="{{old('Stf_Brithday')}}">
                                </td>

                            </tr>

                            <tr>
                                <th>籍贯：</th>
                                <td>
                                <input type="text" name="Stf_NaPlace" value="{{old('Stf_NaPlace')}}">
                                </td>

                                <th>民族：</th>
                                <td>
                                <input type="text" name="Stf_Folk" value="{{old('Stf_Folk')}}">
                                </td>

                                <th>户口性质：</th>
                                <td>
                                <select name="Sto_BookId">
                                <option value="">选择户口性质</option>
                                <option value="农业" {{old('Sto_BookId')!=''?(old('Sto_BookId')=='农业'?'selected':''):''}}>农业</option>
                                <option value="非农业" {{old('Sto_BookId')!=''?(old('Sto_BookId')=='非农业'?'selected':''):''}}>非农业</option>
                                </select>
                                </td>
                            </tr>

                            <tr>
                                <th>身份证号：</th>
                                <td>
                                <input type="text" name="Stf_CarId" value="{{old('Stf_CarId')}}">
                                </td>

                                <th>家庭住址：</th>
                                <td>
                                    <input type="text" name="Stf_Adress" value="{{old('Stf_Adress')}}">
                                </td>


                                <th>婚姻状况：</th>
                                <td>
                                已婚 <input type="radio" name="Sto_Marriage" value="1" {{old('Sto_Marriage')!=''?(old('Sto_Marriage')=='1'?'checked':''):''}}>
                                未婚 <input type="radio" name="Sto_Marriage" value="0" {{old('Sto_Marriage')!=''?(old('Sto_Marriage')=='0'?'checked':''):''}}>
                                </td>



                            </tr>

                            <tr>
                                <th>进入单位时间：</th>
                                <td>
                                <input type="text" readonly="readonly" name="Stf_InFac" id="Stf_InFac" value="{{old('Stf_InFac')}}">
                                </td>

                                <th><i class="require">*</i>工作性质：</th>
                                <td>
                                    正式工 <input type="radio" name="Wt_WorkType" value="1" {{old('Wt_WorkType')!=''?(old('Wt_WorkType')=='1'?'checked':''):'checked'}}>
                                    临时工 <input type="radio" name="Wt_WorkType" value="0" {{old('Wt_WorkType')!=''?(old('Wt_WorkType')=='0'?'checked':''):''}}>
                                </td>

                                <th>基本工资：</th>
                                <td>
                                <input type="text" name="Stf_Wagebase" value="{{old('Stf_Wagebase')}}">
                                </td>


                            </tr>

                            <tr>
                                <th><i class="require">*</i>可否操作本系统：</th>
                                <td>
                                    允许 <input type="radio" name="Stf_OS" value="1" {{old('Stf_OS')!=''?(old('Stf_OS')=='1'?'checked':''):''}}>
                                    不允许 <input type="radio" name="Stf_OS" value="0" {{old('Stf_OS')!=''?(old('Stf_OS')=='0'?'checked':''):'checked'}}>
                                </td>

                                <th>电子邮件：</th>
                                <td>
                                    <input type="text" name="Stf_Email" value="{{old('Stf_Email')}}">
                                </td>

                                <th>学历：</th>
                                <td>
                                    <input type="text" name="Edu_Level" value="{{old('Edu_Level')}}">
                                </td>

                                <th>学位：</th>
                                <td>
                                    <input type="text" name="Deg_Degree" value="{{old('Deg_Degree')}}">
                                </td>

                            </tr>

                            <tr>
                                <th>毕业学校：</th>
                                <td>
                                    <input type="text" name="Sto_GradSchool" value="{{old('Sto_GradSchool')}}">
                                </td>

                                <th>毕业时间：</th>
                                <td>
                                    <input type="text" name="Sto_GradDate" id="Sto_GradDate" readonly value="{{old('Sto_GradDate')}}">
                                </td>

                                <th>主修专业：</th>
                                <td>
                                    <input type="text" name="Stf_SubjectMain" value="{{old('Stf_SubjectMain')}}">
                                </td>

                                <th>辅修专业：</th>
                                <td>
                                    <input type="text" name="Stf_SubjectSub" value="{{old('Stf_SubjectSub')}}">
                                </td>
                            </tr>

                            <tr>
                                <th>原工作单位：</th>
                                <td>
                                    <input type="text" name="Sto_OldCommpany" value="{{old('Sto_OldCommpany')}}">
                                </td>
                                <th>原任职务：</th>
                                <td>
                                    <input type="text" name="Sto_OldDuty" value="{{old('Sto_OldDuty')}}">
                                </td>

                                <th>转正时间：</th>
                                <td>
                                    <input type="text" readonly id="Stf_Regular" name="Stf_Regular" value="{{old('Stf_Regular')}}">
                                </td>

                                <th><i class="require">*</i>是否参与考勤：</th>
                                <td>
                                    是 <input type="radio" value="1" name="Stf_CheckedBit" {{old('Stf_CheckedBit')!=''?(old('Stf_CheckedBit')=='1'?'checked':''):'checked'}}>
                                    否 <input type="radio" value="0" name="Stf_CheckedBit" {{old('Stf_CheckedBit')!=''?(old('Stf_CheckedBit')=='0'?'checked':''):''}}>
                                </td>
                            </tr>






                            <tr>

                                <td colspan="8" style="text-align: center">
                                    <input type="submit" value="提交">
                                    <input type="button" class="back" onclick="history.go(-1)" value="返回">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>

            <script>

                $(function () {
                    $("#brithday").jeDate({
                        format: "YYYY-MM-DD",
                        skinCell: "jedateblue",
                        onClose: true
                    });

                    $("#Stf_InFac").jeDate({
                        format: "YYYY-MM-DD",
                        skinCell: "jedateblue",
                        onClose: true
                    });


                    $("#Sto_GradDate").jeDate({
                        format: "YYYY-MM-DD",
                        skinCell: "jedateblue",
                        onClose: true
                    });
                    $("#Stf_Regular").jeDate({
                        format: "YYYY-MM-DD",
                        skinCell: "jedateblue",
                        onClose: true
                    });
                });



                $("#stfphoto").dropzone({
                    url: "{{url('admin/humstuff/upload_stf_photo')}}",
                    paramName: "file", // The name that will be used to transfer the file
//                    maxFiles:1,//一次性上传的文件数量上限
                    maxFilesize: 10, // MB
                    addRemoveLinks: true,
                    addViewLinks: true,
                    acceptedFiles: ".jpg,.gif,.png,.jpeg",
                    dictMaxFilesExceeded: "您一次最多只能上传1个文件",
                    params: {
                        _token: "{{csrf_token()}}"
                    },
                    init: function () {
                        this.on("success", function (file,data) {
                            //上传成功触发的事件
                            if (data.pstate=='success') {
                                //删除上一次上传的照片
                                if($("#Stf_Photo").val()!=''||$("#Stf_Photo").val()!=null) {
                                    $.post("{{url('admin/humstuff/del_stf_photo')}}",{'_token':'{{csrf_token()}}','src':$('#Stf_Photo').val()},
                                        function (data) {
                                        });
                                }

                                $('#Stf_Photo').val(data.filepath);
                                $('#stf_img').attr('src', '/' + data.filepath);


                            }
                        });
                        this.on("removedfile", function (file) {
                            $.post("{{url('admin/humstuff/del_stf_photo')}}",{'_token':'{{csrf_token()}}','src':$('#Stf_Photo').val()},
                            function (data) {
                                if(data.status ==1){
                                    layer.msg(data.msg);
                                }else{
                                    layer.msg(data.msg,{icon:5});
                                }
                            });

                            $('#Stf_Photo').val('');

                        });
                    }

                });
            </script>

        @endsection


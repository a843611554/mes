@extends('layouts.admin')
@section('content')
    <link rel="stylesheet" type="text/css" href="{{asset('js/DatePicker/skin/jedate.css')}}"/>
    <script type="text/javascript" src="{{asset('js/DatePicker/jquery.jedate.js')}}"></script>
    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="#">首页</a> &raquo; <a href="{{url('admin/plan_add_material')}}">计划加料管理</a> &raquo;新增加料
    </div>
    <!--面包屑导航 结束-->

	<!--结果集标题与导航组件 开始-->
	<div class="result_wrap">
        <div class="result_title">
            <h3>快捷操作</h3>
        </div>
    </div>
    <!--结果集标题与导航组件 结束-->
    <div class="result_wrap">
        <form action="{{url('admin/plan_add_material')}}" method="post" >
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

                    <th><i class="require">*</i>计划条码：</th>
                    <td>
                        <div class="sbtn" id="search-div">


                            <input type="text" value="{{old('plan_code')}}" name="plan_code"
                                   id="plan_code" />
                            <button type="button" onclick="popshow('/admin/popplanexec/-1')" class="btnSearch" id="plan_pp" style="padding: 0 10px;height: 22px;vertical-align: middle;margin-right: 10px;color: #fff;letter-spacing: 2px;border-radius: 3px;background: #337ab7;border: 1px solid #286090;cursor: pointer">
                                查询
                            </button>
                            <div class="suggest" id="search-att" style="display:none;">
                                <ul id="search-result">
                                </ul>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>计划名称：</th>
                    <td>
                        <input type="text" name="plan_name" value="{{old('plan_name')}}" id="plan_name" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <th>产品编号：</th>
                    <td>
                        <input hidden name="pid" id="pid" readonly="readonly" value="{{old('pid')}}">
                        <input type="text" name="pcode" id="pcode" readonly="readonly" value="{{old('pcode')}}">
                    </td>
                </tr>
                <tr>
                    <th>产品名称：</th>
                    <td>
                        <input type="text" name="pname" id="pname" readonly="readonly" value="{{old('pname')}}">
                    </td>
                </tr>
                <tr>
                    <th>工艺编号：</th>
                    <td>
                        <input type="hidden" name="art_id" id="art_id" readonly="readonly" value="{{old('art_id')}}">
                        <input type="text" name="acode" id="acode" readonly="readonly" value="{{old('acode')}}">
                    </td>
                </tr>
                <tr>
                    <th>工艺名称：</th>
                    <td>
                        <input type="text" name="art_name" id="aname" readonly="readonly" value="{{old('art_name')}}">
                    </td>
                </tr>
                
                <tr>
                    <th><i class="require">*</i>加料数量</th>
                    <td>
                        <input type="text"  name="add_material_num" onkeyup="checkNum(this)" value="{{old('add_material_num')}}">
                    </td>
                </tr>
                
                <tr>
                    <th></th>
                    <td>
                        <input type="submit"  value="提交">
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
                area: ['800px', '550px'],
                fixed: false,
                maxmin: true,
                content: path
            })
        }

        $(document).bind('click', function () {
            $('#search-att').hide();
        });

        $(document).delegate('li', 'click', function () {
            var val = $(this).text();
            var pval = $(this).attr('id');
            var idval = pval.replace('plan_code', 'hide');
            $('#plan_code').val(val);
            $("#plan_id").val($("#" + pval).text());

        });

        //数量只能输入正整数
        function checkNum(obj)
        {
            if(obj.value.length == 1) {
                obj.value = obj.value.replace(/[^1-9]/g, '')
            } else {
                obj.value = obj.value.replace(/\D/g, '')
            }
        }



    </script>

@endsection
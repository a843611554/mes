@extends('layouts.admin')
@section('content')

    <!--结果页快捷搜索框 开始-->
    <div class="search_wrap">
        <form action="{{url('admin/username/finduser/'.$userid)}}" method="post">
            {{csrf_field()}}
            <table class="search_tab">
                <tr>
                    <th width="70">关键字:</th>
                    <td><input type="text" name="keywords" placeholder="关键字"></td>
                    <td><input type="submit" name="sub" value="查询"></td>

                </tr>
            </table>
        </form>
    </div>
    <!--结果页快捷搜索框 结束-->
    <div>
        <div style="height: 55%">
            <!--搜索结果页面 列表 开始-->
            <form action="{{url('admin/username/'.$userid.'/edit')}}" method="post" id="formid">
                {{csrf_field()}}
                <div class="result_popwrap">
                    <div class="result_popcontent">
                        <table class="list_poptab">

                            @if(!is_object($group))
                                    <select id="leftBox" multiple="multiple" style="height: 180px; width: 600px;">
                                            <option value="" ondblclick="move('leftBox','rightBox')"></option>
                                    </select>
                                <tr>
                                    <input type="button" value="↓" onclick="move('leftBox','rightBox')"/>
                                    <input type="button" value="↑" onclick="move('rightBox','leftBox')"/>
                                    <input type="button" value="⇊" onclick="moveAll('leftBox','rightBox')"/>
                                    <input type="button" value="⇈" onclick="moveAll('rightBox','leftBox')"/>

                                </tr>

                            @else

                                <tr>
                                    <select id="leftBox" multiple="multiple" style="height: 180px; width: 600px;">
                                        @foreach($r as $key => $value)
                                            <option value="{{$value}}" ondblclick="move('leftBox','rightBox')">{{$r[$key]}}&nbsp;&nbsp;&nbsp;=>&nbsp;&nbsp;&nbsp;{{$u[$key]}}</option>
                                        @endforeach

                                    </select>
                                </tr>

                                <tr>
                                    <input type="button" value="↓" onclick="move('leftBox','rightBox')"/>
                                    <input type="button" value="↑" onclick="move('rightBox','leftBox')"/>
                                    <input type="button" value="⇊" onclick="moveAll('leftBox','rightBox')"/>
                                    <input type="button" value="⇈" onclick="moveAll('rightBox','leftBox')"/>
                                </tr>
                            @endif

                               <table>
                                <tr>
                                    <select   id="rightBox" multiple="multiple" style="height: 180px; width: 600px;">
                                        @foreach($data as $g)
                                        <option value="{{$g->duser_name}}" ondblclick="move('leftBox','rightBox')">{{$g->duser_name}}&nbsp;&nbsp;&nbsp;->&nbsp;&nbsp;&nbsp;{{$g->cn_name}}</option>
                                        @endforeach
                                    </select>
                                </tr>
                               </table>
                                <input type="hidden" id="userid" name="user_id" value="{{$userid}}" />
                                <input type="hidden" id="hidden" name="group_user" value="" />
                                <input type="submit"  value="确认" onclick="postinfo()" >
                        </table>
                    </div>
                </div>
            </form>
            <!--搜索结果页面 列表 结束-->
        </div>

    </div>

    <script>
        function move(from,to) {

            var fromBox = document.getElementById(from);
            var toBox = document.getElementById(to);
            while(fromBox.selectedIndex != -1){
                toBox.appendChild(fromBox.options[fromBox.selectedIndex]);
            }
        }
        function moveAll(from,to) {

            var fromBox = document.getElementById(from);
            var toBox = document.getElementById(to);
            while(fromBox.options.length > 0){
                toBox.appendChild(fromBox.options[0]);
            }
        }

        document.getElementById("formid").onsubmit = function () {
            var arr = [];
            var op = document.getElementById("rightBox").options;
            for (var i = 0; i < op.length; i++)
                arr[i] = op[i].value;
            var d=document.getElementById("hidden").value = arr.join(",");
        }
        function postinfo() {
            var index = parent.layer.getFrameIndex(window.name);
            var arr = [];
            var op = document.getElementById("rightBox").options;
            for (var i = 0; i < op.length; i++)
                arr[i] = op[i].value;
            var d=document.getElementById("hidden").value = arr.join(",");

            parent.$('#groupuser').val(d);
            parent.layer.close(index);

        }


    </script>

@endsection


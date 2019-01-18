@extends('layouts.admin')

@section('content')
    <script type="text/javascript" src="{{asset('js/zTree/js/jquery.ztree.all.min.js')}}"></script>
    <link rel="stylesheet" type="text/css" href="{{asset('js/zTree/css/zTreeStyle/zTreeStyle.css')}}"/>
    <div id="select_stor">
        <ul id="stor_tree" class="ztree" style="width:260px; overflow:auto;"></ul>
    </div>
    <div id="add" hidden style="margin: 50px ;width: 300px">
        开始编号： <span class="pcode"></span><input onkeyup="checkNum(this)" type="text" id="start_code">
        <br><br>
        结束编号： </span><span class="pcode"></span><input onkeyup="checkNum(this)" type="text" id="end_code">
    </div>
    <script>
        $(function () {
            var setting = {

                view: {
                    addHoverDom: addHoverDom,
                    removeHoverDom: removeHoverDom,

                },
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "code",
                        pIdKey: "pcode",
                        rootPId: "0"
                    },
                },

            }
            var zNodes=[
                @foreach($stor as $v)
                {code:'{{$v->Stor_code}}',pcode:'{{$v->Sp_ParentNo}}',name:'{{$v->Stor_name}}',id:'{{$v->Stor_id}}' ,},
                @endforeach
            ];

            $(document).ready(function () {
                var stor = $("#stor_tree");
                stor = $.fn.zTree.init(stor, setting, zNodes);
            });

        });

        function addHoverDom(treeId, treeNode) {
            var IDMark_A = "_a";
            var aObj = $("#" + treeNode.tId + IDMark_A);
            if ($("#diyBtn1_"+treeNode.code).length>0 && treeNode.level!==2) return;
            if ($("#diyBtn2_"+treeNode.code).length>0) return;
            if ($("#diyBtn3_"+treeNode.code).length>0) return;
            var editStr =
                "<a id='diyBtn1_" +treeNode.code+ "' onclick='add("+"\""+treeNode.code+"\""+","+"\""+treeNode.level+"\");return false;' style='margin:0 0 0 5px;color: #3C6E31'>添加</a>"+
                "<a id='diyBtn2_" +treeNode.code+ "' onclick='edit("+"\""+treeNode.id+"\");return false;' style='margin:0 0 0 5px; color: #0055aa'>编辑</a>" +
                "<a id='diyBtn3_" +treeNode.code+ "' onclick='del("+"\""+treeNode.code+"\""+","+"\""+treeNode.name+"\""+",this"+");return false;' style='margin:0 0 0 5px;color: #5e5e5e'>删除</a>";

            aObj.append(editStr);
        }
        function removeHoverDom(treeId, treeNode) {

            $("#diyBtn1_"+treeNode.code).unbind().remove();
            $("#diyBtn2_"+treeNode.code).unbind().remove();
            $("#diyBtn3_"+treeNode.code).unbind().remove();
        }

        function edit(id) {
            parent.location.href="{{url('admin/datstorage')}}/"+id+"/edit";
        }


        function del(code, name) {

            layer.confirm('您确定删除'+name+'吗？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.post('{{url('admin/datstorage/')}}/' + code, {
                    '_method': 'delete',
                    '_token': '{{csrf_token()}}'
                }, function (data) {
                    if (data.status == 1) {
                        layer.msg(data.msg);

                        var stor = $.fn.zTree.getZTreeObj("stor_tree");
                        //选中节点
                        var nodes = stor.getSelectedNodes();
                        for (var i=0, l=nodes.length; i < l; i++)
                        {
                            //删除选中的节点
                            stor.removeNode(nodes[i]);
                        }
                    } else {
                        layer.msg(data.msg, {icon: 5});

                    }

                })

            }, function () {

            });
        }

        function add(code,level) {
            $('.pcode').html(code);
            if(level>=2){
                layer.msg('无法继续添加子集');
                return false;
            }

            layer.open({
                title:'添加',
                type: 1,
                shadeClose: true,
                fixed: false,
                maxmin: true,
                content: $('#add'),
                btn: ['确认', '取消'],
                yes: function(index){
                    if($('#end_No').val()< $('#start_No').val()){
                        layer.msg('结束值要大于起始值');
                        return false;
                    }
                    var start_code = code.toString() + $('#start_code').val().toString();
                    var end_code = code.toString() + $('#end_code').val().toString();

                    if( start_code.length !=end_code.length){
                        layer.msg('字符长度不同');
                        return false;
                    }

//                    q
                    $.post("{{url('admin/datstorage/add')}}",
                        {
                            '_token':'{{csrf_token()}}',
                            'start_code':start_code,
                            'end_code':end_code,
                            'pcode':code
                        },function (data) {
                            if(data.status==1){
                                layer.msg(data.msg);
                                layer.close(index);
                                location.reload();
                            }else{
                                layer.msg(data.msg);
                            }
                        });

                },
            });
        }
        function checkNum(obj)
        {
            obj.value = obj.value.replace(/\D/g, '')
        }
    </script>
@endsection
@extends('layouts.admin')
@section('content')
    <script type="text/javascript" src="{{asset('js/JsBarcode.code128.min.js')}}"></script>
    <!--搜索结果页面 列表 开始-->
    <form action="#" method="post">
        {{csrf_field()}}
        <div style="height: 30px;line-height: 30px">
            <a style="margin-left: 20px" href="javascript:printme()" target="_self">打印</a>
        </div>
        <div style="margin-left: 20px ;font-weight: bold">
            <div class="result_wrap" style="border: none" id="print">
                <div class="result_content" style="border: none">


                    <input type="hidden" name="pack_bill" id="pack_bill" value="{{$data->pack_bill}}">
                    <svg id="barcode"></svg>

                    @foreach($detail as $v)
                        <p style="margin-left: 10px;margin-top: -10px;font-size: 8px; padding: 0 0;">
                            production:{{$v->pname}} / {{$v->box_num}}
                        </p>
                    @endforeach

                </div>

            </div>
            <a  href="javascript:history.go(-1)">返回</a>
        </div>
    </form>
    <!--搜索结果页面 列表 结束-->
    <style>
        table.list_tab tr td input[type='text'] {
            width: 71px;
            text-align: left;
            display: inline;
        }

        table.list_tab {
            border: none;
        }
    </style>
    <script type="text/javascript">

        var barcode = document.getElementById('barcode'),
            str = document.getElementById('pack_bill').value,
            options = {
                format: "CODE128",
                displayValue: true,
                fontSize: 18,
                wide: 3,
                height: 60
            };
        JsBarcode(barcode, str, options);//原生
        $('#barcode').JsBarcode(string, options);//jQuery
        /*   JsBarcode("#barcode", "123", {
         format: "CODE128",//选择要使用的条形码类型
         wide:3,
         height:30,//高度
         displayValue:true,//是否在条形码下方显示文字
         text:"MDS201805180005",//覆盖显示的文本
         font:"Arial",//设置文本的字体
         textAlign:"left",//设置文本的水平对齐方式
         textPosition:"bottom",//设置文本的垂直位置
         textMargin:3,//设置条形码和文本之间的间距
         fontSize:15,//设置文本的大小
         background:"#fff",//设置条形码的背景
         lineColor:"#000000",//设置条和文本的颜色。

         });*/


        var global_Html = "";
        function printme() {
            global_Html = document.body.innerHTML;
            document.body.innerHTML = document.getElementById('print').innerHTML;
            window.print();
            window.setTimeout(function () {
                document.body.innerHTML = global_Html;
            }, 1500);
        }
    </script>

@endsection
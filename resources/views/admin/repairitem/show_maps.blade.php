<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Baidu Map </title>
    <style type="text/css">
        html{height:100%}
        body{height:100%;margin:0px;padding:0px}
        #container{height:100%}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Ge5x6VPf6hIffdVBMFhD03yrE0c0E79C"></script>
</head>
<body>
@if(count($data)<=0)
    <h1 align="center" style="color: #5e5e5e;padding-top: 30%" >无数据</h1>

    @else
    <div id="container"></div>

    <script>
        var map = new BMap.Map("container");

        @foreach($data as $v)
        @if($v->check_lng && $v->check_lat)

            var point = new BMap.Point('{{$v->check_lng}}','{{$v->check_lat}}');
            @continue
        @endif
    @endforeach
map.centerAndZoom(point,14);
        var marker = new BMap.Marker(point);
        var mapPoints = [
            @foreach($data as $v)
            {lng:'{{$v->check_lng}}',lat:'{{$v->check_lat}}',title:"单号:{{$v->repair_bill}}",time:'时间:{{date('Y-m-d h:m:s',$v->checkdate)}}'},
            @endforeach
        ];
        var i = 0;
        map.addOverlay(marker);
        map.enableScrollWheelZoom(true);
        // 函数 创建多个标注
        function markerFun (points,label,infoWindows) {
            var markers = new BMap.Marker(points);
            map.addOverlay(markers);
            markers.setLabel(label);
            markers.addEventListener("click",function (event) {
                map.openInfoWindow(infoWindows,points);//参数：窗口、点  根据点击的点出现对应的窗口
            });
        }
        for (;i<mapPoints.length;i++) {
            var points = new BMap.Point(mapPoints[i].lng,mapPoints[i].lat);//创建坐标点
            var opts = {
                width:250,
                height: 80,
                title:mapPoints[i].title
            };
            var label = new BMap.Label(mapPoints[i].time,{
                offset:new BMap.Size(25,5)
            });
            var infoWindows = new BMap.InfoWindow(mapPoints[i].time,opts);
            markerFun(points,label,infoWindows);
        }
    </script>
@endif


</body>
</html>

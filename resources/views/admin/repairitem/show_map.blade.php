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
@if($longitude == 0 && $latitude== 0)
    <h1 align="center" style="color: #5e5e5e;padding-top: 30%">
        无数据
    </h1>

@else
    <div id="container"></div>
    <script>
        var map = new BMap.Map("container");          // 创建地图实例
        var point = new BMap.Point('{{$longitude}}','{{$latitude}}');  // 创建中心点坐标
        map.centerAndZoom(point,16);
        map.addControl(new BMap.MapTypeControl()); //添加地图类型控件
        map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
        var marker = new BMap.Marker(point);        // 创建标注
        map.addOverlay(marker);
    </script>
@endif


</body>
</html>


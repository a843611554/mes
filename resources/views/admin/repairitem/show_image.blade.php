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
@if($src == null || $src=='')
    <h1 align="center" style="color: #5e5e5e;padding-top: 30%">
        图片不存在
    </h1>
@else
    <div id="container">
        <img src="{{$src}}" width="100%">
    </div>

@endif


</body>
</html>


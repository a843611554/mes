<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	{{--<link rel="stylesheet" href="./style/css/ch-ui.admin.css">--}}
	{{--<link rel="stylesheet" href="./style/font/css/font-awesome.min.css">--}}
	<link rel="stylesheet" href="{{asset('css/ch-ui.admin.css')}}">
	<link rel="stylesheet" href="{{asset('css/font-awesome.min.css')}}">
</head>
<body style="background:#F3F3F4;">
	<div class="login_box">
		<h1>天赢生产管理平台</h1>
		<h2>欢迎使用</h2>
		<div class="form">
			@if (session('msg'))
			<p style="color:red">{{session('msg')}}</p>
		    @endif
			<form action="" method="post">
				{{csrf_field()}}
				<ul>
					<li>
					<input type="text" name="user_name" class="text"/>
						<span><i class="fa fa-user"></i></span>
					</li>
					<li>
						<input type="password" name="user_pass" class="text"/>
						<span><i class="fa fa-lock"></i></span>
					</li>
					<li>
						<input type="text" class="code" name="code"/>
						<span><i class="fa fa-check-square-o"></i></span>
						<img src="{{url('admin/code')}}" alt="" onclick="this.src='{{url('admin/code')}}?'+Math.random()">
					</li>
					<li>
						<input type="submit" value="login"/>
					</li>
				</ul>
			</form>
			<p><a href="#">Home</a> &copy; 2016 Powered by <a href="http://www.naautoparts.com" target="_blank">http://www.naautoparts.com</a></p>
		</div>
	</div>
</body>
</html>
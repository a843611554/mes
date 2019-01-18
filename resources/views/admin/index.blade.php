@extends('layouts.admin')
		@section('content')
			<body>
			<!--头部 开始-->
			<div class="top_box">
				<div class="top_left">
					<div class="logo">后台管理系统</div>
					<ul>
						<li><a href="#" class="active">主页</a></li>
						<li><a href="#">管理</a></li>
					</ul>
				</div>
				<div class="top_right">
					<ul>
						<li>当前用户：admin</li>
						<li><a href="{{url('admin/pass')}}" target="main">修改密码</a></li>
						<li><a href="{{url('admin/quit')}}">退出登录</a></li>
					</ul>
				</div>
			</div>
			<!--头部 结束-->

			<!--左侧导航 开始-->
			<div class="menu_box">
				<ul>
					<li>
						<h3><i class="fa fa-fw fa-clipboard"></i>常规操作</h3>
						<ul class="sub_menu">
							<li><a href="{{url('admin/mobile')}}" target="main"><i class="fa fa-fw fa-plus-square"></i>增加产品</a></li>
							<li><a href="{{url('admin/product')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>产品列表</a></li>
							<li><a href="{{url('admin/productshow')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>产品展示</a></li>
							<li><a href="{{url('admin/planexec')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>计划执行</a></li>
							<li><a href="{{url('admin/plan_add_material')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>计划加料</a></li>

							<li><a href="{{url('admin/printit')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>计划列表</a></li>
							<li><a href="{{url('admin/category/create')}}" target="main"><i class="fa fa-fw fa-plus-square"></i>增加产品</a></li>
							<li><a href="{{url('admin/category')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>所有产品</a></li>
                            <li><a href="{{url('admin/art')}}" target="main"><i class="fa fa-fw fa-plus-square"></i>工艺</a></li>
                            <li><a href="{{url('admin/artwork')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>工艺工作</a></li>
							<li><a href="{{url('admin/attachment')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>附件</a></li>

							<li><a href="{{url('admin/device')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>设备管理</a></li>
							<li><a href="{{url('admin/section')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>区域管理</a></li>
							<li><a href="{{url('admin/repaircontact')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>维修人员管理</a></li>
							<li><a href="{{url('admin/humstuff')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>员工管理</a></li>
							<li><a href="{{url('admin/alert')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>异常信息</a></li>
							<li><a href="{{url('admin/custompackage/show')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>手动装箱</a></li>
							<li><a href="{{url('admin/stock')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>出入库</a></li>
							<li><a href="{{url('admin/repairitem')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>维修报表</a></li>
							<li><a href="{{url('admin/datstorage')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>仓库信息</a></li>
							<li><a href="{{url('admin/materialbox')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>周转箱</a></li>
							<li><a href="{{url('admin/producebom')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>生产物料清单</a></li>


						</ul>
					</li>
					<li>
						<h3><i class="fa fa-fw fa-cog"></i>设置</h3>
						<ul class="sub_menu">
							<li><a href="{{url('admin/links')}}" target="main"><i class="fa fa-fw fa-link"></i>链接</a></li>
							<li><a href="{{url('admin/navs')}}" target="main"><i class="fa fa-fw fa-navicon"></i>导航</a></li>
							<li><a href="{{url('admin/config')}}" target="main"><i class="fa fa-fw fa-cubes"></i>配置</a></li>
							<li><a href="#" target="main"><i class="fa fa-fw fa-database"></i>备份恢复</a></li>
						</ul>
					</li>
					<li>
						<h3><i class="fa fa-fw fa-cog"></i>基础信息</h3>
						<ul class="sub_menu">
							<li><a href="{{url('Admin')}}" target="main"><i class="fa fa-fw fa-plus-square"></i>用户列表</a></li>
							<li><a href="{{url('admin/company')}}" target="main"><i class="fa fa-fw fa-plus-square"></i>公司列表</a></li>
							<li><a href="{{url('admin/username')}}" target="main"><i class="fa fa-fw fa-plus-square"></i>员工列表</a></li>
							<li><a href="{{url('admin/depart/create')}}" target="main"><i class="fa fa-fw fa-plus-square"></i>添加出港</a></li>
							<li><a href="{{url('admin/depart')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>出港列表</a></li>
							<li><a href="{{url('admin/workcenter/create')}}" target="main"><i class="fa fa-fw fa-plus-square"></i>增加工作中心</a></li>
							<li><a href="{{url('admin/workcenter')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>工作中心列表</a></li>
							<li><a href="{{url('admin/dict/create')}}" target="main"><i class="fa fa-fw fa-list-alt"></i>添加字典</a></li>
							<li><a href="{{url('admin/dict')}}" target="main"><i class="fa fa-fw fa-book"></i>字典</a></li>
							<li><a href="{{url('admin/operater')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>操作员</a></li>
							<li><a href="{{url('admin/quality')}}" target="main"><i class="fa fa-fw fa-list-ul"></i>质检</a></li>


						</ul>
					</li>
					<li>
						<h3><i class="fa fa-fw fa-thumb-tack"></i>工具</h3>
						<ul class="sub_menu">
							<li><a href="http://www.yeahzan.com/fa/facss.html" target="main"><i class="fa fa-fw fa-font"></i>图标</a></li>
							<li><a href="http://hemin.cn/jq/cheatsheet.html" target="main"><i class="fa fa-fw fa-chain"></i>JQuery</a></li>
							<li><a href="http://tool.c7sky.com/webcolor/" target="main"><i class="fa fa-fw fa-tachometer"></i>颜色</a></li>
							<li><a href="element.html" target="main"><i class="fa fa-fw fa-tags"></i>其他</a></li>
						</ul>
					</li>
					<li>
						<h3><i class="fa fa-fw fa-bullhorn"></i>股票投资</h3>
						<ul class="sub_menu">
							<li><a href="{{url('admin/inout')}}" target="main"><i class="fa fa-fw fa-tags"></i>股票投资</a></li>

						</ul>
					</li>
				</ul>
			</div>
			<!--左侧导航 结束-->

			<!--主体部分 开始-->
			<div class="main_box">
				<iframe src="{{url('admin/info')}}" frameborder="0" width="100%" height="100%" name="main"></iframe>
			</div>
			<!--主体部分 结束-->

			<!--底部 开始-->
			<div class="bottom_box">
				CopyRight © 2015. Powered By <a href="">Madison</a>.
			</div>
			<!--底部 结束-->

		@endsection

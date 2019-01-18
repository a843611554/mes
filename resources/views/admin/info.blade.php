@extends('layouts.admin')
        @section('content')
            <!--面包屑导航 开始-->
            <div class="crumb_warp">
                <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
                <i class="fa fa-home"></i> <a href="#">@lang('home.home')</a>
            </div>
            <!--面包屑导航 结束-->

            <!--结果集标题与导航组件 开始-->
            <div class="result_wrap">
                <div class="result_title">
                    <h3>@lang('home.shortcut')</h3>
                </div>
                <div class="result_content">
                    <div class="short_wrap">
                        <a href="#"><i class="fa fa-plus"></i>@lang('home.addproduct')</a>
                    </div>
                </div>
            </div>
            <!--结果集标题与导航组件 结束-->


            <div class="result_wrap">
                <div class="result_title">
                    <h3>@lang('home.System_information')</h3>
                </div>
                <div class="result_content">
                    <ul>
                        <li>
                            <label>@lang('home.operatingsystem')</label><span>WINNT</span>
                        </li>
                        <li>
                            <label>@lang('home.running_environment')</label><span>Apache/2.2.21 (Win64) PHP/5.3.10</span>
                        </li>
                        <li>
                            <label>@lang('home.php_running_mode')</label><span>apache2handler</span>
                        </li>
                        <li>
                            <label>@lang('home.ui_version')</label><span>v-0.1</span>
                        </li>
                        <li>
                            <label>@lang('home.attachment_limite')</label><span>2M</span>
                        </li>
                        <li>
                            <label>@lang('home.time')</label><span>2014-3-18 21:08:24</span>
                        </li>
                        <li>
                            <label>@lang('home.server_domain')/IP</label><span>localhost [ 127.0.0.1 ]</span>
                        </li>
                        <li>
                            <label>Host</label><span>127.0.0.1</span>
                        </li>
                    </ul>
                </div>
            </div>


            <div class="result_wrap">
                <div class="result_title">
                    <h3>@lang('home.help')</h3>
                </div>
                <div class="result_content">
                    <ul>
                        <li>
                            <label>@lang('home.support')：</label><span><a href="#">0532-81927560</a></span>
                        </li>
                        <li>
                            <label>@lang('home.developer')：</label><span><a href="#">danny</a></span>
                        </li>
                    </ul>
                </div>
            </div>
            <!--结果集列表组件 结束-->

        @endsection

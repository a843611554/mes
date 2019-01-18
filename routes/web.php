<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    return view('welcome');
//});

//Route::any('/', 'Admin\LoginController@login');

Route::group(['middleware' => ['web'], 'namespace' => 'Test'], function () {
    //Entrust::routeNeedsPermission('admin/product', 'create_user');
    Route::any('t', 'TestController@index');
});

Route::group(['middleware' => ['web'], 'namespace' => 'User'], function () {

    Route::resource('user', 'UserController');
});



Route::group([ 'middleware' => ['web'], 'prefix' => 'admin', 'namespace' => 'Admin'], function () {
    //Entrust::routeNeedsPermission('admin/product', 'create_user');
    Route::any('login', 'LoginController@login');
    Route::any('quit', 'LoginController@quit');
    Route::get('code', 'LoginController@code');


    Route::resource('dict', 'DictController');
    Route::post('dictangeorder', 'DictController@changeorder');

    Route::any('mobile/search','MobileController@search');
    Route::resource('mobile', 'MobileController');

});
Route::group(['middleware' => ['web', 'admin.login'], 'prefix' => 'admin', 'namespace' => 'Admin'], function () {
    Route::get('index', 'IndexController@index');
    Route::post('index', 'IndexController@index');
    Route::get('info', 'IndexController@info');
    Route::get('quit', 'LoginController@quit');
    Route::any('pass', 'IndexController@pass');
//    Route::resource('customer', 'CustomerController');
    Route::resource('company', 'CompanyController');
    Route::resource('username', 'UsernameController');
    Route::any('user2key', 'UsernameController@user2key');
    Route::resource('user', 'UserController');
    Route::resource('role', 'RoleController');
    Route::resource('permission', 'PermissionController');
    Route::any('showpermission/{pid}', 'PermissionController@showpermission');
    Route::any('showsysrole/{pid}', 'RoleController@showsysrole');//pop系统级角色列表可以check，然后添加
    Route::any('showrole/{pid}', 'RoleController@showrole');///pop车间级角色列表可以check，然后添加
    Route::any('roleaddpermission', 'PermissionController@roleaddpermission');//添加权限与角色关联
    Route::any('roleadd', 'RoleController@roleadd');//系统用户添加角色关联
    Route::any('shoproleadd', 'RoleController@shoproleadd');//车间用户添加角色关联
    Route::any('deliverpermission/{pid}', 'PermissionController@deliverpermission');
    Route::post('permission/changeorder', 'PermissionController@changeorder');
    Route::post('cpy/changepstate', 'CompanyController@changepstate');

    Route::any("custompackage",'CustomPackageController@index');
    Route::post("custompackage/show_detail","CustomPackageController@show_detail");
    Route::post("custompackage/select_pcode","CustomPackageController@select_pcode");
    Route::post("custompackage/get_pinfo","CustomPackageController@get_pinfo");
    Route::post("custompackage/select_cust_code","CustomPackageController@select_cust_code");
    Route::any("custompackage/find_cust","CustomPackageController@find_cust");
    Route::any("custompackage/custkeyword","CustomPackageController@custkeyword");
    Route::post("custompackage/find_pcode","CustomPackageController@find_pcode");
    Route::post("custompackage/pkeyword","CustomPackageController@pkeyword");
    Route::post("custompackage/check_detail","CustomPackageController@check_detail");
    Route::post("custompackage/save_pack","CustomPackageController@save_pack");
    Route::post("custompackage/save_pdetail","CustomPackageController@save_pdetail");
    Route::any("custompackage/show","CustomPackageController@show");
    Route::any("custompackage/show/search","CustomPackageController@search");
    Route::post("custompackage/show/check","CustomPackageController@check");
    Route::get("custompackage/check_print/{pack_bill}","CustomPackageController@pack_check_print");


    Route::resource('package', 'PackageController');
    Route::any('package/changepstate', 'PackageController@changepstate');
    Route::any('package/nochangepstate', 'PackageController@nochangepstate');
    Route::any('package/packageDet/{pid}', 'PackageController@packageDet');

    Route::any('packageCheckPrint/{pid}', 'PackageController@packageCheckPrint');


    Route::any("stock","StockController@index");
    Route::post("stock/select_cust_code","StockController@select_cust_code");
    Route::any("stock/find_cust","StockController@find_cust");
    Route::post("stock/custkeyword","CustomPackageController@custkeyword");
    Route::post("stock/select_oper_id","StockController@select_oper_id");
    Route::post("stock/find_oper","StockController@find_oper");
    Route::post("stock/select_pcode","StockController@select_pcode");
    Route::post("stock/get_pinfo","StockController@get_pinfo");
    Route::post("stock/find_pcode","StockController@find_pcode");
    Route::post("stock/pkeyword","CustomPackageController@pkeyword");
    Route::post("stock/check_detail","StockController@check_detail");
    Route::post("stock/save_stock","StockController@save_stock");

    Route::post('planexec/check_child','PlanexecController@check_child');
    Route::resource('planexec', 'PlanexecController');
    Route::any('planexecfindkey', 'PlanexecController@planexecfindkey');
    Route::get('popplanexec/{plan_type}', 'PublicController@popplanexec');//此处参数根据计划类别的不同显示不同数据
    Route::any("popfindplanexec",'PublicController@popfindplanexec');
    Route::post('todayexec','PlanexecController@todayexec');
    Route::any('planexec/addtodayexec/{plan_code}', 'PlanexecController@addtodayexec');




    Route::any('repaircontact/add_user2','RepaircontactController@add_user2');
    Route::any('repaircontact/find_user2','RepaircontactController@find_user2');
    Route::any('repaircontact/search','RepaircontactController@search');
    Route::post('repaircontact/get_device','RepaircontactController@get_device');
    Route::post('repaircontact/get_section','RepaircontactController@get_section');
    Route::post('repaircontact/get_alert_typedet','RepaircontactController@get_alert_typedet');
    Route::any('repaircontact/{id}/add_scheduling','RepaircontactController@add_scheduling');//增加排班
    Route::resource('repaircontact','RepaircontactController');


    Route::any('humstuff/search','HumstuffController@search');
    Route::any('humstuff/upload_stf_photo','HumstuffController@upload_stf_photo');
    Route::any('humstuff/del_stf_photo','HumstuffController@del_stf_photo');
    Route::resource('humstuff','HumstuffController');


    Route::any('section/search','SectionController@search');
    Route::resource('section','SectionController');


    Route::any('alert/search','AlertController@search');
    Route::resource('alert','AlertController');


    Route::any('device/search','DeviceController@search');
    Route::post('device/get_section','DeviceController@get_section');
    Route::resource('device','DeviceController');


    Route::any('repairitem','RepairitemController@index'); //入口
    Route::any('repairitem/repairman','RepairitemController@repairman');
    Route::any('repairitem/repairman_show/{operateman}/{start_date?}/{end_date?}','RepairitemController@repairman_show');
    Route::any('repairitem/repairman_show_edit/{repair_bill}','RepairitemController@repairman_show_edit');
    Route::post('repairitem/repairman_show_update/','RepairitemController@repairman_show_update');
    Route::any('repairitem/show_map/{longitude?}/{latitude?}','RepairitemController@show_map'); //查看单个维修单签到点
    Route::any('repairitem/show_maps/{operateman}/{start_date?}/{end_date?}','RepairitemController@show_maps'); //查看维修人员一定时间段内的签到点集合
    Route::any('repairitem/shop','RepairitemController@shop');
    Route::any('repairitem/shop_show/{shop_id}/{start_date?}/{end_date?}','RepairitemController@shop_show');
    Route::any('repairitem/shop_show_edit/{repair_bill}','RepairitemController@shop_show_edit');
    Route::post('repairitem/shop_show_update/','RepairitemController@shop_show_update');
    Route::any('repairitem/history','RepairitemController@history');
    Route::any('repairitem/show_image','RepairitemController@show_image');


    Route::post('datstorage/loadrack','DatStorageController@loadrack');
    Route::post('datstorage/add_stor','DatStorageController@add_stor');
    Route::post('datstorage/add_rack','DatStorageController@add_rack');
    Route::post('datstorage/add_No','DatStorageController@add_No');
    Route::post('datstorage/add','DatStorageController@add');//直接通过树状图添加操作
    Route::any('datstorage/show_all','DatStorageController@show_all');
    Route::any('datstorage/find_rack/{stor_code}','DatStorageController@find_rack');
    Route::any('datstorage/find_stor/{stor_code}','DatStorageController@find_stor');
    Route::resource('datstorage','DatStorageController');//入口


    Route::post('materialbox/auto_code','MaterialboxController@auto_code'); //周转箱自动生成编号
    Route::resource('materialbox','MaterialboxController'); //周转箱




    Route::resource('company', 'CompanyController');
    Route::resource('username', 'UsernameController');
    Route::any('user2key', 'UsernameController@user2key');
    Route::get('getuserdata/{usercode}', 'UsernameController@getuserdata');
    Route::post('modcomuserpass', 'UsernameController@modcomuserpass');
    Route::get('username/searchuser/{user_id}', 'UsernameController@searchuser');
    Route::any('username/finduser/{user_id}', 'UsernameController@finduser');
    Route::any('username/add/find_humstuff','UsernameController@find_humstuff');

    Route::any('producebom/show_child_pd/{Pd_Code}','ProducebomController@show_child_pd');
    Route::post('producebom/show_child_list','ProducebomController@show_child_list');//无限级下拉子物料信息列表
    Route::any('producebom/del_child/{id}','ProducebomController@del_child');//删除子物料
    Route::post("producebom/select_pcode","ProducebomController@select_pcode");
    Route::post("producebom/get_pinfo","ProducebomController@get_pinfo");
    Route::any("producebom/find_pcode","ProducebomController@find_pcode");//弹出框查找物料
    Route::any("producebom/find_child_pcode","ProducebomController@find_child_pcode");//弹出框查找子集物料
    Route::any("producebom/isset_bom","ProducebomController@isset_bom"); //查询是否已经定义了清单
    Route::any("producebom/add_child_pd","ProducebomController@add_child_pd"); //添加子物料弹出窗
//    Route::post("producebom/put_redis","ProducebomController@put_redis"); //存入redis
    Route::post("producebom/get_child_list","ProducebomController@get_child_list");
    Route::post("producebom/del_child_pd/{Pb_ChildCode}","ProducebomController@del_child_pd"); //移除子物料
    Route::resource('producebom','ProducebomController'); //资源路由---入口



    Route::post('plan_add_material/cancel/{id}','PlanAddMaterialController@cancel');
    Route::resource('plan_add_material','PlanAddMaterialController');

});


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

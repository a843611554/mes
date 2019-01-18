<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <h1 align="center">添加用户</h1>
    @if (count($errors) > 0)
        <script>
            alert("新增失败:输入不符合要求({!! implode($errors->all()) !!})");
        </script>

    @endif
    <form action="/user" method="post">
        <table align="center">
            {!! csrf_field() !!}
            <tr>
                <td>用户名</td>
                <td><input type="text" value="{{ old('username') }}" name="username" placeholder="输入用户名" required></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input type="password" name="password" placeholder="输入密码" required></td>
            </tr>

            <tr>
                <td colspan="2" align="center"><button type="submit">提交</button> </td>
            </tr>
        </table>
    </form>
</body>
</html>
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
    <h1 align="center">编辑用户</h1>
    @if (count($errors) > 0)
        <script>
            alert("{!! implode($errors->all()) !!}");
        </script>

    @endif
    <form action="/user/{{$data['user_id']}}" method="POST">
        {!! csrf_field() !!}
        {{ method_field('PUT') }}

        <table align="center" >

            <tr>
                <td>用户id:</td>
                <td>{{$data['user_id']}}</td>

            </tr>
            <tr>
                <td>用户名</td>
                <td><input name="username" type="text" value="{{$data["username"]}}" placeholder="请输入用户名" required></td>
            </tr>

            <tr>
               <td colspan="2" align="center"><button type="submit">提交</button> </td>
            </tr>
        </table>

    </form>
</body>
</html>
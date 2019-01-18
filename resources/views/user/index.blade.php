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
@if (count($errors) > 0)
    <script>
        alert("{!! implode($errors->all()) !!}");
    </script>

@endif
    <div>
        <h1></h1>
        <table>
            <tr>
                <th>用户ID</th>
                <th>用户名</th>
                <th>用户密码</th>
                <th>操作</th>
            </tr>
            @foreach($data as $user)
            <tr>

                <td>{{$user['user_id']}}</td>
                <td>{{$user['username']}}</td>
                <td>{{$user["password"]}}</td>
                <td><a href="/user/{{$user['user_id']}}">详情</a> | <a href="/user/{{$user['user_id']}}/edit">编辑</a> |
                    <form action="/user/{{$user['user_id']}}" method="POST" style="display: inline;">
                        {{ method_field('DELETE') }}
                        {{ csrf_field() }}
                        <button type="submit" >删除</button>
                    </form>
                </td>
            </tr>
            @endforeach
            <tr>
                <td colspan="4" align="center"><a href="user/create">增加用户</a></td>
            </tr>
        </table>
    </div>
</body>
</html>
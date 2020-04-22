<%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/4/17
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>

<html>
<head>
    <title>登录</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <!-- web路径：
     不以/开始的相对路径，找资源，以当前资源的路径为基准，经常出问题
     以/开始的相对路径，找资源，以服务器的路径为标准（http://localhost:3306），需要加上项目名
     http://localhost:3306/SaiOJ
     -->
    <!-- 引入Jquery -->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>

    <!-- 引入Bootstrap样式 -->
    <link href="${APP_PATH}/static/css/signin.css" rel="stylesheet">
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<body>

<div class="container">

    <form class="form-signin" action="${APP_PATH}/login.do" method="post" enctype="application/x-www-form-urlencoded">
        <div class="clearfix" style="margin-top: 60px;"></div>


        <h2 class="form-signin-heading text-center">登录</h2>
        <div class="clearfix" style="margin-top: 30px;"></div>

        <div class="form-group">
            <label for="username" class="sr-only">账号</label>
            <input type="text" id="username" name="username" class="form-control" placeholder="账号" required autofocus>
        </div>

        <div class="form-group">
            <label for="password" class="sr-only">密码</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="密码" required>
        </div>

<%--        <div class="checkbox">--%>
<%--            <label>--%>
<%--                <input type="checkbox" value="remember-me"> 记住账号--%>
<%--            </label>--%>
<%--        </div>--%>
        <span class="help-block has-error">${msg}</span>

        <div>
            <button class="btn btn-primary btn-block" type="submit" id="submit_btn">登录</button>
            <button class="btn bg-primary btn-block" onclick="window.location.href='register'">注册</button>
        </div>
    </form>

</div> <!-- /container -->


<script>



    // $("#submit_btn").click(function () {
    //     var username = $("#username").val();
    //     var password = $("#password").val();
    //     $.ajax({
    //         url:"login.action",
    //         type:"POST",
    //         dataType:"json",
    //         data:"username="+username+"&password="+password,
    //         success:function (result) {
    //             if(result.code == 100) parent.location.href='list.html';
    //             else{
    //                 alert("用户名密码错误");
    //             }
    //         },
    //         error:function (result) {
    //             alert("error");
    //         }
    //     })
    // })

</script>

</body>
</html>

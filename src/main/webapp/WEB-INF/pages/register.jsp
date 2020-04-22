<%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/4/17
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <!-- 引入Jquery -->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>

    <!-- 引入Bootstrap样式 -->
    <link href="${APP_PATH}/static/css/signin.css" rel="stylesheet">
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">

    <form id="form_register" class="form-signin">
        <div class="clearfix" style="margin-top: 10px;"></div>
        <h2 class="form-signin-heading text-center">注册</h2>
        <div class="clearfix" style="margin-top: 30px;"></div>

        <div class="form-group">
            <input type="text" id="username_input" name="username" class="form-control" placeholder="账号" required autofocus>
            <span class="help-block"></span>
        </div>

        <div class="form-group">
            <input type="text" id="nickname_input" name="nickname" class="form-control" placeholder="昵称" required>
            <span class="help-block"></span>
        </div>

        <div class="form-group">
            <input type="password" id="password_input" name="password" class="form-control" placeholder="密码" required>
            <span class="help-block"></span>
        </div>

        <div>
            <input type="password" id="password_check_input" name="password_check" class="form-control" placeholder="确认密码" required>
            <span class="help-block"></span>
        </div>

        <div class="clearfix" style="margin-top: 30px;"></div>

        <button id="submit_btn" class="btn btn-lg btn-primary btn-block" type="button">注册</button>
    </form>

</div> <!-- /container -->


<script>

    //获取根路径
    function get_rootPath() {
        var curPageUrl = window.document.location.href;
        var rootPath1 = curPageUrl.split("//")[0];
        //alert(rootPath1);
        var rootPath2 = curPageUrl.split("//")[1].split("/")[0];
        //alert(rootPath2);
        var rootPath3 = curPageUrl.split("//")[1].split("/")[1];
        //alert(rootPath3);
        return rootPath = rootPath1 + "//" + rootPath2 + "//" +rootPath3;
    }

    //校验数据
    function validate_input(ele,ele_name,reg,msgs){
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next().text("");
        //1、拿到要校验的数据，使用正则表达式
        var ele_val = ele.val();
        if(!reg.test(ele_val)){
            //alert("请正确填写用户名");
            show_validate_msg(ele,"error",msgs[0]);
            return false;
        }else{
            show_validate_msg(ele,"success",msgs[1]);
        }
        return true;
    }

    //显示验证信息
    function show_validate_msg(ele,status,msg) {
        //清除状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next().text("");
        if("success" === status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error" === status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //校验用户名
    function check_username() {
        var reg_username = /(^[a-zA-Z0-9_-]{3,16}$)/;
        var msgs_username = ["用户名为3-16位字母数字组合","用户名合法✔"];
        return validate_input($("#username_input"),"用户名",reg_username,msgs_username);
    }

    //校验昵称
    function check_nickname() {
        var reg_nickname = /^([a-zA-Z0-9_-]{3,16}|[\u4E00-\u9FA5]{2,10}$)/;
        var msgs_nickname = ["昵称为3-16位字母数字汉字组合","昵称合法✔"];
        return validate_input($("#nickname_input"),"昵称",reg_nickname,msgs_nickname);
    }

    //校验密码
    function check_password() {
        var reg_password = /^[a-zA-Z0-9_-]{6,18}$/;
        var msgs_password = ["密码为6-18位字母数字组合","密码合法✔"];
        return validate_input($("#password_input"),"密码",reg_password,msgs_password);
    }

    //校验确认密码
    function check_password_check() {
        var password = $("#password_input").val();
        var password_check = $("#password_check_input").val();
        if(password === password_check){
            show_validate_msg(this,"success","");
            return true;
        }else{
            show_validate_msg(this,"error","密码不一致");
            return false;
        }
    }

    //鼠标离开输入框开始前端校验
    $('#username_input').change(check_username);
    $('#nickname_input').change(check_nickname);
    $('#password_input').change(check_password);
    $('#password_check_input').change(check_password_check);

    //点击注册
    $("#submit_btn").click(function () {
        if( !check_username()||
            !check_nickname()||
            !check_password()||
            !check_password_check())return false;
        var username = $("#username_input").val();
        var nickname = $("#nickname_input").val();
        var password = $("#password_input").val();
        var password_check = $("#password_check_input").val();

        $.ajax({
            url:"register.do",
            type:"POST",
            dataType:"json",
            data:{"username":username,"nickname":nickname,"password":password,"password_check":password_check},
            success:function (result) {
                if(result.code === "200"){
                    switch (result.extend.error_msg) {
                        case "用户名为3-16位字母数字组合":
                            show_validate_msg($('#username_input'),"error",result.extend.error_msg);
                            break;
                        case "昵称为3-16位字母数字汉字组合":
                            show_validate_msg($('#nickname_input'),"error",result.extend.error_msg);
                            break;
                        case "密码为6-18位字母数字组合":
                            show_validate_msg($('#password_input'),"error",result.extend.error_msg);
                            break;
                        case "密码不一致":
                            show_validate_msg($('#password_check_input'),"error",result.extend.error_msg);
                            break;
                        case "用户名存在":
                            show_validate_msg($('#username_input'),"error",result.extend.error_msg);
                            break;
                        case "昵称存在":
                            show_validate_msg($('#nickname_input'),"error",result.extend.error_msg);
                            break;
                        default:alert("注册失败");
                    }
                }else{
                    window.location.href = "login";
                }
            }
        });
    });

</script>

</body>
</html>
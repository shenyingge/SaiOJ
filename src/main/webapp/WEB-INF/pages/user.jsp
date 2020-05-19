<%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/4/27
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>

<html>
<head>
    <title>用户</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<style>
    .table tbody tr td{
        vertical-align: middle;
        height: 50px;
        max-height: 50px;
    }
</style>

<div class="container" style="margin-top: -5px">
    <div class="col-lg-3" style="margin-top: -10px">
        <h1><shiro:principal property="nickname"/></h1>
        <h4><shiro:principal property="username"/></h4>
        <h4>排名：<shiro:principal property="rank"/></h4>
    </div>
</div>
<nav class="navbar navbar-default" role="navigation">
    <div class="container">
<%--        <div class="navbar-header">--%>
<%--            <a class="navbar-brand" href="#">菜鸟教程</a>--%>
<%--        </div>--%>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="${APP_PATH}/user">个人信息</a></li>
                <li><a href="javascript:void(0);"onclick="get_submissions()">提交记录</a></li>
                <li><a href="javascript:void(0);"onclick="get_explanations()">我的题解</a></li>
                <shiro:hasRole name="管理员">
                    <li><a>用户管理</a></li>
                    <li><a>题目管理</a></li>
                    <li><a>数据查看</a></li>
                </shiro:hasRole>
            </ul>
        </div>

    </div>
    <div class="container">
        <div id="content">
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover">
                        <tbody>
                        <tr>
                            <td>昵称</td>
                            <td><shiro:principal property="nickname"/></td>
                            <td><button class="btn btn-sm btn-primary"><span>修改</span></button></td>
                        </tr>
                        <tr>
                            <td>排名</td>
                            <td><shiro:principal property="rank"/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>用户名</td>
                            <td><shiro:principal property="username"/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>密码</td>
                            <td>******</td>
                            <td><button class="btn btn-sm btn-primary"><span>修改</span></button></td>
                        </tr>
                        <tr>
                            <td>通过数</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>通过率</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>题解数</td>
                            <td></td>
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</nav>
<script>
    function get_submissions() {
        let uid = '<shiro:principal property="uid"/>';
        $.ajax({
            url:"${APP_PATH}/mySubmissions.do",
            data:"uid="+uid,
            type:"GET",
            success:function (result) {
                if(result.code === 100){
                    alert(result.extend.pageInfo);
                }
            }
        })
    }
    function get_explanations() {
        let uid = '<shiro:principal property="uid"/>';
        $.ajax({
            url:"${APP_PATH}/myExplanations.do",
            data:"uid="+uid,
            type:"GET",
            success:function (result) {
                if(result.code === 100){
                    alert(result.extend.pageInfo);
                }
            }
        })
    }
</script>
</body>
</html>

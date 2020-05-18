<%@ page import="org.springframework.ui.Model" %><%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/4/27
  Time: 8:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<html>
<head>
    <title>header</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
</head>
<body>
<div class="container-fluid" style="margin-top: 5px">
    <div class="col-lg-1 text-left"><a href="index"><h4>首页</h4></a></div>

    <div class="col-lg-1 text-left">
        <shiro:hasRole name="管理员">
        <a href="editProblem"><h4>发布题目</h4></a>
        </shiro:hasRole>
    </div>
    <div class="col-lg-1 text-left">
        <shiro:hasRole name="管理员">
            <%if(request.getAttribute("problem") != null) {%>
            <a href="changeProblem?pid=${problem.pid}"><h4>修改题目</h4></a>
            <% }%>
        </shiro:hasRole>
    </div>
    <div class="col-lg-2 col-lg-offset-3 text-right"><h4>欢迎，<a href="user"><shiro:principal property="nickname"/></a></h4></div>

    <%if(request.getAttribute("problem") != null) {%>
    <div class="col-lg-1 text-center"><a href="editExplanation?pid=${problem.pid}&pn=1"><h4>写题解</h4></a></div>
    <% }%>
    <%if(request.getAttribute("problem") == null) {%>
    <div class="col-lg-1"></div>
    <% }%>

    <%if(request.getAttribute("problem") != null) {%>
    <div class="col-lg-1 text-center"><a href="explanations?pid=${problem.pid}&pn=1"><h4>题解</h4></a></div>
    <% }%>
    <%if(request.getAttribute("problem") == null) {%>
    <div class="col-lg-1"></div>
    <% }%>
    <div class="col-lg-1 text-center"><h4><a href="submissions">提交列表</a></h4></div>
    <div class="col-lg-1 text-center"><h4><a href="logout.do">退出</a></h4></div>
</div>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/5/18
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <title>未授权</title>

</head>
<body>
<h1>无相关权限，返回<a href="index.jsp">首页</a></h1>
</body>
</html>

<%@ page import="cn.sai.entity.Problem" %><%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/4/27
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        Problem problem = (Problem) session.getAttribute("problem");
        pageContext.setAttribute("Problem",problem);
    %>
    <title>题解</title>
    <!-- 引入Jquery -->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <!-- 引入Bootstrap样式 -->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<h1>
    ${problem.title}
</h1>
<p>
    ${explanation.content}
</p>
</body>
</html>

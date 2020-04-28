<%@ page import="cn.sai.entity.SubmissionDto" %><%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/4/28
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>submission</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        SubmissionDto dto = (SubmissionDto) request.getAttribute("dto");
        Integer status = dto.getSubmission().getStatus();
        String statusName;
        switch (status) {
            case 0:statusName = "等待测评";break;
            case 1:statusName = "通过";break;
            default:statusName = "错误";break;
        }
        pageContext.setAttribute("statusName",statusName);
    %>
    <!--导入js库-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<style>
    div.row {
        display: flex;
        align-items: center;
    }
</style>
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center"><a href="problem.do?pid=${dto.problem.pid}"><h1>${dto.problem.title}</h1></a></div>
    </div>
    <div class="row">
        <div class="col-lg-12 text-center"><h3>${dto.user.nickname}</h3></div>
    </div>
    <div class="row">
        <div class="col-lg-12 text-center"><h3>${statusName}</h3></div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3" style="margin-top: 20px">
            <pre style="font-size: medium">${dto.submission.code}</pre>
        </div>
    </div>
</div>
</body>
</html>
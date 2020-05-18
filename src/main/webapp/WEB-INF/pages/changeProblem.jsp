<%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/5/18
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <title>修改题目</title>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <!-- 引入Bootstrap样式 -->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="col-lg-6 col-lg-offset-3 text-center" style="margin-top: 30px">
        <h1>修改题目</h1>
    </div>
    <form role="form" class="col-lg-6 col-lg-offset-3" style="margin-top: 30px" action="${APP_PATH}/changeProblem.do?pid=${problem.pid}" method="post">
        <div class="form-group">
            <%--            <label for="title_input">题目</label>--%>
            <input id="title_input" name="title" type="text" class="form-control" value="${problem.title}" placeholder="题目">

        </div>
        <div class="form-group" >
            <%--            <label for="timeLimit_input">时间限制</label>--%>
            <input id="timeLimit_input" name="timeLimit" type="text" class="form-control" value="${problem.timeLimit}" placeholder="时间限制">
        </div>
        <div class="form-group" >
            <%--            <label for="memoryLimit_input">空间限制</label>--%>
            <input id="memoryLimit_input" name="memoryLimit" type="text" class="form-control" value="${problem.memoryLimit}" placeholder="空间限制">
        </div>
        <div class="form-group" >
            <%--            <label for="description_input">描述</label>--%>
            <%--            <input id="description_input" name="description" type="text" style="height: 100px" class="form-control" placeholder="描述">--%>
            <textarea class="form-control" name="description" cols="10"  placeholder="题目描述">${problem.description}</textarea>
        </div>
        <div class="form-group" >
            <%--            <label for="input_input">输入</label>--%>
            <textarea class="form-control" name="input" cols="10"  placeholder="输入">${problem.input}</textarea>
        </div>
        <div class="form-group" >
            <%--            <label for="output_input">输出</label>--%>
            <textarea class="form-control" name="output" cols="10" placeholder="输出">${problem.output}</textarea>
        </div>

        <span class="help-block has-error">${msg}</span>

        <div class="col-lg-8 col-lg-offset-2">
            <button class="btn btn-primary btn-block" type="submit" id="submit_btn" style="margin-top: 20px">发布</button>
        </div>
    </form>

</div>
</body>
</html>

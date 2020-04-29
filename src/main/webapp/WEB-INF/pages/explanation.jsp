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

<script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
<script src="${APP_PATH}/static/editor/lib/marked.min.js"></script>
<script src="${APP_PATH}/static/editor/lib/prettify.min.js"></script>
<script src="${APP_PATH}/static/editor/lib/raphael.min.js"></script>
<script src="${APP_PATH}/static/editor/lib/underscore.min.js"></script>
<script src="${APP_PATH}/static/editor/lib/sequence-diagram.min.js"></script>
<script src="${APP_PATH}/static/editor/lib/flowchart.min.js"></script>
<script src="${APP_PATH}/static/editor/lib/jquery.flowchart.min.js"></script>
<script src="${APP_PATH}/static/editor/editormd.js"></script>

<body>
<h1 class="text-center">
    ${problem.title}
</h1>
<div class="container">
<div id="test-editormd-view" class="col-lg-6 col-lg-offset-3">
        <textarea style="display:none;" name="test-editormd-markdown-doc">${explanation.content}</textarea>
</div>
</div>
<script type="text/javascript">
    var testEditormdView2;
    $(function(){
        testEditormdView2 = editormd.markdownToHTML("test-editormd-view", {
            htmlDecode      : "style,script,iframe",  // you can filter tags decode
            emoji           : true,
            taskList        : true,
            tex             : true,  // 默认不解析
            flowChart       : true,  // 默认不解析
            sequenceDiagram : true,  // 默认不解析
    });});
</script>
</body>
</html>

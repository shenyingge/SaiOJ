<%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/4/26
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>

    <title>problem</title>
    <!--导入js库-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="http://cdn.bootcss.com/ace/1.2.4/ace.js"></script>
    <script src="http://cdn.bootcss.com/ace/1.2.4/ext-language_tools.js"></script>
    <script src="http://cdn.bootcss.com/ace/1.2.4/ext-old_ie.js"></script>

</head>

<body>
<jsp:include page="header.jsp"/>
<div class="container-fluid">
    <div class="col-lg-4">

        <h1>${problem.title}</h1>
        <div>
            <p>时间限制：${problem.timeLimit}ms</p>
            <p>内存限制：${problem.memoryLimit}MB</p>
        </div>
        <p style="font-size: large; line-height:inherit">
           ${problem.description}
        </p>
    </div>
    <div class="col-lg-8 " style=" margin-top: 10px">
        <!--代码输入框（注意请务必设置高度，否则无法显示）-->
        <pre id="code" class="ace_editor" style="min-height:400px"><textarea class="ace_text-input"></textarea></pre>
        <div class="container-fluid">
            <div class="col-lg-1">
                <select id="language_select" class="btn btn-default dropdown-toggle">
                    <option class="btn btn-default" value="c_cpp">c_cpp</option>
                    <option class="btn btn-default" value="java">java</option>
                    <option class="btn btn-default" value="javascript">javascript</option>
                    <option class="btn btn-default" value="go">go</option>
                    <option class="btn btn-default" value="python">python</option>
                </select>
            </div>
            <div class="col-lg-1 col-lg-offset-10">
                <button id="submit_btn" class="btn btn-primary">提交</button>
            </div>
        </div>
        <div class="container-fluid">

        </div>
    </div>
</div>
<script>
    $('#language_select').change(function () {
        editor.session.setMode("ace/mode/" + $('#language_select').val());
    })
    //初始化对象
    editor = ace.edit("code");
    editor.$blockScrolling = Infinity;
    //设置风格和语言（更多风格和语言，请到github上相应目录查看）
    theme = "crimson_editor"
    language = $("#language_select").val();
    editor.setTheme("ace/theme/" + theme);
    editor.session.setMode("ace/mode/" + language);
    editor.setFontSize(16);

    //设置只读（true时只读，用于展示代码）
    editor.setReadOnly(false);

    //自动换行,设置为off关闭
    editor.setOption("wrap", "free")

    //启用提示菜单
    ace.require("ace/ext/language_tools");
    editor.setOptions({
        enableBasicAutocompletion: true,
        enableSnippets: true,
        enableLiveAutocompletion: true
    });
</script>

</body>
</html>

<%@ page import="cn.sai.entity.Problem" %><%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/4/29
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
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
        <meta charset="utf-8" />
        <title>Full example - Editor.md examples</title>
        <link rel="stylesheet" href="${APP_PATH}/static/css/style.css" />
        <link rel="stylesheet" href="${APP_PATH}/static/editor/css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
<body>
<div id="layout" class="container">
    <div id="mdEditor" class="editormd" style="min-height: 500px">
        <textarea class="editormd-markdown-textarea" name="markdown-area" id="editmd" style="display:none;"># 请输入标题</textarea>
        <textarea class="editormd-html-textarea" name="editorhtml" id="editorhtml"></textarea>
    </div>
</div>
<script src="${APP_PATH}/static/editor/editormd.js"></script>
<script src="${APP_PATH}/static/editor/jquery.min.js"></script>
<script type="text/javascript">
    var editor;
    $(function () {
        editor = editormd("mdEditor", {
            width: "90%",
            height: 640,
            syncScrolling: "single",
            path: "${APP_PATH}/static/editor/lib/",
            emoji:true,
            saveHTMLToTextarea : true,
            toolbarIcons : function() {
                // Or return editormd.toolbarModes[name]; // full, simple, mini
                // Using "||" set icons align right.
                return ["undo", "redo", "|", "bold","del", "italic","quote","ucwords","|","h1","h2","h3","|","list-ul","list-ol","hr", "|","link","code","table","|", "preview", "watch",  "fullscreen","||","push"]
            },
            toolbarIconsClass : {
                push : ""  // 指定图标类
            },
            toolbarIconTexts : {
                push : "提交"  // 如果没有图标，则可以这样直接插入内容，可以是字符串或HTML标签
            },
            toolbarHandlers : {
                /**
                 * @param {Object}      cm         CodeMirror对象
                 * @param {Object}      icon       图标按钮jQuery元素对象
                 * @param {Object}      cursor     CodeMirror的光标对象，可获取光标所在行和位置
                 * @param {String}      selection  编辑器选中的文本
                 */
                push : function(cm, icon, cursor, selection) {
                    let uid = '<shiro:principal property="uid"/>';
                    let pid = '<%=((Problem) session.getAttribute("problem")).getPid()%>'
                    let content = $("#editmd").val();
                    confirm("确定要提交吗？");
                    $.ajax({
                        url: "${APP_PATH}/saveExplanation",
                        data:"uid="+uid+"&pid="+pid+"&content="+content,
                        method:"post",
                        success:function (result) {
                            if(result.code === 100){
                                alert("提交成功");
                                window.location.href="${APP_PATH}/explanation.do?eid="+result.extend.eid;
                            }else alert("失败");
                        }
                    });
                }
            },
        });
    });
</script>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/4/28
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>submissions</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
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
<!-- 搭建显示页面 -->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12 text-center">
            <h1>提交列表</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table id="submissions_table" class="table table-hover">
                <thead>
                <tr>
                    <th width="20%" style="text-align: center;">时间</th>
                    <th width="20%" style="text-align: center;">序号</th>
                    <th width="20%" style="text-align: center;">题目</th>
                    <th width="20%" style="text-align: center;">状态</th>
                    <th width="20%" style="text-align: center;">作者</th>
                </tr>
                </thead>
                <tbody id="submissions_body">

                </tbody>
            </table>
        </div>
    </div>
    <!-- 分页信息 -->
    <div class="row navbar-fixed-bottom" >
        <!-- 文字分页信息  -->
        <div id="page_info_area" class="col-lg-4 col-lg-offset-1">
        </div>
        <!-- 分页条信息 -->
        <div id="page_nav_area" class="col-lg-5 col-lg-offset-2">
        </div>
    </div>
</div>
<script type="text/javascript">

    var totalRecord, currentPage;

    //1、页面加载完成之后，直接去发送ajax请求，要到分页数据
    $(function(){
        to_page(1);
    });

    //点击页码跳转
    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/submissions.do",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                //console.log(result);
                //1、解析并显示题解数据
                build_submission_table(result);
                //2、解析并显示分页数据
                build_page_info(result);
                //3、解析并显示分页条
                build_page_nav(result);
            }
        });
    }

    //显示表格数据
    function build_submission_table(result) {
        //清空表格
        $("#submissions_table tbody").empty();

        let submissionsDto = result.extend.pageInfo.list;
        $.each(submissionsDto,function (index,item) {
            let time = item.submission.dateTime;
            let sid = item.submission.sid;
            let pid = item.problem.pid;
            let status = item.submission.status;
            let statusName;
            switch (status) {
                case 0:statusName = "等待测评";break;
                case 1:statusName = "通过";break;
                default:statusName = "错误";break;
            }
            let timeTd = $("<td width='20%' style='text-align: center;'></td>").append(time);
            let sidTd =  $("<td width='20%' style='text-align: center;'></td>").append('<a href="submission.do?sid='+sid+'">'+sid+'</a>');
            let pidTd =  $("<td width='20%' style='text-align: center;'></td>").append('<a href="problem.do?pid='+pid+'">'+pid+'</a>');
            let statusTd=$("<td width='20%' style='text-align: center;'></td>").append(statusName);
            let userTd = $("<td width='20%' style='text-align: center;'></td>").append(item.user.nickname);
            $("<tr></tr>")
                .append(timeTd)
                .append(sidTd)
                .append(pidTd)
                .append(statusTd)
                .append(userTd)
                .appendTo("#submissions_table tbody");
        });
    }

    //显示分页信息
    function build_page_info(result) {
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
        $('#page_info_area').empty();
        $('#page_info_area').append("当前"+currentPage+"页，共"+result.extend.pageInfo.pages+"页，共"+totalRecord+"条记录");
    }

    //显示分页条，添加点击事件
    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页")).attr("href","#");
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.pageNum === 1){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else {
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum-1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页")).attr("href","#");
        if(result.extend.pageInfo.pageNum === result.extend.pageInfo.pages){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum+1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum === item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        //$("#page_nav_area").append(navEle);
        navEle.appendTo("#page_nav_area");
    }

</script>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/4/22
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<html>
<head>
    <title>index</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <!-- 引入Jquery -->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <!-- 引入Bootstrap样式 -->
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
        <div class="col-md-12">
            <h1>SaiOJ</h1>
        </div>
    </div>
    <!-- 表格 -->
    <div class="row">
        <div class="col-md-12">
            <table id="problems_table" class="table table-hover">
                <thead>
                <tr>
                    <th width="15%" style="text-align: center;">#</th>
                    <th width="35%" style="text-align: center;">题目</th>
                    <th width="25%" style="text-align: center;">题解</th>
                    <th width="25%" style="text-align: center;">通过率</th>
                </tr>
                </thead>
                <tbody id="problems_body">

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
        <div id="page_nav_area" class="col-lg-3 col-lg-offset-4">
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
            url:"${APP_PATH}/problems",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                //console.log(result);
                //1、解析并显示员工数据
                build_problem_table(result);
                //2、解析并显示分页数据
                build_page_info(result);
                //3、解析并显示分页条
                build_page_nav(result);
            }
        });
    }

    //显示表格数据
    function build_problem_table(result) {

        //清空表格
        $("#problems_table tbody").empty();

        var problems = result.extend.pageInfo.list;
        $.each(problems,function (index,item) {
            var pidTd = $("<td width='15%' style='text-align: center;'></td>").append(item.problem.pid);
            var titleTd = $("<td width='35%' style='text-align: center;'></td>").append('<a href="problem.do?pid='+item.problem.pid+'">'+item.problem.title+'</a>');
            var explanationCountTd = $("<td width='25%' style='text-align: center;'></td>").append(item.explanations.length);
            var acRateTd = $("<td width='25%' style='text-align: center;'></td>").append(item.problem.acRate);

            $("<tr></tr>")
                .append(pidTd)
                .append(titleTd)
                .append(explanationCountTd)
                .append(acRateTd)
                .appendTo("#problems_table tbody");
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

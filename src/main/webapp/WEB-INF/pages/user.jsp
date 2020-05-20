<%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/4/27
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>用户</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<style>

    .table thead th{
        vertical-align: middle;
        height: 40px;
        max-height: 40px;
    }

    .table tbody tr td{
        vertical-align: middle;
        height: 50px;
        max-height: 50px;
    }

     div.row {
         display: flex;
         align-items: center;
     }
</style>

<div class="container" style="margin-top: -5px">
    <div class="col-lg-3" style="margin-top: -10px">
        <h1><shiro:principal property="nickname"/></h1>
        <h4><shiro:principal property="username"/></h4>
        <h4>排名：<shiro:principal property="rank"/></h4>
    </div>
</div>
<nav id="nav" class="navbar navbar-default" role="navigation">
    <div class="container" >
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="${APP_PATH}/user">个人信息</a></li>
                <li><a href="javascript:void(0);"onclick="to_mySubmissions()">提交记录</a></li>
                <li><a href="javascript:void(0);"onclick="get_explanations()">我的题解</a></li>
                <shiro:hasRole name="管理员">
                    <li><a>用户管理</a></li>
                    <li><a>题目管理</a></li>
                    <li><a>数据查看</a></li>
                </shiro:hasRole>
            </ul>
        </div>
    </div>
</nav>

<div class="container" style="margin-top: -20px">
    <div id="content">
        <div class="row">
            <div class="col-md-12">
                <table id="table_area" class="table table-hover">
                    <thead></thead>
                    <tbody>
                    <tr>
                        <td>昵称</td>
                        <td><shiro:principal property="nickname"/></td>
                        <td><button class="btn btn-sm btn-primary"><span>修改</span></button></td>
                    </tr>
                    <tr>
                        <td>排名</td>
                        <td><shiro:principal property="rank"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>用户名</td>
                        <td><shiro:principal property="username"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td>******</td>
                        <td><button class="btn btn-sm btn-primary"><span>修改</span></button></td>
                    </tr>
                    <tr>
                        <td>通过数</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>通过率</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>题解数</td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div id="bottom" class="row navbar-fixed-bottom" >
        <!-- 文字分页信息  -->
        <div id="page_info_area" class="col-lg-4 col-lg-offset-1">
        </div>
        <!-- 分页条信息 -->
        <div id="page_nav_area" class="col-lg-5 col-lg-offset-2">
        </div>
    </div>
</div>



<script>

    var totalRecord, currentPage;

    function pageContent() {

    }

    function to_mySubmissions() {
        $("li").removeClass();
        $("li:eq(1)").addClass("active");
        $("#table_area thead").empty();
        let time = $("<th width='25%' style='text-align: center;'>时间</th>");
        let sid = $("<th width='25%' style='text-align: center;'>序号</th>");
        let pid = $("<th width='25%' style='text-align: center;'>题目</th>");
        let status = $("<th width='25%' style='text-align: center;'>状态</th>");

        $("#table_area thead").append(time).append(sid).append(pid).append(status);

        get_mySubmissions(1);
    }
    function get_mySubmissions(pn) {
        let uid = '<shiro:principal property="uid"/>';
        $.ajax({
            url:"${APP_PATH}/mySubmissions.do",
            data:"uid="+uid+"&pn="+pn,
            type:"GET",
            success:function (result) {
                if(result.code === 100){
                    //console.log(result);
                    //1、解析并显示员工数据
                    build_mySubmissions_table(result);
                    //2、解析并显示分页数据
                    build_page_info(result);
                    //3、解析并显示分页条
                    build_page_nav(result,"get_mySubmissions");
                }
            }
        })
    }

    //显示表格数据
    function build_mySubmissions_table(result) {

        //清空表格
        $("#table_area tbody").empty();

        var submissions = result.extend.pageInfo.list;

        $.each(submissions,function (index,item) {

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

            let timeTd = $("<td width='25%' style='text-align: center;'></td>").append(time);
            let sidTd =  $("<td width='25%' style='text-align: center;'></td>").append('<a href="submission.do?sid='+sid+'">'+sid+'</a>');
            let pidTd =  $("<td width='25%' style='text-align: center;'></td>").append('<a href="problem.do?pid='+pid+'">'+pid+'</a>');
            let statusTd=$("<td width='25%' style='text-align: center;'></td>").append(statusName);
            $("<tr></tr>")
                .append(timeTd)
                .append(sidTd)
                .append(pidTd)
                .append(statusTd)
                .appendTo("#table_area tbody");
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
    function build_page_nav(result,method) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页")).attr("href","#");
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.pageNum === 1){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else {
            firstPageLi.click(function () {
                eval(method+"(1)");
            });
            prePageLi.click(function () {
                eval(method+"("+result.extend.pageInfo.pageNum-1+")");
                //method(result.extend.pageInfo.pageNum-1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页")).attr("href","#");
        if(result.extend.pageInfo.pageNum === result.extend.pageInfo.pages){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function () {
                eval(method+"("+result.extend.pageInfo.pageNum+"1)");
            });
            lastPageLi.click(function () {
                eval(method+"("+result.extend.pageInfo.pages+")");
            });
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum === item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                eval(method+"("+item+")")
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        //$("#page_nav_area").append(navEle);
        navEle.appendTo("#page_nav_area");
    }




    function get_explanations() {
        let uid = '<shiro:principal property="uid"/>';
        $.ajax({
            url:"${APP_PATH}/myExplanations.do",
            data:"uid="+uid,
            type:"GET",
            success:function (result) {
                if(result.code === 100){
                    alert(result.extend.pageInfo);
                }
            }
        })
    }
</script>
</body>
</html>

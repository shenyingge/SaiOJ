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

<!-- 搭建显示页面 -->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>SaiOJ</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
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
        <div id="page_info_area" class="col-md-6 col-md-offset-1">
        </div>

        <!-- 分页条信息 -->
        <div id="page_nav_area" class="col-md-5">
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
            var titleTd = $("<td width='35%' style='text-align: center;'></td>").append(item.problem.title);
            var explanationCountTd = $("<td width='25%' style='text-align: center;'></td>").append(item.explanations.length);
            var acRateTd = $("<td width='25%' style='text-align: center;'></td>").append(item.problem.acRate);
            /*<button class="btn btn-primary btn-sm">
                 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                 编辑
              </button>
              <button class="btn btn-danger btn-sm">
                 <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                 删除
              </button>
            * */
            // var editBtn = $("<button></button>")
            //     .addClass("btn btn-primary btn-sm edit_btn")
            //     .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //
            // editBtn.attr("edit-id",item.empId);
            //
            // var delBtn = $("<button></button>")
            //     .addClass("btn btn-danger btn-sm delete_btn")
            //     .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");

            /*                $(".edit_btn").click(function () {
                                $("#empUpdateModal form")[0].reset();
                                $("#empUpdateModal").modal({
                                    backdrop:false
                                });
                            });*/

            // var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);

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

    //点击新增按钮弹出模态框
    // $("#emp_add_modal_btn").click(function () {
    //
    //     //清除数据
    //     $("#empAddModal form")[0].reset();
    //
    //     //设置默认性别
    //     $("#gender1_add_input").attr("checked",true);
    //
    //     //发出ajax请求，查出部门信息，显示
    //     getDepts("#dept_add_select");
    //     //弹出模态框
    //     $("#empName_add_input").parent().removeClass("has-success has-error");
    //     $("#email_add_input").parent().removeClass("has-success has-error");
    //     $("#empName_add_input").next().text("");
    //     $("#email_add_input").next().text("");
    //     $("#empAddModal").modal({
    //         backdrop:false
    //     });
    // });

    //查出部门信息
/*    function getDepts(ele) {
        // //清空值
        // $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success:function (result) {
                console.log(result);
                $(ele).empty();
                var depts = result.extend.depts;
                $.each(depts,function (index,item) {
                    var depOption = $("<option></option>").append(item.deptName).prop("value",item.deptId);
                    depOption.appendTo(ele);
                });
            }
        });
    }
*/

</script>
</body>
</html>

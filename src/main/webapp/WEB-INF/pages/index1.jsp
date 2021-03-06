<%--
  Created by IntelliJ IDEA.
  User: shen
  Date: 2020/2/26
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>员工列表</title>
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

    <!-- 员工添加的模态框 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="emp_save_form">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                                <span class="help-block "></span>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@gmail.com">
                                <span class="help-block "></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_add_input" class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="M"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email_add_input" class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <!-- 部门提交只需要部门id -->
                                <select class="form-control" id="dept_add_select" name="dId">

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                    <button type="button" class="btn btn-default" id="emp_save_close" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 员工修改的模态框 -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">员工修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="emp_update_form">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="empName_update_static"></p>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@gmail.com">
                                <span class="help-block "></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_update_input" class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_update_input" value="M"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email_update_input" class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <!-- 部门提交只需要部门id -->
                                <select class="form-control" id="dept_update_select" name="dId">

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="emp_update_btn">保存</button>
                    <button type="button" class="btn btn-default" id="emp_update_close" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>


    <!-- 搭建显示页面 -->
    <div class="container">
        <!-- 标题 -->
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
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
                <table id="emps_table" class="table table-hover">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all"/>
                            </th>
                            <th>#</th>
                            <th>empName</th>
                            <th>gender</th>
                            <th>email</th>
                            <th>deptName</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody id="empName_update_body">

                    </tbody>
                </table>
            </div>
        </div>
        <!-- 分页信息 -->
        <div class="row">
            <!-- 文字分页信息  -->
            <div id="page_info_area" class="col-md-6">

            </div>
            <!-- 分页条信息 -->
            <div id="page_nav_area" class="col-lg-6">

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
                url:"${APP_PATH}/emps",
                data:"pn="+pn,
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    //1、解析并显示员工数据
                    build_emps_table(result);
                    //2、解析并显示分页数据
                    build_page_info(result);
                    //3、解析并显示分页条
                    build_page_nav(result);
                }
            });
        }

        //显示表格数据
        function build_emps_table(result) {

            //清空表格
            $("#emps_table tbody").empty();

            var emps = result.extend.pageInfo.list;
            $.each(emps,function (index,item) {
                var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
                var empEmailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.department.deptName);
                /*<button class="btn btn-primary btn-sm">
                     <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                     编辑
                  </button>
                  <button class="btn btn-danger btn-sm">
                     <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                     删除
                  </button>
                * */
                var editBtn = $("<button></button>")
                    .addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");

                editBtn.attr("edit-id",item.empId);

                var delBtn = $("<button></button>")
                    .addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");

/*                $(".edit_btn").click(function () {
                    $("#empUpdateModal form")[0].reset();
                    $("#empUpdateModal").modal({
                        backdrop:false
                    });
                });*/

                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);

                $("<tr></tr>")
                    .append(checkBoxTd)
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(empEmailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");
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
        $("#emp_add_modal_btn").click(function () {

            //清除数据
            $("#empAddModal form")[0].reset();

            //设置默认性别
            $("#gender1_add_input").attr("checked",true);

            //发出ajax请求，查出部门信息，显示
            getDepts("#dept_add_select");
            //弹出模态框
            $("#empName_add_input").parent().removeClass("has-success has-error");
            $("#email_add_input").parent().removeClass("has-success has-error");
            $("#empName_add_input").next().text("");
            $("#email_add_input").next().text("");
            $("#empAddModal").modal({
                backdrop:false
            });
        });

        //查出部门信息
        function getDepts(ele) {
            // //清空值
            // $(ele).empty();
            $.ajax({
                url:"${APP_PATH}/depts",
                type:"GET",
                success:function (result) {
//                    console.log(result);
                    $(ele).empty();
                    var depts = result.extend.depts;
                    $.each(depts,function (index,item) {
                        var depOption = $("<option></option>").append(item.deptName).prop("value",item.deptId);
                        depOption.appendTo(ele);
                    });
                }
            });
        }

        //校验表单数据
        function validate_add_form(){
            //1、拿到要校验的数据，使用正则表达式
            var empName = $("#empName_add_input").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;

            if(!regName.test(empName)){
                //alert("请正确填写用户名");
                show_validate_msg("#empName_add_input","error","请正确填写用户名")
                return false;
            }else{
                show_validate_msg("#empName_add_input","success","用户名合法✔")
            }

            var empEmail = $("#email_add_input").val();

            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

            if(!regEmail.test(empEmail)){
                //alert("请正确填写邮箱:");
                show_validate_msg("#email_add_input","error","请正确填写邮箱")
                return false;
            }else{
                show_validate_msg("#email_add_input","success","邮箱合法✔")
            }
            return true;
        }

        function show_validate_msg(ele,status,msg){
            //清除状态
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next().text("");
            if("success" == status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error" == status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        $("#empName_add_input").change(function () {
            //发送ajax请求，校验用户名是否可用
            var EmpName = $("#empName_add_input").val();
            $.ajax({
                url:"${APP_PATH}/checkuser",
                method:"POST",
                data:"EmpName="+EmpName,
                success:function (result) {
                    $("#empName_add_input").parent().removeClass("has-success has-error");
                    if(result.code == 100){
                        //alert("可用");
                        $("#empName_add_input").next().text("用户名可用");
                        $("#emp_save_btn").attr("ajax-va","success");
                    }else{
                        //alert("不可用");
                        $("#empName_add_input").next().text(result.extend.va_msg);
                        $("#emp_save_btn").attr("ajax-va","error");
                    }
                }
            })
        });


        //点击保存
        $("#emp_save_btn").click(function () {
            //1、模态框中填写的表单数据提交给服务器进行保存
            //先对提交服务器的数据进行校验
            // if(!validate_add_form()){
            //     return false;
            // }

            //通过ajax-va属性，判断用户名是否重复
            if(this.getAttribute("ajax-va") == "error"){
                return false;
            }

            //2、发送ajax请求保存员工
            $.ajax({
                url:"${APP_PATH}/emp",
                type: "POST",
                data: $("#emp_save_form").serialize(),
                success:function (result) {
                    //alert(result.msg);
                    /*保存成功后
                    * 1、关闭模态框
                    * 2、跳转最后一页
                    * 发送请求，请求最后一页
                    * */
                    if(result.code == 100){
                        $("#empAddModal").modal('hide');
                        to_page(totalRecord);
                    }else {
                        //显示失败信息
                        //console.log(result)
                        if(undefined != result.extend.errorfields.empName){
                            //显示用户名错误信息
                            show_validate_msg("#empName_add_input","error",result.extend.errorfields.empName);
                        }
                        if(undefined != result.extend.errorfields.email){
                            //显示邮箱错误信息
                            show_validate_msg("#email_add_input","error",result.extend.errorfields.email);
                        }
                    }
                }
            });
        });



        //edit按钮无效，在按钮创建之前就绑定了click
        //可以在创建按钮的时候绑定
        //可以使用live（新版已删除）
        //使用on方法替代
        //编辑按钮点击事件
        //单个编辑按钮
        $(document).on("click",".edit_btn",function () {
            //alert("hha");
            //1、查出员工信息，显示员工信息
            //2、查出部门信息，显示部门信息
            $("#empUpdateModal").modal({
                backdrop: false
            })

            //清空
            $("#empUpdateModal form")[0].reset();
            $("#email_update_input").parent().removeClass("has-success has-error");
            $("#email_update_input").next().text("");

            //查部门信息
            getDepts("#dept_update_select");
            //查员工信息
            var id = $(this).attr("edit-id");

            $("#emp_update_btn").attr("edit-id",id);

            getEmp(id);

        });

        //单个删除按钮
        $(document).on("click",".delete_btn",function () {
            //找这个删除按钮所有祖先中的tr，从这里往下找第二个td
            //1、弹出是否确认删除按钮
            var empName = $(this).parents("tr").find("td:eq(2)").text();
            var id = $(this).parents("tr").find("td:eq(1)").text();
            //确认框 confirm
            if(confirm("确认删除["+empName+"]吗？")){
                $.ajax({
                    url:"${APP_PATH}/emp/"+id,
                    type:"DELETE",
                    success:function (result) {
                        if(result.code == 100){
                            alert(result.msg);
                            to_page(currentPage);
                        }
                    }
                })
            }


        })


        function getEmp(id) {
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type: "GET",
                success:function (result) {
                    $("#empUpdateModal form")[0].reset();

                    var emp = result.extend.emp;
                    $("#empName_update_static").text(emp.empName);
                    //input框赋值用value
                    $("#email_update_input").val(emp.email);

                    //选中单选框中的值
                    $("#empUpdateModal input[name=gender]").val([emp.gender]);
                    //选中下拉列表的值
                    $('#dept_update_select').val('');
                    $('#dept_update_select').val([emp.dId]);
                }
            })
        }

        $("#emp_update_btn").click(function () {
            //1、验证邮箱是否合法
            var empEmail = $("#email_update_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(empEmail)){
                show_validate_msg("#email_update_input","error","请正确填写邮箱")
                return false;
            }else{
                show_validate_msg("#email_update_input","success","邮箱合法✔")
            }
            //2、发送ajax请求，保存更新的员工数据
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
                type:"PUT",
                data:$("#empUpdateModal form").serialize(),
                success:function (result) {
                    //alert(result.msg);
                    //1、关闭对话框
                    $("#empUpdateModal").modal("hide");
                    //2、回到本页面
                    to_page(currentPage);
                }
            })

        })


        $("#check_all").click(function () {
            $(".check_item").prop("checked",$(this).prop("checked"));
        })

        $(document).on("click",".check_item",function () {
            //判断当前选中的是不是五个
            //alert($(".check_item:checked").length);
            //$(".check_all").prop("checked");
            var len = $(".check_item:checked").length;
            if(len == $(".check_item").length)$("#check_all").prop("checked",true);
            else if(len == 0)$("#check_all").prop("checked",false);
        })

        //批量删除
        $("#emp_delete_all_btn").click(function () {
            if($(".check_item:checked").length == 0)return;
            var empNames = "";
            var empIds = "";
            $.each($(".check_item:checked"),function () {
                empNames += $(this).parents("tr").find("td:eq(2)").text()+"，";
                empIds += $(this).parents("tr").find("td:eq(1)").text()+"-";
            });
            //var empName = $(".check_item:checked").parents("tr").find("td:eq(2)").text();
            //去除逗号
            empNames = empNames.substring(0,empNames.length-1);
            empIds = empIds.substring(0,empNames.length-1);
            if(confirm("确认删除["+empNames+"]吗？")){
                //发送ajax删除
                $.ajax({
                    url:"${APP_PATH}/emp/"+empIds,
                    type:"DELETE",
                    success:function (result) {
                        if(result.code == 100){
                            to_page(currentPage);
                        }
                    }
                })
            }
        });

    </script>
</body>
</html>

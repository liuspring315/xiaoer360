<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/manager/meta.jsp" %>

    <script src="${resourceUrl}/manager/js/pager.js"></script>
</head>
<body class="skin-blue">
<div class="wrapper">

    <%@ include file="/WEB-INF/views/include/manager/menu.jsp" %>
    <!-- Right side column. Contains the navbar and content of the page -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                用户权限列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">用户权限列表</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <form action="#" id="user_query_form">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title">用户权限一览</h3>

                                <div class="box-tools">
                                    <div class="input-group">

                                        <input type="text" name="userName" id="userName"
                                               class="form-control input-sm pull-right" style="width: 150px;"
                                               placeholder="按用户名搜索">

                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-default" id="user_query_btn"><i
                                                    class="fa fa-search"></i></button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <tr>
                                        <th>#</th>
                                        <th>用户类型</th>
                                        <th>用户名</th>
                                        <th>电子邮箱</th>
                                        <th>姓名</th>
                                        <th>角色</th>
                                        <th>特许权限</th>
                                        <th>操作</th>
                                    </tr>
                                    <tbody id="user_list">

                                    </tbody>
                                </table>

                            </div>
                            <!-- /.box-body -->
                            <div id="div_pager"></div>
                        </div>
                        <!-- /.box -->
                    </div>
                </div>
            </form>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include flush="true" page="/WEB-INF/views/include/manager/footer.jsp"/>

</div>
<!-- ./wrapper -->
<div id="user_permission_modify_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="user_permission_modifyLabel">修改用户的特许权限</h4>
            </div>
            <div class="modal-body">
                <!-- 修改用户的特许权限 -->
                <div   id="user_permission_modify">
                    <p>
                        <input id="user_permission_modify_id" value="" hidden="true">
                        <input id="user_permission_modify_name" value="" hidden="true">
                    </p>
                    <form action="#">
                        <div id="user_permissions_div"></div>
                    </form>
                    <button type="button" onclick="user_permission_modify_submit();">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="user_role_modify_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="mySmallModalLabel">修改用户所属的角色</h4>
            </div>
            <div class="modal-body">
                <!-- 修改用户所属的角色 -->
                <div  id="user_role_modify">
                    <p>
                        <input id="user_role_modify_id" value="" hidden="true">
                        <input id="user_role_modify_name" value="" hidden="true">
                    </p>
                    <form action="#">
                        <div id="user_roles_div"></div>
                    </form>
                    <button type="button" onclick="user_role_modify_submit();">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
   var _r = {};
    var base = ctx + "/manager";
    /*载入用户列表*/
    function loadUsers() {
        $.ajax({
            url: base + "/authority/users",
            data: $("#user_query_form").serialize(),
            dataType: "json",
            type: "POST",
            success: function (re) {
                if (!re.ok) {
                    alert(re.msg);
                    return;
                }
                data = re.data;
                //console.log(data);
                var list_html = "";
                //console.log(data.list);
                for (var i = 0; i < data.list.length; i++) {
                    var user = data.list[i];
                    console.log(user);
                    var pstr = "";
                    for (var j = 0; j < user.permissions.length; j++) {
                        var p = user.permissions[j];
                        if (p.alias)
                            pstr += p.alias;
                        else
                            pstr += p.name;
                        pstr += " ";
                        //console.log(p);
                        if (j > 4 && user.permissions.length > 4) {
                            pstr += " 等" + user.permissions.length + "种权限";
                            break;
                        }
                    }
                    var rstr = "";
                    for (var j = 0; j < user.roles.length; j++) {
                        var r = user.roles[j];
                        if (r.alias)
                            rstr += r.alias;
                        else
                            rstr += r.name;
                        rstr += " ";
                        //console.log(p);
                        if (j > 4 && user.roles.length > 4) {
                            rstr += " 等" + user.roles.length + "种角色";
                            break;
                        }
                    }
                    var tmp = "\n<tr>"
                            +"<td>" + user.id + "</td>"
                            +"<td>" + user.userType + "</td>"
                            +"<td>" + user.userName + "</td>"
                            +"<td>" + user.email + "</td>"
                            +"<td>" + user.lastName + "</td>"
                            + "<td>" + rstr + "</td>"
                            + "<td>" + pstr + "</td>"
                            + "<td> "
                            + " <button type=\"button\" onclick='user_role_update(" + user.id + ");' class='btn btn-default'>修改角色</button> "
                            + " <button type=\"button\" onclick='user_permission_update(" + user.id + ");' class='btn btn-default'>修改特许权限</button> "
                            + "</td>"
                            + "</tr>";
                    list_html += tmp;
                }
                $("#user_list").html(list_html);
                _r._user_roles = data;
                //console.log(window._user_roles);
            }
        });
    }

    function user_role_update(user_id) {
        $.ajax({
            url : base + "/authority/user/fetch/role",
            dataType : "json",
            data : {id:user_id},
            success : function (re) {
                if (re && re.ok) {
                    console.log(re.data);
                    var html = "";
                    var ps = re.data.roles;
                    for (var i = 0; i < ps.length; i++) {
                        var p = ps[i];
                        var flag = false;
                        for (var j = 0; j < re.data.user.roles.length; j++) {
                            if (re.data.user.roles[j].id == p.id) {
                                flag = true;
                                break;
                            }
                        }
                        if (p.alias) {
                            html += p.alias;
                        } else {
                            html += p.name;
                        }
                        if (flag) {
                            html += "<input type='checkbox' t='checkbox_user_role' pid='" + p.id + "' checked='true'><br>"
                        } else {
                            html += "<input type='checkbox' t='checkbox_user_role' pid='" + p.id + "'><br>"
                        }
                    }
                    $("#user_role_modify_id").val(""+user_id);
                    $("#user_role_modify_name").val(""+re.data.user.name);
                    $("#user_roles_div").html(html);
                    $('#user_role_modify_modal').modal('show');
                }
            }
        });
    };
    function user_role_modify_submit() {
        var user_id = $("#user_role_modify_id").val();
        var ps = $("input[t='checkbox_user_role']:checked");
        console.log(ps);
        console.log(user_id);
        var pids = [];
        ps.each(function(i, p_input) {
            pids.push($(p_input).attr("pid"));
        });
        $.ajax({
            url : base + "/authority/user/update",
            type : "POST",
            data : JSON.stringify({"user":{id:user_id}, "roles":pids}),
            success : function() {
                loadUsers();
                $('#user_role_modify_modal').modal('hide');
            }
        });
    }
    function user_permission_update(user_id) {
       $.ajax({
           url : base + "/authority/user/fetch/permission",
           dataType : "json",
           data : {id:user_id},
           success : function (re) {
               if (re && re.ok) {
                   console.log(re.data);
                   var html = "";
                   var ps = re.data.permissions;
                   for (var i = 0; i < ps.length; i++) {
                       var p = ps[i];
                       var flag = false;
                       for (var j = 0; j < re.data.user.permissions.length; j++) {
                           if (re.data.user.permissions[j].id == p.id) {
                               flag = true;
                               break;
                           }
                       }
                       if (p.alias) {
                           html += p.alias;
                       } else {
                           html += p.name;
                       }
                       if (flag) {
                           html += "<input type='checkbox' t='checkbox_user_permission' pid='" + p.id + "' checked='true'><br>"
                       } else {
                           html += "<input type='checkbox' t='checkbox_user_permission' pid='" + p.id + "'><br>"
                       }
                   }
                   $("#user_permission_modify_id").val(""+user_id);
                   $("#user_permission_modify_name").val(""+re.data.user.name);
                   $("#user_permissions_div").html(html);
                   $('#user_permission_modify_modal').modal('show');
               }
           }
       });
   };
   function user_permission_modify_submit() {
       var user_id = $("#user_permission_modify_id").val();
       var ps = $("input[t='checkbox_user_permission']:checked");
       console.log(ps);
       console.log(user_id);
       var pids = [];
       ps.each(function(i, p_input) {
           pids.push($(p_input).attr("pid"));
       });
       $.ajax({
           url : base + "/authority/user/update",
           type : "POST",
           data : JSON.stringify({"user":{id:user_id}, "permissions":pids}),
           success : function() {
               loadUsers();
               $('#user_permission_modify_modal').modal('hide');
               loadUsers();
           }
       });
   };
    $(function () {
        loadUsers();
        $("#user_query_btn").click(function () {
            loadUsers();
        });

    });

</script>
</html>
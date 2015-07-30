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
        角色列表</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">角色列表</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <form action="#" id="role_query_form">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-xs-12">
            <div class="box">
              <div class="box-header">
                <h3 class="box-title">角色一览</h3>

                <div class="box-tools">
                  <div class="input-group">

                    <input type="text" name="userName" id="userName"
                           class="form-control input-sm pull-right" style="width: 150px;"
                           placeholder="按角色名称搜索">

                    <div class="input-group-btn">
                      <button class="btn btn-sm btn-default" id="role_query_btn"><i
                              class="fa fa-search"></i></button>
                      <button onclick="role_add();" class="btn btn-default">新增角色</button>
                    </div>

                  </div>
                </div>
              </div>
              <!-- /.box-header -->
              <div class="box-body table-responsive no-padding">
                <table class="table table-hover">
                  <tr>
                    <th>#</th>
                    <th>角色</th>
                    <th>别称</th>
                    <th>描述</th>
                    <th>权限</th>
                    <th>操作</th>
                  </tr>
                  <tbody id="role_list">

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
<div id="role_permission_modify_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" id="user_permission_modifyLabel">修改角色所拥有的权限</h4>
      </div>
      <div class="modal-body">
        <!-- 修改角色所拥有的权限 -->
        <div id="role_permission_modify">
          <p>
            <input id="role_permission_modify_id" value="" hidden="true">
            <input id="role_permission_modify_name" value="" hidden="true">
          </p>
          <form action="#">
            <div id="role_permissions_div"></div>
          </form>
          <button type="button"  onclick="role_permission_modify_submit();">提交</button>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="role_modify_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" id="role_modifyLabel">修改角色的一般属性</h4>
      </div>
      <div class="modal-body">
        <!-- 修改角色的一般属性,如别称,描述 -->
        <div  id="role_modify">
          <div style="display: none;">
            <input name="role_modify_id" id="role_modify_id">
          </div>
          <div>
            <div class="md-text-field has-float-label">
              <label>别名</label>
              <input type="text" id="role_modify_alias" name="alias" nm="别名" value="">

            </div>
          </div>
          <div>
            <div class="md-text-field has-float-label">
              <label>描述</label>
              <input type="text" id="role_modify_description" name="description" nm="描述" value="">
            </div>
          </div>
          <div>
            <button class="md-button raised-button is-primary" type="submit" onclick="role_update_submit();">
              <span class="md-button-label">修改</span>
            </button>
            <button class="md-button raised-button is-primary" type="submit" onclick="$('#role_modify_modal').modal('hide');">
              <span class="md-button-label">取消</span>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
  var _r = {};
  var base = ctx + "/manager";
  /*载入角色列表*/
  function loadRoles() {
    $.ajax({
      url : base + "/authority/roles",
      data : $("#role_query_form").serialize(),
      dataType : "json",
      type : "POST",
      success : function(re) {
        if (!re.ok) {
          alert(re.msg);
          return;
        }
        data = re.data;
        console.log(data);
        var list_html = "";
        //console.log(data.list);
        for (var i=0;i<data.list.length;i++) {
          var role = data.list[i];
          var pstr = "";
          for (var j=0;j<role.permissions.length;j++) {
            var p = role.permissions[j];
            if (p.alias)
              pstr += p.alias;
            else
              pstr += p.name;
            pstr += " ";
            console.log(p);
            if (j > 4 && role.permissions.length > 4) {
              pstr += " 等" + role.permissions.length + "种权限";
              break;
            }
          }
          var tmp = "\n<tr>"
                  +"<td>" + role.id + "</td>"
                  +"<td>" + role.name + "</td>"
                  +"<td>" + (role.alias ? role.alias : "" ) + "</td>"
                  +"<td></td>"
                  +"<td>" + pstr + "</td>"
                  +"<td> "
                  +"<button type=\"button\" onclick='role_update(" + role.id +");' class='btn btn-default'>修改描述</button> "
                  +"<button type=\"button\" onclick='role_permission_update(" + role.id +");' class='btn btn-default'>修改权限</button> "
                  +"<button type=\"button\" onclick='role_delete(" + role.id +");' class='btn btn-default'>删除</button> "
                  +"</td>"
                  + "</tr>";
          list_html += tmp;
        }
        $("#role_list").html(list_html);
        _r._roles = data;
        //console.log(window._user_roles);
      }
    });
  };
  // 角色相关的操作
  /*更新角色的一般属性,显示所需要的输入框*/
  function role_update(role_id) {
    for (var i=0;i<_r._roles.list.length;i++) {
      var role = _r._roles.list[i];
      if (role.id == role_id) {
        $("#role_modify_id").attr("value", role_id);
        $("#role_modify_alias").attr("value", role.alias);
        $("#role_modify_description").attr("value", role.description);
        $("#role_modify_modal").modal('show');
        return;
      }
    };
  };
  /*将角色的一般属性的修改发送到服务器进行修改*/
  function role_update_submit() {
    var role_id = $("#role_modify_id").val();
    var p = {id:role_id};
    p["alias"] = $("#role_modify_alias").val();
    p["description"] = $("#role_modify_description").val();
    console.log(p);
    $.ajax({
      url : base + "/authority/role/update",
      type : "POST",
      data : JSON.stringify({"role":p}),
      success : function() {
        loadRoles();
        $("#role_modify_modal").modal('show');
      }
      // TODO 处理异常
    });
  };
  /*删除一个角色*/
  function role_delete(role_id) {
    // TODO 提示用户确认
    $.ajax({
      url : base + "/authority/role/delete",
      type : "POST",
      data : JSON.stringify({id:role_id})
    });
    loadRoles();
  };
  /*新增角色*/
  function role_add() {
    var role_name = prompt("请输入新角色的名称,仅限英文字母,长度3到10个字符");
    var re = /[a-zA-Z]{3,10}/;
    if (role_name && re.exec(role_name)) {
      $.ajax({
        url : base + "/authority/role/add",
        type : "POST",
        data : JSON.stringify({name:role_name}),
        success : function () {
          loadRoles();
        }
      });
    }
  };
  /*更新角色所拥有的权限列表,这个方法用于显示多选框*/
  function role_permission_update(role_id) {
    $.ajax({
      url : base + "/authority/role/fetch",
      dataType : "json",
      data : {id:role_id},
      success : function (re) {
        if (re && re.ok) {
          console.log(re.data);
          var html = "";
          var ps = re.data.permissions;
          for (var i = 0; i < ps.length; i++) {
            var p = ps[i];
            var flag = false;
            for (var j = 0; j < re.data.role.permissions.length; j++) {
              if (re.data.role.permissions[j].id == p.id) {
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
              html += "<input type='checkbox' t='checkbox_role_permission' pid='" + p.id + "' checked='true'><br>"
            } else {
              html += "<input type='checkbox' t='checkbox_role_permission' pid='" + p.id + "'><br>"
            }
          }
          $("#role_permission_modify_id").val(""+role_id);
          $("#role_permission_modify_name").val(""+re.data.role.name);
          $("#role_permissions_div").html(html);
          $("#role_permission_modify_modal").modal('show');
        }
      }
    });
  };
  /*将角色的权限列表提交到服务器去*/
  function role_permission_modify_submit() {
    var role_id = $("#role_permission_modify_id").val();
    var ps = $("input[t='checkbox_role_permission']:checked");
    console.log(ps);
    console.log(role_id);
    var pids = [];
    ps.each(function(i, p_input) {
      pids.push($(p_input).attr("pid"));
    });
    $.ajax({
      url : base + "/authority/role/update",
      type : "POST",
      data : JSON.stringify({"role":{id:role_id}, "permissions":pids}),
      success : function() {
        loadRoles();
        $("#role_permission_modify_modal").modal('hide');
      }
    });
  }
  $(function () {
    loadRoles();
    $("#role_query_btn").click(function () {
      loadRoles();
    });

  });

</script>
</html>
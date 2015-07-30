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
        权限列表</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">权限列表</li>
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
                <h3 class="box-title">权限一览</h3>

                <div class="box-tools">
                  <div class="input-group">

                    <input type="text" name="userName" id="userName"
                           class="form-control input-sm pull-right" style="width: 150px;"
                           placeholder="按权限名称搜索">

                    <div class="input-group-btn">
                      <button class="btn btn-sm btn-default" id="permissions_query_btn"><i
                              class="fa fa-search"></i></button>
                      <button type="button" onclick="permission_add();" class="btn btn-default">新增</button>
                    </div>

                  </div>
                </div>
              </div>
              <!-- /.box-header -->
              <div class="box-body table-responsive no-padding">
                <table class="table table-hover">
                  <tr>
                    <th>#</th>
                    <th>权限</th>
                    <th>菜单</th>
                    <th>别称</th>
                    <th>描述</th>
                    <th>操作</th>
                  </tr>
                  <tbody id="permission_list">

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
<div id="permission_modify_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" id="role_permission_modifyLabel">修改权限的一般属性</h4>
      </div>
      <div class="modal-body">
        <!-- 修改权限的一般属性 -->
        <div id="permission_modify">
          <div style="display: none;">
            <input name="permission_modify_id" id="permission_modify_id">
          </div>
          <div>
          <div class="md-text-field has-float-label">
            <label>别名</label>
            <input type="text" id="permission_modify_alias" name="alias" nm="别名" value="">
          </div>
        </div>
          <div>
            <div class="md-text-field has-float-label">
              <label>菜单</label>
              <select id="permission_modify_ismenu">
                <option value="false">false</option>
                <option value="true">true</option>
              </select>
            </div>
          </div>
          <div>
            <div class="md-text-field has-float-label">
              <label>描述</label>
              <input type="text" id="permission_modify_description" name="description" nm="描述" value="">
            </div>
          </div>
          <div>
            <button class="md-button raised-button is-primary" type="submit" onclick="permission_update_submit();">
              <span class="md-button-label">修改</span>
            </button>
            <button class="md-button raised-button is-primary" type="submit" onclick="$('#permission_modify_modal').modal('hide');">
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
  /*载入权限列表*/
  function loadPermissions(pageNumber,pageSize) {
      var postdata = $("#role_query_form").serializeArray ();
      if(pageNumber){
          postdata.push({name: 'pageNumber', value: pageNumber});
          postdata.push({name: 'pageSize', value: pageSize});
      }
      console.debug(postdata);
    $.ajax({
      url : base + "/authority/permissions",
      data : postdata,
      dataType : "json",
      type : "POST",
      success : function(re) {
        if (!re.ok) {
          alert(re.msg);
          return;
        }
        data = re.data;
        //console.log(data);
        var list_html = "";
        //console.log(data.list);
        for (var i=0;i<data.list.length;i++) {
          var permission = data.list[i];
          var tmp = "\n<tr>"
                  +"<td>" + permission.id + "</td>"
                  +"<td>" + permission.name + "</td>"
                  +"<td>" + permission.ismenu + "</td>"
                  +"<td>" + (permission.alias ? permission.alias : "" ) + "</td>"
                  +"<td>" + (permission.description? permission.description : "") + "</td>"
                  +"<td> "
                  +"<button type=\"button\" onclick='permission_update(" + permission.id +");' class='btn btn-default'>修改</button> "
                  +"<button type=\"button\" onclick='permission_delete(" + permission.id +");' class='btn btn-default'>删除</button> "
                  +"</td>"
                  + "</tr>";
          list_html += tmp;
        }
        $("#permission_list").html(list_html);
        _r._permissions = data;
          $("#div_pager").html(PagerTag.showPagerTag("loadPermissions","permission_query",data.pager));
        //console.log(window._user_roles);
      }
    });
  };
  /*更新权限的一般信息,显示输入框*/
  function permission_update(permission_id) {
    for (var i=0;i<_r._permissions.list.length;i++) {
      var permission = _r._permissions.list[i];
      if (permission.id == permission_id) {
        $("#permission_modify_id").attr("value", permission_id);
        $("#permission_modify_alias").attr("value", permission.alias);
        $("#permission_modify_ismenu").val(permission.ismenu);
        $("#permission_modify_description").attr("value", permission.description);
        $("#permission_modify_modal").modal('show');
        return;
      }
    };
  };
  /*把权限的一般信息的修改提交到服务器*/
  function permission_update_submit() {
    var permission_id = $("#permission_modify_id").val();
    var p = {id:permission_id};
    p["alias"] = $("#permission_modify_alias").val();
    p["ismenu"] = $("#permission_modify_ismenu").val();
    p["description"] = $("#permission_modify_description").val();
    console.log(p);
    $.ajax({
      url : base + "/authority/permission/update",
      type : "POST",
      data : JSON.stringify(p),
      success : function() {
        loadPermissions();
        $("#permission_modify_modal").modal('hide');
      }
    });
  };
  /*删除一个权限*/
  function permission_delete(permission_id) {
    $.ajax({
      url : base + "/authority/permission/delete",
      type : "POST",
      data : JSON.stringify({id:permission_id}),
      success : function() {
        loadPermissions();
        $("#permission_modify").hide();
      }
    });
    loadPermissions();
  };
  /*新增一个权限*/
  function permission_add() {
    var permission_name = prompt("请输入新角色的名词,仅限英文字母/冒号/米号,长度3到30个字符");
    var re = /[a-zA-Z\:\*]{3,10}/;
    if (permission_name && re.exec(permission_name)) {
      $.ajax({
        url : base + "/authority/permission/add",
        type : "POST",
        data : JSON.stringify({name:permission_name}),
        success : function () {
          loadPermissions();
        }
      });
    }
  };
  $(function () {
    loadPermissions();
    $("#permissions_query_btn").click(function () {
      loadPermissions();
    });

  });

</script>
</html>
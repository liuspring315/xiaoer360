<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
                用户列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">用户列表</li>
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
                            <h3 class="box-title">用户一览</h3>
                            <div class="box-tools">
                                <div class="input-group">

                                        <input type="text" name="userName" id="userName" class="form-control input-sm pull-right" style="width: 150px;" placeholder="按用户名搜索">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-default" id="user_query_btn"><i class="fa fa-search"></i></button>
                                        </div>

                                </div>
                            </div>
                        </div><!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th>#</th>
                                    <th>类型</th>
                                    <th>用户名</th>
                                    <th>真实姓名</th>
                                    <th>性别</th>
                                    <th>移动电话</th>
                                    <th>注册时间</th>
                                    <th>启用时间</th>
                                    <th>入住状态</th>
                                    <th width="200px">操作</th>
                                </tr>
                                <tbody id="user_list">

                                </tbody>
                            </table>
                        </div><!-- /.box-body -->
                        <div id="div_pager"></div>
                    </div><!-- /.box -->
                </div>
            </div>
            </form>
        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
    <jsp:include flush="true" page="/WEB-INF/views/include/manager/footer.jsp"/>

</div><!-- ./wrapper -->
<form action="" method="post" id="showConfirmModalForm">
    <input type="hidden" id="personId" name="personId"/>
    <input type="hidden" id="userType" name="userType"/>
</form>
<!-- 对话框 -->
<div class="modal fade" id="photographerModal" tabindex="-1" role="dialog" aria-labelledby="photographerModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="photographerModalLabel">查看</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="inputRealname" class="col-sm-2 control-label">真实姓名</label>
                    <div class="col-sm-4" id="div_lastName">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputSex" class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-1 radio" id="div_gender">

                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">电子邮箱</label>
                    <div class="col-sm-4" id="div_email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputMobile" class="col-sm-2 control-label">手机</label>
                    <div class="col-sm-4" div="div_mobile">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputDate" class="col-sm-2 control-label">出生日期</label>
                    <div class="col-sm-4" id="div_birthday">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputLocation" class="col-sm-2 control-label">所在地</label>
                    <div class="col-sm-4" id="div_placeName">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputMobile" class="col-sm-2 control-label">个人简介</label>
                    <div class="col-sm-8" id="div_introduction">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputMobile" class="col-sm-2 control-label">认证等级</label>
                    <div class="col-sm-8" id="div_authentication">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="authenticationBtn" class="btn btn-primary">初级认证</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="photographerModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">确认</h4>
            </div>
            <div class="modal-body" id="confirmModalMess">
                确认吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="confirmModalBtn" onclick="javascript:confirmModalClick()">确认</button>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var base = ctx + "/manager";
    function user_reload() {
        $.ajax({
            url : base + "/user/query",
            data : $("#user_query_form").serialize(),
            dataType : "json",
            success : function(data) {
                console.log(data);
                var list_html = "";
                console.log(data.list);
                for (var i=0;i<data.list.length;i++) {
                    var user = data.list[i];
                    console.log(user);
                    var tmp = "<tr>"
                            +"<td>" + user.id + "</td>"
                            +"<td>";
                    switch(user.userType){
                        case 0:tmp = tmp + "管理员";break;
                        case 1:tmp = tmp + "会员";break;
                        case 2:tmp = tmp + "摄影师";break;
                        case 3:tmp = tmp + "造型师";break;
                        case 4:tmp = tmp + "摄影机构管理员";break;
                        default :tmp = tmp +  "";
                    }
                    tmp = tmp + "</td>"
                            +"<td>" + user.userName + "</td>"
                            +"<td>" + user.lastName + "</td>"
                            +"<td>" + (user.gender==0?"男":"女") + "</td>"
                            +"<td>" + user.mobile + "</td>"
                            +"<td>" + user.createTime + "</td>"
                            +"<td>" + user.beginTime + "</td>"
                            +"<td>";
                    if(user.userType>1) {
                        switch (user.registerCheckState) {
                            case 1:
                                tmp = tmp + "未审核";
                                break;
                            case 2:
                                tmp = tmp + "批准入驻";
                                break;
                            case 3:
                                tmp = tmp + "否决入驻";
                                break;
                            default :
                                tmp = tmp + "";
                        }
                    }
                    tmp = tmp + "</td>"
                            + "<td>"
                            + "<button type=\"button\" onclick=\"javascript:showPhotographerModal("+user.id+")\">查看</button>"
                            + "<button type=\"button\" onclick='user_update(" + user.id +");'>修改密码</button> "
                            + "<button type=\"button\" onclick='user_delete(" + user.id +");'>删除</button> "
                    if(user.userType>1) {
                        if (user.registerCheckState == 1) {
                            tmp = tmp + "<button type=\"button\" onclick=\"javascript:showConfirmModalModal('2'," + user.userType + "," + user.id + ",'确认批准入住？')\">批准入住</button>"
                                    + "	<button type=\"button\" onclick=\"javascript:showConfirmModalModal('3'," + user.userType + "," + user.id + ",'确认否决入住？')\">否决入住</button>"
                        } else if (user.registerCheckState == 2) {
                            tmp = tmp + "<button type=\"button\" onclick=\"javascript:showConfirmModalModal('4'," + user.userType + "," + user.id + ",'确认账户锁定？')\">账户锁定</button>"
                                    + "<button>保证金变更记录</button>"
                                    + "<button>账户锁定记录</button>"
                        } else if (user.registerCheckState == 3) {
                            tmp = tmp + "<button type=\"button\" onclick=\"javascript:showConfirmModalModal('1'," + user.userType + "," + user.id + ",'确认撤销否决？')\">撤销否决</button>"

                        }
                    }

                    + "</td></tr>";
                    list_html += tmp;
                }
                $("#user_list").html(list_html);
                $("#div_pager").html(PagerTag.showPagerTag("user_reload","user_query_form",data.pager));
            }
        });
    }
    $(function() {
        user_reload();
        $("#user_query_btn").click(function() {
            user_reload();
        });

        $("#authenticationBtn").click(function() {
            $.ajax({
                url : base + "/user/authenticationUpdate",
                data : {"id":$("#authenticationBtn").attr("vid")},
                dataType : "json",
                success : function (data) {
                    if (data.ok) {
                        $('#photographerModal').modal('hide');
                        user_reload();
                        alert("认证成功");
                    } else {
                        alert(data.msg);
                    }
                }
            });
        });

    });
    function user_update(userId) {
        var passwd = prompt("请输入新的密码");
        if (passwd) {
            $.ajax({
                url : base + "/user/update",
                data : {"id":userId,"password":passwd},
                dataType : "json",
                success : function (data) {
                    if (data.ok) {
                        user_reload();
                        alert("修改成功");
                    } else {
                        alert(data.msg);
                    }
                }
            });
        }
    };
    function user_delete(userId) {
        var s = prompt("请输入y确认删除");
        if (s == "y") {
            $.ajax({
                url : base + "/user/delete",
                data : {"id":userId},
                dataType : "json",
                success : function (data) {
                    if (data.ok) {
                        user_reload();
                        alert("删除成功");
                    } else {
                        alert(data.msg);
                    }
                }
            });
        }
    };

    function showPhotographerModal(id){
        $.ajax({
            url : base + "/user/view",
            data : {"id":id},
            dataType : "json",
            success : function (re) {
                if (!re.ok) {
                    alert(re.msg);
                    return;
                }
                var user = re.data;
                $("#div_lastName").html(user.lastName);
                $("#div_gender").html((user.gender==0?"男":"女"));
                $("#div_email").html(user.email);
                $("#div_mobile").html(user.mobile);
                $("#div_birthday").html(user.birthday);
                $("#div_placeName").html(user.dicPlace.placeName);

                if(user.userType==2){
                    $("#div_introduction").html(user.photographerExtra.introduction);
                    $("#div_authentication").html(user.photographerExtra.authentication);
                    $("#authenticationBtn").show();
                    $("#authenticationBtn").attr("vid",id);
                    if(user.authenticationStat == 1) {
                        if (user.photographerExtra.authentication == 0) {
                            $("#authenticationBtn").html("初级认证");
                        } else if (user.photographerExtra.authentication == 1) {
                            $("#authenticationBtn").html("中级认证");
                        } else if (user.photographerExtra.authentication == 2) {
                            $("#authenticationBtn").html("高级认证");
                        } else if (user.photographerExtra.authentication == 3) {
                            $("#authenticationBtn").hide();
                        }
                    }else{
                        $("#authenticationBtn").hide();
                    }

                }else if(user.userType() ==1){
                    $("#div_introduction").html(user.customerExtra.introduction);
                    $("#authenticationBtn").hide();
                }


                $('#photographerModal').modal('show');
            }
        });

    }
    function showConfirmModalModal(action,userType,id,mess){
        $("#confirmModalMess").html(mess);
        $("#confirmModalBtn").attr("vid",id);
        $("#confirmModalBtn").attr("vaction",action);
        $("#confirmModalBtn").attr("vusertype",userType);
        $('#confirmModal').modal('show');
    }
    function confirmModalClick(){
        $('#confirmModal').modal('hide');
        $.ajax({
            url : base + "/user/checkstate/"+$("#confirmModalBtn").attr("vaction")+"/"+$("#confirmModalBtn").attr("vid"),
            dataType : "json",
            success : function (data) {
                if (data.ok) {
                    user_reload();
                    alert("确认成功");
                } else {
                    alert(data.msg);
                }
            }
        });

    }

</script>
</html>
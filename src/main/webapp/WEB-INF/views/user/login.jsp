<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/manager/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/WEB-INF/views/include/manager/meta.jsp" %>
    <script type="text/javascript">
        $(function () {
            $(document).keydown(function(event){
                if(event.keyCode==13){
                    $("#login_button").click();
                }
            });
            // 登陆
            $("#login_button").click(function () {
                // 提交数据
                $.ajax({
                    url: ctx + "/login",
                    type: "POST",
                    data: $('#loginForm').serialize(),
                    error: function (request) {
                        alert(request.responseText);
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data && data.ok) {
                            alert("登陆成功");
                            window.location = ctx + "/manager/main";
                        } else {
                            var emsg = data.msg;
                            alert(emsg);
                        }
                    }
                });
            });

            // 登出
//            $("#logout_button").click(function () {
//                window.location.href = base + "/user/logout"
//            });



        });

    </script>
</head>

<body class="login-page">
<div class="login-box">
    <div class="login-logo">
        <b>小二360</b>
    </div><!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登录</p>
        <form action="#" method="post" id="loginForm">
            <div class="form-group has-feedback">
                <input type="text" value="a1" name="username" id="username" class="form-control" placeholder="用户名">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" value="123456" name="password" id="password" class="form-control" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" id="rememberMe"> 记住我
                        </label>
                    </div>
                </div><!-- /.col -->
                <div class="col-xs-4">
                    <button type="button" id="login_button" class="btn btn-primary btn-block btn-flat">登录</button>
                </div><!-- /.col -->
            </div>
        </form>


        <%--<a href="#">忘记密码</a><br>--%>
        <%--<a href="register.html" class="text-center">Register a new membership</a>--%>

    </div><!-- /.login-box-body -->
</div><!-- /.login-box -->
</body>
</html>
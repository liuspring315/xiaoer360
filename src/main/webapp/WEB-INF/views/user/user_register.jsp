<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/WEB-INF/views/include/meta.jsp" %>
    <script src="${resourceUrl}/js/jquery/jquery.validate.js" type="text/javascript"></script>
    <script src="${resourceUrl}/js/jquery/jquery.metadata.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $.metadata.setType("class");
                $("#userRegisterForm").validate({
                    ignore:".ignore",
                    meta: "validate",
                    focusInvalid: false,
                    invalidHandler: function(form, validator) {
                        validateShowMess(validator);
                    },
                    submitHandler: function(form) {
                        if(!$("#agreeCheckBox").prop("checked")){
                            alert("请阅读并同意注册协议");
                            return false;
                        }
                        // 提交数据
                        $.ajax({
                            url: ctx + "/web/user_register_submit",
                            type: "POST",
                            data: $('#userRegisterForm').serialize(),
                            error: function (request) {
                                alert(request.responseText);
                            },
                            dataType: "json",
                            success: function (data) {
                                if (data && data.ok) {
                                    alert("注册成功");
                                    window.location = ctx + "/login";
                                } else {
                                    var emsg = data.msg;
                                    alert(emsg);
                                }
                            }
                        });
                    }
                });
            });//end ready
        </script>
</head>

<body>
<%@ include file="/WEB-INF/views/include/menu.jsp" %>
<!-- 路径导航 -->
<div class="container">
    <ol class="breadcrumb">
        <li><a href="${ctx}/main">首页</a></li>
        <li class="active">会员注册</li>
    </ol>
</div>


<div class="container marketing">
    <div class="row">
        <div class="col-lg-12 text-center">
            <h2>欢迎成为旅拍者</h2>
            <p>记录生活中精彩的瞬间</p>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-lg-12 text-center">
            <form class="form-horizontal" action="#" method="post" id="userRegisterForm">
                <div class="form-group">
                    <label for="userName" class="col-sm-4 control-label">用户名</label>
                    <div class="col-sm-5">
                        <input type="text" maxlength="30"
                               class="form-control {validate:{required:true,trimstr:true,stringCheck:true,messages:{required:'请输入用户名'}}}" name="userName"
                                    placeholder="可使用英文字符、数字、汉字，最长30字符，必填"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-4 control-label">电子邮箱</label>
                    <div class="col-sm-5">
                        <input type="email" class="form-control {validate:{required:true,trimstr:true,email:true,messages:{required:'请输入邮箱'}}}"
                                    name="email" placeholder="请填写正确邮箱，进行验证，必填"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-4 control-label">密码</label>
                    <div class="col-sm-5">
                        <input type="password" id="password"  maxlength="20" class="form-control {validate:{required:true,trimstr:true,passwordVal:true,rangelength:[6,20],messages:{required:'请输入密码',rangelength:'密码长度应为6-20位'}}}"
                                    name="password" placeholder="设置密码，最少6位，且至少同时包含字母和数字，必填"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password2" class="col-sm-4 control-label">确认密码</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control {validate:{equalTo:'#password',messages:{equalTo:'输入的密码不一致'}}}" id="password2" placeholder="请确认密码，必填"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="agreeCheckBox" name="agreeCheckBox" value=""> 我已阅读并同意
                            </label>
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#bs-photographer-register-modal">
                                注册协议
                            </button>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-5">
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#bs-login">&nbsp;已有帐号？&nbsp;</button>
                    </div>
                    <div class="col-sm-1">
                        <button type="submit" class="btn btn-primary">&nbsp;注册&nbsp;</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row lvpaizhe-margin-bottom">
        <div class="col-sm-12 text-center">
            您想作为<b>摄影师</b>或服务提供者加入我们？请移步<a href="${ctx}/server/register">加盟入驻</a>
        </div>
    </div>
    <!-- Three columns of text below the carousel -->
</div>


<!-- /服务协议提示框 -->
<div class="modal fade" id="bs-photographer-register-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="mySmallModalLabel">注册协议</h4>
            </div>
            <div class="modal-body">
                用户注册服务条款：<br />
                北京旅拍者络科技有限公司（以下简称&quot;旅拍者&quot;）根据以下服务条款为您提供服务。用户在接受旅拍者服务之前，请务必仔细阅读本条款并同意本声明。如您不同意本使用协议及/或随时对其的修改，请您立即停止使用旅拍者所提供的全部服务；您一旦注册并开始使用旅拍者的服务，即视为您已了解并完全同意本使用协议，包括旅拍者对使用协议所做的任何修改，并成为旅拍者用户（以下简称&quot;用户&quot;）。<br />
                &nbsp;<br />
                一.&nbsp;提供的服务<br />
                旅拍者提供用户例如上传图片,填写档案,作品展示,服务发布，内容搜索，文章发布及评论等在线服务。本网站保留随时变更、中断或终止部分或全部旅拍者服务的权利。如因系统升级或维护而需要暂停服务,旅拍者会提前进行通知。<br />
                用户在接受旅拍者各项服务的同时，也同意接受旅拍者提供的各类信息服务，这些服务包括例如文字、图片、音频、视频等的各类信息推荐，该类信息的提供方式包括但不限于电子邮件、短信。若您希望退订来自旅拍者信息推荐的的邮件，可通过回复邮件的方式自行完成退阅。<br />
                &nbsp;<br />
                旅拍者上关于用户或其发布的相关服务（包括但不限于用户或机构名称、联系人及联络方式、产品描述、文字介绍、相关图片视频等）的信息均由用户自行提供，用户依法应对其提供的任何信息承担全部责任及风险。旅拍者在任何情况下不对任何直接、间接、特殊的、意外的、偶然的损害承担赔偿责任。<br />
                二．用户使用条款<br />
                用户在申请使用旅拍者服务时，必须向旅拍者网站提供准确的个人资料，如个人资料有任何变动，必须及时更新。<br />
                用户一旦注册为旅拍者的合法用户，将得到一个密码和用户名，用户对自己的密码和帐号所进行的一切活动负全部责任；由该等活动所导致的任何损失或损害由用户承担，旅拍者不承担任何责任。您可随时根据指示改变您的密码。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告旅拍者。<br />
                用户不得通过旅拍者或旅拍者的服务发送或传播敏感信息和违反国家法律法规政策的信息，此类信息包括但不限于：<br />
                1.&nbsp;违反中国宪法所确定的基本原则的，危害国家安全，损害国家荣誉和利益的，煽动民族情绪<br />
                2.&nbsp;破坏国家宗教政策，宣扬邪教和封建迷信的<br />
                3.&nbsp;侮辱、诽谤、歧视或过分粗俗言语针对包括但不限于：国籍、民族、年龄、身体、精神或智力障碍的<br />
                4.&nbsp;散布谣言、扰乱社会秩序。社会稳定，散步包括但不限于淫秽、色情、暴力、赌博或教唆犯罪的<br />
                5.&nbsp;侵害他人合法权益的，及含有各项法律、行政法规禁止的其他内容的<br />
                6.&nbsp;破坏危害自然环境、历史文化遗迹、传统民风民俗的相关内容<br />
                未成年人的特别注意事项：如果您未满18岁，你不应该使用本网站或输入个人信息，我们也不打算收集18岁以下公民的个人信息。<br />

                *本条款的最终解释权归旅拍者所有<br />
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<jsp:include flush="true" page="/WEB-INF/views/include/footer.jsp"/>

</body>
</html>
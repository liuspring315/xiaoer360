<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/manager/taglibs.jsp" %>
<header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo"><b>小二360后台管理系统</b></a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="${ctx}/manager/avatar" class="user-image" alt="User Image"/>
                        <span class="hidden-xs">${me.lastName}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="${ctx}/manager/avatar" class="img-circle" alt="User Image" />
                            <p>
                                ${me.userName} - ${me.userTypeName}
                                <small>注册于 ${me.createTime}</small>
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="${ctx}/manager/photographer/info" class="btn btn-default btn-flat">个人信息</a>
                            </div>
                            <div class="pull-right">
                                <a href="${ctx}/logout" class="btn btn-default btn-flat">退出登录</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${ctx}/manager/avatar" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
                <p>${me.lastName}</p>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">导航栏</li>

            <c:forEach items="${me.roles}" var ="role">
                <c:forEach items="${role.permissions}" var ="permission" varStatus="status">
                    <c:if test="${permission.ismenu}">
                        <li>
                            <a href="${ctx}${permission.description}">
                                <i class="fa fa-edit"></i>
                                <span>${permission.alias}</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                        </li>
                    </c:if>
                </c:forEach>
            </c:forEach>
            <c:forEach items="${me.permissions}" var ="permission">
                    <c:if test="${permission.ismenu}">
                        <li>
                            <a href="${ctx}${permission.description}">
                                <i class="fa fa-edit"></i>
                                <span>${permission.alias}</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                        </li>
                    </c:if>
            </c:forEach>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/manager/meta.jsp" %>
</head>
<body class="skin-blue">
<div class="wrapper">
    <%@ include file="/WEB-INF/views/include/manager/menu.jsp" %>
    <!-- Right side column. Contains the navbar and content of the page -->
    <div class="content-wrapper">

        <!-- Right side column. Contains the navbar and content of the page -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    404 Error Page
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">Examples</a></li>
                    <li class="active">404 error</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">

                <div class="error-page">
                    <h2 class="headline text-yellow"> 404</h2>
                    <div class="error-content">
                        <h3><i class="fa fa-warning text-yellow"></i> Oops! Page not found.</h3>

                    </div><!-- /.error-content -->
                </div><!-- /.error-page -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </div><!-- /.content-wrapper -->

    <jsp:include flush="true" page="/WEB-INF/views/include/manager/footer.jsp"/>

</div><!-- ./wrapper -->


</body>
</html>
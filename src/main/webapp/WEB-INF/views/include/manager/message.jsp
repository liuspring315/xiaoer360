<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/manager/taglibs.jsp" %>

<c:if test="${not empty message}">
    <script>
        alert("${message}");
    </script>
</c:if>
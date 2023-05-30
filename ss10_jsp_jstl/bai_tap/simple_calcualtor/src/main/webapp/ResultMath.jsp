<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/30/2023
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
Kết Quả Tính Toán
<c:if test="${message == null}">
    ${result}
</c:if>
<c:if test="${message != null}">
    ${message}
</c:if>
</body>
</html>

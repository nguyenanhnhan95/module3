<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/1/2023
  Time: 1:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
Thông tin sản phẩm $
<c:if test="${user!=null}">
    ID : ${user.getId()}<br>
    Name : ${user.getName()}<br>
    Email : ${user.getEmail()}<br>
    Price : ${user.getCountry()}
</c:if>
<c:if test="${user==null}">
    Không tìm thấy người dùng
</c:if>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/31/2023
  Time: 4:02 PM
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
<c:if test="${product!=null}">
    ID : ${product.getId()}<br>
    Name : ${product.getName()}<br>
    Price : ${product.getPrice()}<br>
    Description : ${product.getDescription()}<br>
    Manufacture : ${product.getManufacture()}
</c:if>
<c:if test="${product==null}">
    Không tìm thấy sản phẩm
</c:if>
</body>
</html>

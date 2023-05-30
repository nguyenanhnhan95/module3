<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/30/2023
  Time: 12:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th colspan="5">Danh Sách Khách Hàng</th>
    </tr>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa Chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items="${list}" var="s" varStatus="loop">
        <tr>
            <td>
                <c:out value="${loop.count}"/>
            </td>
            <td>
                <c:out value="${s.name}"/>
            </td>
            <td>
                <c:out value="${s.birthOfDay}"/>
            </td>
            <td>
                <c:out value="${s.address}"/>
            </td>
            <td>
                <img src="${s.imgPass}" style="height: 100px;width: 100px">
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product</h1>
<p>
    <a href="/ProductServlet?action=create">Thêm Sản Phẩm Mới</a>
</p>
<p>
<form method="post" for="search" action="/ProductServlet?action=view">
    <input type="text" name="name" placeholder="Search..">
    <input type="submit" id="search" value="Search">
</form>
</p>
<table>
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Gía</th>
        <th>Miêu Tả</th>
        <th>Hảng Sản Xuất</th>
        <th colspan="2">Action</th>
    </tr>
    <c:forEach items="${listProduct}" var="p">
        <tr>
            <td>
                    ${p.getId()}
            </td>
            <td>
                    ${p.getName()}
            </td>
            <td>
                    ${p.getPrice()}
            </td>
            <td>
                    ${p.getDescription()}
            </td>
            <td>
                    ${p.getManufacture()}
            </td>
            <td>
                <a href="/ProductServlet?action=edit&id=${p.getId()}">Edit</a>
            </td>
            <td>
                <a href="/ProductServlet?action=delete&id=${p.getId()}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

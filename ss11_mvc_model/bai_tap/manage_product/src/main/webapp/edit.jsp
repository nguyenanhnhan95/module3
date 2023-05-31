<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/31/2023
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<form method="post" action="/ProductServlet?action=edit" id="edit-product">
    <fieldset>
        <legend>Edit Product</legend>
        <label for="fid">ID :</label><br>
        <input type="text" id="fid" name="id" value="${product.getId()}" readonly><br>
        <label for="fname">Name :</label><br>
        <input type="text" id="fname" name="name" value="${product.getName()}" readonly><br>
        <label for="lprice">Price :</label><br>
        <input type="text" id="lprice" name="price"><br><br>
        <label for="ldescription">Description :</label><br>
        <input type="text" id="ldescription" name="description"><br>
        <label for="lmanufacture">Manufacture</label><br>
        <input type="text" id="lmanufacture" name="manufacture"><br><br>
        <br>
        <input type="submit" form="edit-product" value="Edit Product">
    </fieldset>
</form>
</body>
</html>

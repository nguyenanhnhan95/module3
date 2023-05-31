<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/31/2023
  Time: 8:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<html>
<head>
    <title>Title</title>

</head>
<body>
<form method="post" action="/ProductServlet?action=create" id="add-product">
    <fieldset>
        <legend>New Product</legend>
        <label for="fid">ID :</label><br>
        <input type="text" id="fid" name="id"><br>
        <label for="fname">Name :</label><br>
        <input type="text" id="fname" name="fname"><br>
        <label for="lprice">Price :</label><br>
        <input type="text" id="lprice" name="price"><br><br>
        <label for="ldescription">Description :</label><br>
        <input type="text" id="ldescription" name="description"><br>
        <label for="lmanufacture">Manufacture</label><br>
        <input type="text" id="lmanufacture" name="manufacture"><br><br>
        <br>
        <input type="submit" form="add-product" value="Add New Product">
    </fieldset>
</form>

</body>

</html>

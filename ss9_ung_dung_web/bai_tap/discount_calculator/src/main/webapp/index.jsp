<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form method="post" action="/ProductServlet">
    <label>Product Description
        <input type="text" name="product_description">
    </label>
    <label>List Price
        <input type="text" name="list_price">
    </label>
    <label>Discount Percent
        <input type="text" name="discount_percent">
    </label>
    <input type="submit" value="Calculator Discount">
</form>
</body>
</html>
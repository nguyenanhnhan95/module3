<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h2>Simple Calculator</h2>
<form style="border: 1px solid black" action="CalculatorServlet" method="get">
    <table>
        <tr>
            <td>
                <label for="operand">First operand: </label>
            </td>
            <td>
                <input id="operand" type="text" name="first_operand">
            </td>
            <td>
        </tr>
        <tr>
            <td>
                <label>
                    Operator :
                </label>
            </td>
            <td>
                <select name="math">
                    <option value="+">addition</option>
                    <option value="-">subtraction</option>
                    <option value="*">Multiply</option>
                    <option value="/">Division</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label>Second operand:</label>
            </td>
            <td>
                <input type="text" name="second_operand">
            </td>
        </tr>
        <tr rowspan="2">
            <td>
                <button type="submit" class="btn btn-primary">Submit</button>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
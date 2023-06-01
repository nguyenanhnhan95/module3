<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        row {
            display: flex;
        }
    </style>
</head>
<body>
<div class="row">
    <di class="col-8">
        <a href="/UserServlet?action=create">Thêm Người dùng mới</a>
    </di>
    <div class="col-4">
        <form class="d-flex" method="post" for="search" action="/UserServlet?action=find_country">
            <input class="form-control me-1" name="country" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-primary" id="search" type="submit">Search</button>
        </form>
    </div>
</div>
<table class="table">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Country</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${list_user}">
        <tr>
            <td><c:out value="${user.id}"/></td>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.country}"/></td>
            <td>
                <a href="/UserServlet?action=edit&id=${user.id}">Edit</a>
                <button onclick="deleteUser('${user.id}','${user.name}')" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal" tabindex="-1" role="dialog" id="exampleModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Xóa người dùng :</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <div class="modal-body">
                <h4>Bạn có muốn xóa người dùng <span id="nameDelete"></span></h4>
            </div>
            <div class="modal-footer">
                <form action="/UserServlet?action=delete" method="post">
                    <input type="hidden" name="id" id="idDelete" value="">

                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-primary">Có</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://kit.fontawesome.com/4bf93b0ca4.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script>

    function deleteUser(id, name) {
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("idDelete").value = id;

    }
</script>
</body>
</html>

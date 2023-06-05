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
    <div class="col-4">
        <a href="/users?action=create">Thêm Người dùng mới</a>
    </div>
    <div>
        <a href="/users"></a>
    </div>
    <div class="col-4">
        <form class="d-flex" method="post" for="search" action="/UserServlet?action=find_country">
            <input class="form-control me-1" name="country" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-primary" id="search" type="submit">Search</button>
        </form>
    </div>
</div>
<table class="table" id="tableUser">
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
                <button onclick="editUser('${user.id}','${user.name}')" data-bs-toggle="modal"
                        data-bs-target="#editModal">Edit
                </button>
                <button onclick="deleteUser('${user.id}','${user.name}')" data-bs-toggle="modal"
                        data-bs-target="#deleteModal">Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal" tabindex="-1" role="dialog" id="deleteModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Xóa người dùng :</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </button>
            </div>
            <div class="modal-body">
                <h4>Bạn có muốn xóa người dùng <span id="nameDelete"></span></h4>
            </div>
            <div class="modal-footer">
                <form action="/users?action=delete" method="post">
                    <input type="hidden" name="id" id="idDelete" value="">

                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-primary">Có</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal" tabindex="-1" role="dialog" id="editModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chỉnh sửa thông tin người dùng :</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </button>
            </div>
            <div class="modal-body">
                <h4>Nhập thông tin thay đổi <span id="nameEdit">:</span></h4>
            </div>
            <div class="modal-footer row">
                <form action="/users?action=edit" method="post">
                    <input type="hidden" name="id" id="idEdit" value="">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="name" class="form-control" id="name" name="name">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="name" class="form-control" id="email" name="email">
                    </div>
                    <div class="mb-3">
                        <label for="country" class="form-label">Country</label>
                        <input type="name" class="form-control" id="country" name="country">
                    </div>
                    <button type="submit" class="btn btn-primary ms-0">Save Change</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://kit.fontawesome.com/4bf93b0ca4.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableUser').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 3
        });
    });

    function deleteUser(id, name) {
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("idDelete").value = id;
    }

    function editUser(id, name) {
        document.getElementById("nameEdit").innerText = name;
        document.getElementById("idEdit").value = id;
    }
</script>
</body>
</html>

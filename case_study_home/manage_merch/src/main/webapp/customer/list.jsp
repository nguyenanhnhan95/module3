<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
</head>
<style>
    *,
    *::before,
    *::after {
        box-sizing: border-box;
    }

    * {
        padding: 0;
        margin: 0;
    }

    .row {
        display: flex;
    }

    .content {
        margin: 20px;
    }

    th {
        text-align: center;
    }

    .message {
        background: black;
        text-align: center;
        color: white;
        padding: 0.5em 0;
        font-size: 14px;
    }

    p {
        margin: 0;
    }

    .logo {
        width: 150px;
    }

    .bag-icon {
        display: inline;
        margin-left: 1rem;
    }

    i {
        font-size: 1.5rem;
    }

    .card {
        border: none;
    }

    footer a {
        text-decoration: none;
        text-transform: uppercase;
        cursor: pointer;
        display: inline-block;
        color: black;
    }

    footer a:hover {
        color: palevioletred;
        text-decoration: underline;
    }

    .footer--text {
        color: gray;
        font-size: 0.85rem;
    }

    .links {
        font-size: 1.5rem;
        text-decoration: none;
        margin-left: 1.5rem;
        padding: 0;
        color: gray;
        font-weight: lighter;
    }

    .links:hover {
        color: palevioletred;
        text-decoration: underline;
    }

    .hamburger {
        background: white;
        border: none;
    }

    .sign-up button,
    .log-in button,
    .sign-up button:hover,
    .log-in button:hover {
        color: white;
    }

    @media (max-width: 768px) {
        .overlay--main {
            z-index: 999;
            position: absolute;
            top: 120px;
            bottom: 0;
            left: 0;
            right: 0;
            background: white;
            /*padding: .5em 1em;*/
        }

        .overlay--main a {
            font-size: 1.5rem;
            font-weight: lighter;
            text-decoration: none;
            color: black;
        }
    }
</style>
<body>
<div class="header row">
    <div class="message">
        <p class="">
            NO ADDITIONAL CUSTOM FEES OR TAXES FOR OUR ASIA CUSTOMERS
        </p>
    </div>
    <!-- <div class="container-fluid">
      <img
        class="w-100"
        src="https://static.vecteezy.com/system/resources/previews/002/393/980/original/corporate-banner-with-modern-design-free-vector.jpg"
      />
    </div> -->
    <div class="container-fluid p-md-5 mt-1">
        <div
                class="row row-cols-3 justify-content-between align-items-center pt-2"
        >
            <div class="col col-auto d-block d-md-none">
                <button class="hamburger" onclick="switcher()">
                    <i class="fa fa-bars switcher-icon"></i>
                </button>
            </div>

            <div class="row col col-md-auto align-items-center">
                <div class="col col-auto">
                    <img
                            class="logo"
                            src="https://cdn.shopify.com/s/files/1/0554/1291/6301/files/JOJI_LOGO.png?v=1661459445&width=400"
                    />
                </div>
                <div class="col d-md-block d-none">
                    <a class="links" href="">Home</a>
                    <a class="links" href="">Product</a>
                    <a class="links" href="">Order</a>
                </div>
            </div>

            <div class="col col-auto">
                <i class="far fa-user"></i>
                <i class="fa fa-shopping-bag bag-icon"></i>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4 "></div>
    <div class="col-md-8 ">
        <form method="post" action="/CustomerServlet">
            <label for="name">Nhập Tên
                <input id="name" name="name">
            </label>
            <label for="address">Địa chỉ
                <input id="address" name="address">
            </label>
            <button type="submit" class="btn btn-success">Search</button>
        </form>
    </div>
</div>
<div class="row content">
    <table class="table table-bordered">
        <thead class="table-dark ">
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Id Customer</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${customerList}" var="customer" varStatus="status">
            <tr>
                <td>
                    <c:out value="${status.count}"></c:out>
                </td>
                <td>
                    <c:out value="${customer.getId()}"></c:out>
                </td>
                <td>
                    <c:out value="${customer.getName()}"></c:out>
                </td>
                <td>
                    <c:out value="${customer.getEmail()}"></c:out>
                </td>
                <td>
                    <c:out value="${customer.getAddress()}"></c:out>
                </td>
                <td>
                    <button type="button" onclick="editCustomer('${customer.getId()}','${customer.getName()}')"
                            class="btn btn-success" data-bs-toggle="modal" data-bs-target="#button-edit">Edit
                    </button>
                    <button onclick="deleteCustomer('${customer.getId()}','${customer.getName()}')"
                            class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#button-delete">Delete
                    </button>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
<div class="modal " tabindex="-1" id="button-delete">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Xóa Khách Hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h4>Bạn muốn xóa khách hàng tên <span id="alert_delete"></span></h4>
            </div>
            <div class="modal-footer">
                <form action="/CustomerServlet?action=delete" method="post">
                    <input type="hidden" name="id" id="is_delete" value="">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal " tabindex="-1" id="button-edit">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thay đổi thông tin</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h4>Bạn muốn xóa khách hàng tên <span id="alert_edit"></span></h4>
            </div>
            <div class="modal-footer">
                <form action="/CustomerServlet?action=edit" method="post" >
                    <input type="hidden" name="id" id="is_edit" value="">
                    <div class="mb-3">
                        <label for="name_update" class="form-label">Name</label>
                        <input type="name" name="name" class="form-control" id="name_update">
                    </div>
                    <div class="mb-3">
                        <label for="email_update" class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" id="email_update"
                               placeholder="name@example.com">
                    </div>
                    <div class="mb-3">
                        <label for="phone_update" class="form-label">Phone</label>
                        <input type="name" name="phone" class="form-control" id="phone_update">
                    </div>
                    <div class="mb-3">
                        <label for="address_update" class="form-label">Address</label>
                        <input type="name" name="address" class="form-control" id="address_update">
                    </div>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save change</button>
                </form>
            </div>
        </div>
    </div>
</div>
<footer>
    <div class="container p-5">
        <h3 class="col text-md-center my-5">Quick Links</h3>
        <div
                class="row flex-column flex-md-row flex-md-wrap justify-content-around g-3"
        >
            <a href="" class="col-auto">search</a>
            <a href="" class="col-auto">contact us</a>
            <a href="" class="col-auto">returns and exchanges</a>
            <a href="" class="col-auto">shipping faq</a>
            <a href="" class="col-auto">asia customers</a>
            <a href="" class="col-auto">privacy policy</a>
            <a href="" class="col-auto">site use terms and conditions</a>
        </div>
    </div>
    <div class="container px-5 text-center footer--text">
        <img class="img-fluid mb-5" src="view/images/cards.png"/>
        <div class="text-center">
            <p>© 2023 JOJI UK Powered by MANHEAD.</p>
            <p>953 Main Street, Nashville, TN 37206 | support@manheadmerch.com</p>
        </div>
    </div>
</footer>
<script>
    function deleteCustomer(id, name) {
        document.getElementById("alert_delete").innerText = name;
        document.getElementById("is_delete").value = id;
    }

    function editCustomer(id, name) {
        document.getElementById("alert_edit").innerText = name;
        document.getElementById("is_edit").value = id;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>

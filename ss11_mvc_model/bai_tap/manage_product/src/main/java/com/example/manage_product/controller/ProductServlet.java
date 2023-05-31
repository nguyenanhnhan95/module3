package com.example.manage_product.controller;

import com.example.manage_product.model.Product;
import com.example.manage_product.service.IProductService;
import com.example.manage_product.service.ProductService;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();
    private List<Product> productList;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewProduct(request, response);
                break;
            case "edit":
                showOnProduct(request, response);
                break;
            case "delete":
                deleteProductGet(request, response);
                try {
                    response.sendRedirect("/ProductServlet");
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            default:
                showProducts(request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProductNew(request, response);
                try {
                    response.sendRedirect("/ProductServlet");
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            case "edit":
                setOnProduct(request, response);
                try {
                    response.sendRedirect("/ProductServlet");
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "view":
                showProduct(request, response);
                break;
            default:
                showProducts(request, response);
                break;
        }
    }

    private void showProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name").trim();
        productList = productService.findAll();
        boolean flag = true;
        for (Product p : productList) {
            if (p.getName().equals(name)) {
                request.setAttribute("product", p);
                flag = false;
            }
        }
        if (flag) {

            request.setAttribute("product", null);
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view-product.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void setOnProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacture = request.getParameter("manufacture");
        productService.editProduct(id, new Product(id, name, price, description, manufacture));
    }

    private void showOnProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findProduct(id);
        request.setAttribute("product", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProductGet(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.deleteProduct(id);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {

    }

    private void createProductNew(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacture = request.getParameter("manufacture");
        productService.addProduct(new Product(id, name, price, description, manufacture));
    }

    private void showProducts(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.findAll();
        request.setAttribute("listProduct", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list-product.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("add-product.jsp");
        requestDispatcher.forward(request, response);
    }

//    private void addProductNew(HttpServletRequest request,HttpServletResponse response){
//        int id = Integer.parseInt(request.getParameter("id"));
//        String name = request.getParameter("name");
//        double price = Double.parseDouble(request.getParameter("price"));
//        String description = request.getParameter("description");
//        String manufacture = request.getParameter("manufacture");
//        Product product = new Product(id,name,price,description,manufacture);
//        productService.save(product);
//        request.setAttribute("message-add","New product was add");
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("add-product.jsp");
//        try {
//            requestDispatcher.forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
}

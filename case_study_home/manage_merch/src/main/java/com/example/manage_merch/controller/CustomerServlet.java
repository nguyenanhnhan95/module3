package com.example.manage_merch.controller;

import com.example.manage_merch.model.Customer;
import com.example.manage_merch.service.CustomerService;
import com.example.manage_merch.service.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "delete":
                break;
            case "edit":
                editFormCustomer(request,response);
                break;
            case "view":
                break;
            default:
                showCustomer(request, response);
        }
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "delete":
                delete(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "view":
                break;
            default:
                showCustomer(request, response);
        }
    }
    private void editFormCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id_customer= Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.getCustomer(id_customer);
        request.setAttribute("customer",customer);
        System.out.println("nhan");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
//        customerService.editCustomer(id, new Customer(name, email, phone, address));
        try {
            response.sendRedirect("/CustomerServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        customerService.deleteCustomer(id);
        try {
            response.sendRedirect("/CustomerServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCustomer(HttpServletRequest request, HttpServletResponse response) {
//        int id_customer = Integer.parseInt(request.getParameter("id_customer"));
        int id_customer =1;
        Customer customer = customerService.getCustomer(id_customer);
        request.setAttribute("customer", customer);
        try {
            request.getRequestDispatcher("customer/list_customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}

package com.example.list_custome.controller;

import com.example.list_custome.model.Customer;
import com.example.list_custome.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private CustomerService customerService = new CustomerService();
    private List<Customer> listCustomer;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listCustomer = new ArrayList<>();
        listCustomer = customerService.displayList();
        request.setAttribute("list", listCustomer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("display-customer.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

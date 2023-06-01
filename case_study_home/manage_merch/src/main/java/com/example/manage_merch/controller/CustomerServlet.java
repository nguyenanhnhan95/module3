package com.example.manage_merch.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                break;
            case "delete":
                break;
            case "edit":
                break;
            case "view":
                break;
            default:
                showListCustomer(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                break;
            case "delete":
                break;
            case "edit":
                break;
            case "view":
                break;
            default:
                showListCustomer(request,response);
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
//        id, String name, String email, String phone, String address,
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address= request.getParameter("address");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list-customer.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

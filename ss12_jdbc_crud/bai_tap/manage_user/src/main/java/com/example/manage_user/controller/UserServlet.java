package com.example.manage_user.controller;

import com.example.manage_user.model.User;
import com.example.manage_user.service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                clickAddUser(request, response);
                break;
            case "edit":
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "find_country":
                break;
            default:
                showListUser(request, response);
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
                addFormUser(request, response);
                break;
            case "edit":
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "find_country":
                findByCountry(request, response);
                break;
            default:
                showListUser(request, response);
        }
    }

    private void addFormUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        userService.addUser(user);
        try {
            response.sendRedirect("/UserServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void clickAddUser(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("add-user.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        boolean confirmDelete = userService.deleteUser(id);
        try {
            response.sendRedirect("/UserServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void findByCountry(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        System.out.println(country);
        User user = userService.findUserByCountry(country);
        request.setAttribute("user", user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("show-search.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = new ArrayList<>();
        userList = userService.findAllUser();
        request.setAttribute("list_user", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list-user.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

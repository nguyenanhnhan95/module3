package com.example.manage_merch.controller;

import com.example.manage_merch.model.Employee;
import com.example.manage_merch.service.EmployeeService;
import com.example.manage_merch.service.IEmployeeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EmployeeServlet", value = "/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                listEmployee(request,response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "create":
                break;
            case "edit":
                break;
            case "delete":
                break;
            case "search":
                search(request,response);
                break;
            default:
                listEmployee(request,response);
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {

    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
//        int account_id= Integer.parseInt(request.getParameter("account_id"));
        int account_id=3;
        Employee employee = employeeService.getEmployee(account_id);
        String name = employee.getName();
        request.setAttribute("employee",employee);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("employee/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

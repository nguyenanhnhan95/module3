package com.example.demo1;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        float x= Float.parseFloat(request.getParameter("number"));
        request.setAttribute("nhan",x);
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request,response);
        System.out.println(x);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }


    public void destroy() {
    }
}
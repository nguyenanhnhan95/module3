package com.example.simple_calcualtor;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    private Calculator calculator = new Calculator();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = null;
        double numberA = Double.parseDouble(request.getParameter("first_operand"));
        double numberB = Double.parseDouble(request.getParameter("second_operand"));
        String math = request.getParameter("math");
        try {
            calculator.calculate(math, numberA, numberB);
            request.setAttribute("result", calculator.calculate(math, numberA, numberB));
        } catch (Exception e) {
            e.printStackTrace();
            message = "Bạn nhập lỗi :";
        }
        request.setAttribute("error", message);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("ResultMath.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

package com.example.discount_calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorDiscount", value = "/ProductServlet")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String descriptionProduct = request.getParameter("product_description");
        double discountPercent = Double.parseDouble(request.getParameter("discount_percent"));
        double listPrice = Double.parseDouble(request.getParameter("list_price"));
        double discountAmount = (listPrice * discountPercent) / 100;
        double discountPrice = listPrice - discountAmount;
        request.setAttribute("product", descriptionProduct);
        request.setAttribute("discount", discountPercent);
        request.setAttribute("amount", discountAmount);
        request.setAttribute("discount_price", discountPrice);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("output-calculator.jsp");
        requestDispatcher.forward(request, response);
    }
}
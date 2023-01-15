package com.example.abccinema;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;

@WebServlet(urlPatterns = {"/booking", "/confirm"})
public class booking extends HttpServlet {
    utilBean util = new utilBean();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (request.getServletPath().equals("/booking")) {
            // handling /booking context

            String movie = request.getParameter("movieID");
            String amount = request.getParameter("payable");
            String[] seats = request.getParameterValues("seats");

            session.setAttribute("movieID", movie);
            session.setAttribute("payable", amount);
            session.setAttribute("seats", Arrays.toString(seats));

            response.sendRedirect("order.jsp");

        } else {
            // handling /confirm context
            String orderID = request.getParameter("orderID");
            String user = (String) session.getAttribute("userID");
            String movie = (String) session.getAttribute("movieID");
            String seats = (String) session.getAttribute("seats");

            // replace this with paypal validation procedure
            if (orderID != null) {
                response.setStatus(200);
                util.handlePurchase(user, movie, orderID, seats);
            } else {
                response.setStatus(400);
            }
        }
    }
}

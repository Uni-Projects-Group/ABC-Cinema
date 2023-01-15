package com.example.abccinema;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Arrays;

@WebServlet(urlPatterns = {"/booking", "/confirm"})
public class booking extends HttpServlet {

    // testing (disposable) mail box
    // https://temp-mail.io/en/email/1muayvnrpp@superblohey.com/token/aShdlZz4tbWEds4cpG7I

    utilBean util = new utilBean();
    Connection connection = null;

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
                try {
                    Class.forName(envBean.driver);
                    Connection connection = DriverManager.getConnection(envBean.url, envBean.user, envBean.password);
                    PreparedStatement query = connection.prepareStatement("insert into purchase_history (userId, movieId, purchaseId, reserved) values (?,?,?,?)");
                    query.setInt(1, Integer.parseInt(user));
                    query.setInt(2, Integer.parseInt(movie));
                    query.setString(3, orderID);
                    query.setString(4, seats);

                    int rows = query.executeUpdate();
                    if (rows > 0) {
                        response.setStatus(200);
                    } else {
                        response.setStatus(500);
                    }
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                response.setStatus(400);
            }
        }
    }
}

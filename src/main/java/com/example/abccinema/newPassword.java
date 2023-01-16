package com.example.abccinema;

import jakarta.servlet.RequestDispatcher;
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

@WebServlet("/newPassword")
public class newPassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;
        if (newPassword != null && newPassword.equals(confPassword)) {
            try {
                String hash = utilBean.obtainHash(newPassword);

                Class.forName(envBean.driver);
                Connection connection = DriverManager.getConnection(envBean.url, envBean.user, envBean.password);
                PreparedStatement query = connection.prepareStatement("update users set upwd = ? where uemail = ?");
                query.setString(1, hash);
                query.setString(2, (String) session.getAttribute("email"));

                int rowCount = query.executeUpdate();
                if (rowCount > 0) {
                    request.setAttribute("status", "resetSuccess");
                } else {
                    request.setAttribute("status", "resetFailed");
                }
                dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

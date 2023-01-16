package com.example.abccinema;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "admin", value = "/admin")
public class admin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String redirect = request.getParameter("redirect");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        if (username == null || username.equals("")) {
            request.setAttribute("status", "invalidEmail");
            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
        if (password == null || password.equals("")) {
            request.setAttribute("status", "invalidUpwd");
            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }

        try {
            Class.forName(envBean.driver);
            Connection connection = DriverManager.getConnection(envBean.url, envBean.user, envBean.password);
            PreparedStatement query = connection.prepareStatement("select id,admin_user from admins where admin_user = ? and admin_pass = ?");
            query.setString(1, username);
            query.setString(2, password);
            ResultSet rs = query.executeQuery();
            if (rs.next()) {
                session.setAttribute("adminID", rs.getString("id"));
                if (redirect != null) {
                    session.removeAttribute("redirectTo");
                    response.sendRedirect(redirect);
                } else {
                    response.sendRedirect("dashboard.jsp");
                }
            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("portal.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

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
import java.sql.ResultSet;
import java.util.Objects;


@WebServlet("/login")
public class login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String redirect = request.getParameter("redirect");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        if (email == null || email.equals("")) {
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
            String hash = utilBean.obtainHash(password);

            Class.forName(envBean.driver);
            Connection connection = DriverManager.getConnection(envBean.url, envBean.user, envBean.password);
            PreparedStatement query = connection.prepareStatement("select id,uname from users where uemail = ? and upwd = ?");
            query.setString(1, email);
            query.setString(2, hash);
            ResultSet rs = query.executeQuery();
            if (rs.next()) {
                session.setAttribute("userID", rs.getString("id"));
                if (!Objects.equals(redirect, "")) {
                    session.removeAttribute("redirectTo");
                    response.sendRedirect(redirect);
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

package com.example.abccinema;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/register")
public class register extends HttpServlet {
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String rePass = request.getParameter("re_pass");
        String contact = request.getParameter("contact");
        RequestDispatcher dispatcher = null;
        Connection connection = null;

        if (uname == null || uname.equals("")) {
            request.setAttribute("status", "invalidName");
            dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }
        if (email == null || email.equals("")) {
            request.setAttribute("status", "invalidEmail");
            dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }
        if (password == null || password.equals("")) {
            request.setAttribute("status", "invalidPassword");
            dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        } else if (!password.equals(rePass)) {
            request.setAttribute("status", "invalidConfirmPassword");
            dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }
        if (contact == null || contact.equals("")) {
            request.setAttribute("status", "invalidMobile");
            dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        } else if (contact.length() > 10) {
            request.setAttribute("status", "invalidMobileLength");
            dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }

        try {
            String hash = utilBean.obtainHash(password);

            Class.forName(envBean.driver);
            connection = DriverManager.getConnection(envBean.url, envBean.user, envBean.password);
            PreparedStatement query = connection.prepareStatement("insert into users (uname,upwd,uemail,umobile) values (?,?,?,?)");
            query.setString(1, uname);
            query.setString(2, hash);
            query.setString(3, email);
            query.setString(4, contact);

            int rowCount = query.executeUpdate();
            dispatcher = request.getRequestDispatcher("register.jsp");
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

            dispatcher.forward(request, response);
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

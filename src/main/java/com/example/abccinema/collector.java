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


@WebServlet(urlPatterns = {"/collector"})
public class collector extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String review = request.getParameter("feedback");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        Connection con = null;

        try {
            Class.forName(envBean.driver);
            con = DriverManager.getConnection(envBean.url, envBean.user, envBean.password);
            PreparedStatement st = con.prepareStatement("INSERT INTO feedback (userID, message) values (?,?)");
            st.setString(1, (String) session.getAttribute("userID"));
            st.setString(2, review);
            st.executeQuery();
            request.setAttribute("status", "success");
            dispatcher = request.getRequestDispatcher("feedback.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "failed");
            dispatcher = request.getRequestDispatcher("feedback.jsp");
            dispatcher.forward(request, response);
        }
    }
}

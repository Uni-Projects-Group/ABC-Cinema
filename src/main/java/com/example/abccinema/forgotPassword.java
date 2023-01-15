package com.example.abccinema;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Random;

@WebServlet("/forgotPassword")
public class forgotPassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        HttpSession mySession = request.getSession();
        utilBean utilBean = new utilBean();
        RequestDispatcher dispatcher = null;

        if (email != null || !email.equals("")) {
            // sending otp
            Random rand = new Random();
            int otpvalue = rand.nextInt(1255650);

            utilBean.handleReset(email, otpvalue);

            dispatcher = request.getRequestDispatcher("validate.jsp");
            request.setAttribute("message", "OTP is sent to your email");
            //request.setAttribute("connection", con);
            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("email", email);
            dispatcher.forward(request, response);
            //request.setAttribute("status", "success");
        }
    }
}

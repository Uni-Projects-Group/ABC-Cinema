package com.example.abccinema;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;


@WebServlet("/forgotPassword")
public class forgotPassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();

        if (email != null || !email.equals("")) {
            // sending otp
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);

            // Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication passwordAuthentication() {
                    return new PasswordAuthentication(envBean.mail_user, envBean.mail_pwd);
                }
            });

            // compose message
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email));// change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                message.setSubject("Hello");
                message.setText("your OTP is: " + otpvalue);
                // send message
                Transport.send(message);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
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

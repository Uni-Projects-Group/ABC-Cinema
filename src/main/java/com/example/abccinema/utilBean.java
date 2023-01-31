package com.example.abccinema;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class utilBean {

    private static Session getSession() {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");
        return Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(envBean.mail_user, envBean.mail_pwd);
            }
        });
    }

    public static String obtainHash(String text) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(text.getBytes((StandardCharsets.UTF_8)));

        BigInteger num = new BigInteger(1, hash);
        StringBuilder hexStr = new StringBuilder(num.toString(16));
        while (hexStr.length() < 32) {
            hexStr.insert(0, '0');
        }
        return hexStr.toString();
    }

    public static void handleReset(String email, int otp) {
        try {
            Session session = getSession();
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(envBean.mail_user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject("ABC Cinema | Password Reset");
            message.setText("Your OTP is: " + otp);
            Transport.send(message);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void handlePurchase(String userID, String movieID, String purchaseID, String seatsArr) {
        ResultSet out;
        String email = null;
        String movie = null;
        String seats = seatsArr.replace("[", "").replace("]", "");

        try {
            Class.forName(envBean.driver);
            Connection connection = DriverManager.getConnection(envBean.url, envBean.user, envBean.password);

            PreparedStatement qHistory = connection.prepareStatement("insert into purchase_history (userId, movieId, purchaseId, reserved) values (?,?,?,?)");
            qHistory.setInt(1, Integer.parseInt(userID));
            qHistory.setInt(2, Integer.parseInt(movieID));
            qHistory.setString(3, purchaseID);
            qHistory.setString(4, seats);
            qHistory.executeUpdate();

            PreparedStatement qUser = connection.prepareStatement("select uemail from users where id = ?");
            qUser.setInt(1, Integer.parseInt(userID));
            out = qUser.executeQuery();
            while (out.next()) {
                email = out.getString(1);
            }

            PreparedStatement qMovie = connection.prepareStatement("select name from nowshowing where movieid = ?");
            qMovie.setInt(1, Integer.parseInt(movieID));
            out = qMovie.executeQuery();
            while (out.next()) {
                movie = out.getString(1);
            }

            connection.close();

            String body = "Thank you for the purchase! We hope you'll enjoy the show.\n" +
                    "Purchase ID: " + purchaseID + "\n" +
                    "Movie: " + movie + "\n" +
                    "Seats: " + seats + "\n" +
                    "Please show this to our staff to watch the show.";
            Session session = getSession();
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(envBean.mail_user));
            assert email != null;
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject("ABC Cinema | Purchase Receipt");
            message.setText(body);
            Transport.send(message);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

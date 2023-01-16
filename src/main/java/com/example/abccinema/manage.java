package com.example.abccinema;

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

@WebServlet(name = "manage", value = "/manage")
public class manage extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String manage_action = request.getParameter("manage_action");
        Connection connection = null;

        try {
            Class.forName(envBean.driver);
            connection = DriverManager.getConnection(envBean.url, envBean.user, envBean.password);

            switch (manage_action) {
                case "insert_nowshowing" -> {
                    String mov_name = request.getParameter("mov_name");
                    String mov_genre = request.getParameter("mov_genre");
                    String mov_lang = request.getParameter("mov_lang");
                    String mov_time = request.getParameter("mov_time");
                    String mov_desc = request.getParameter("mov_desc");
                    String mov_img = request.getParameter("mov_img");

                    PreparedStatement query = connection.prepareStatement("insert into nowshowing (name, genre, Language, Timeslot, description, image_path) values (?,?,?,?,?,?)");
                    query.setString(1, mov_name);
                    query.setString(2, mov_genre);
                    query.setString(3, mov_lang);
                    query.setString(4, mov_time);
                    query.setString(5, mov_desc);
                    query.setString(6, mov_img);
                    query.executeUpdate();
                    response.sendRedirect("dashboard.jsp");
                }
                case "delete_nowshowing" -> {
                    String mov_id = request.getParameter("mov_id");
                    PreparedStatement query = connection.prepareStatement("delete from nowshowing where movieid = ?");
                    query.setInt(1, Integer.parseInt(mov_id));
                    query.executeUpdate();
                    response.sendRedirect("dashboard.jsp");
                }
                case "insert_upcoming" -> {
                    String mov_name = request.getParameter("mov_name");
                    String mov_genre = request.getParameter("mov_genre");
                    String mov_lang = request.getParameter("mov_lang");
                    String mov_desc = request.getParameter("mov_desc");
                    String mov_img = request.getParameter("mov_img");

                    PreparedStatement query = connection.prepareStatement("insert into upcoming_mov (mov_name, mov_desc, mov_lang, genre, banner) values (?,?,?,?,?)");
                    query.setString(1, mov_name);
                    query.setString(2, mov_desc);
                    query.setString(3, mov_lang);
                    query.setString(4, mov_genre);
                    query.setString(5, mov_img);
                    query.executeUpdate();
                    response.sendRedirect("dashboard.jsp");
                }
                case "delete_upcoming" -> {
                    String mov_id = request.getParameter("mov_id");
                    PreparedStatement query = connection.prepareStatement("delete from upcoming_mov where mov_id = ?");
                    query.setInt(1, Integer.parseInt(mov_id));
                    query.executeUpdate();
                    response.sendRedirect("dashboard.jsp");
                }
                default -> response.sendRedirect("dashboard.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                assert connection != null;
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

package com.example.abccinema;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

import io.github.cdimascio.dotenv.Dotenv;

@WebServlet(name = "demo", value = "/demo")
public class demo extends HttpServlet {

    private final Dotenv env = Dotenv.load();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println(env.get("DB_USER"));
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

package com.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FacilitiesServlet")
public class FacilitiesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FacilitiesServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // The path starts from the root of the 'webapp' folder
        // Ensure the folder name 'pages' matches your directory exactly (case-sensitive)
        request.getRequestDispatcher("/pages/facilities.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
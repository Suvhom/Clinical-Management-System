package com.controller;

import java.io.IOException;

import com.dao.ReportDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminReports")
public class AdminReportsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminReportsController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            ReportDao dao = new ReportDao();

            double revenue = dao.getLast30DaysRevenue();

            request.setAttribute("last30DaysRevenue", revenue);

            request.getRequestDispatcher("/Admin_page/GenerateReports.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
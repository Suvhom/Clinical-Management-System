package com.controller;

import java.io.IOException;

import com.dao.ReportDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/reports", asyncSupported = true)
public class GenerateReportServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ReportDao reportDao;

    @Override
    public void init() {
        reportDao = new ReportDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Servlet asks DAO for report data, then sends it to JSP for display.
        request.setAttribute("totalRevenue", reportDao.getTotalRevenue());
        request.setAttribute("totalBills", reportDao.getTotalBills());
        request.setAttribute("monthlyRevenueList", reportDao.getMonthlyRevenue());
        request.setAttribute("recentBills", reportDao.getRecentBills());

        request.getRequestDispatcher("/WEB-INF/Admin_page/GenerateReport.jsp")
               .forward(request, response);
    }
}

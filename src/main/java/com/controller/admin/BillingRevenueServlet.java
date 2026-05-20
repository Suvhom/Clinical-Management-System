package com.controller.admin;

import java.io.IOException;
import java.util.Map;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dao.DashboardDao;

@WebServlet(urlPatterns = "/admin/billing", asyncSupported = true)
public class BillingRevenueServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DashboardDao dashboardDao;

    @Override
    public void init() {
        new com.dao.BillingDao();
        dashboardDao = new DashboardDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch actual financial records dynamically
        Map<String, Integer> stats = dashboardDao.getBillingSummaryStats();
        ArrayList<String[]> transactions = dashboardDao.getRecentTransactions();

        // Pass lists to presentation layer
        request.setAttribute("stats", stats);
        request.setAttribute("transactions", transactions);

        request.getRequestDispatcher("/WEB-INF/Admin_page/BillingRevenue.jsp")
               .forward(request, response);
    }
}

package com.controller.admin;

import java.io.IOException;
import java.util.Map;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.dao.DashboardDao;

@WebServlet(urlPatterns = "/admin/dashboard", asyncSupported = true)
public class AdminDashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DashboardDao dashboardDao;

    @Override
    public void init() {
        dashboardDao = new DashboardDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch only the requested dashboard analytics
        Map<String, Integer> overviewCounts = dashboardDao.getOverviewCounts();
        
        java.util.ArrayList<String[]> todayAppointments = dashboardDao.getTodayAppointments();
        java.util.ArrayList<String[]> availableStaff = dashboardDao.getAvailableStaffWithStatus();
        java.util.ArrayList<String[]> recentActivities = dashboardDao.getRecentActivities();

        // Bind attributes
        request.setAttribute("overviewCounts", overviewCounts);
        request.setAttribute("todayAppointments", todayAppointments);
        request.setAttribute("availableStaff", availableStaff);
        request.setAttribute("recentActivities", recentActivities);

        // Forward to clinical dashboard JSP
        request.getRequestDispatcher("/WEB-INF/Admin_page/AdminDashboard.jsp")
               .forward(request, response);
    }
}

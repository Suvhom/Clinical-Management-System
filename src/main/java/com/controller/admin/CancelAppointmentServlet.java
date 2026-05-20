package com.controller.admin;

import java.io.IOException;

import com.dao.AppointmentDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/cancel-appointment", asyncSupported = true)
public class CancelAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AppointmentDao appointmentDao = new AppointmentDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processCancellation(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processCancellation(request, response);
    }

    private void processCancellation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/appointments?error=missing_id");
            return;
        }

        try {
            int appointmentId = Integer.parseInt(idStr);
            boolean success = appointmentDao.updateStatus(appointmentId, "Cancelled");

            if (success) {
                new com.dao.DashboardDao().insertActivity("Appointment cancelled: ID #" + appointmentId);
                response.sendRedirect(request.getContextPath() + "/admin/appointments?success=3");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/appointments?error=failed");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/appointments?error=invalid_id");
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin/appointments?error=system_error");
        }
    }
}

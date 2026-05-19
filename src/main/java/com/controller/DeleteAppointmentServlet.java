package com.controller;

import java.io.IOException;
import com.dao.AppointmentDao;
import com.dao.DashboardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/delete-appointment")
public class DeleteAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AppointmentDao appointmentDao = new AppointmentDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processDeletion(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processDeletion(request, response);
    }

    private void processDeletion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/appointments?error=missing_id");
            return;
        }

        try {
            int appointmentId = Integer.parseInt(idStr.trim());
            boolean success = appointmentDao.deleteAppointment(appointmentId);

            if (success) {
                new DashboardDao().insertActivity("Appointment deleted: ID #" + appointmentId);
                response.sendRedirect(request.getContextPath() + "/admin/appointments?success=4");
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

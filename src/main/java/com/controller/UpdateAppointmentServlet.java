package com.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

import com.dao.AddPatientDao;
import com.dao.AppointmentDao;
import com.model.AddPatientModel;
import com.model.AppointmentModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/update-appointment")
public class UpdateAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AppointmentDao appointmentDao = new AppointmentDao();
    private AddPatientDao patientDao = new AddPatientDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("appointmentId");
        String patientIdStr = request.getParameter("patientId");
        String staffIdStr = request.getParameter("staffId");
        String dateStr = request.getParameter("appointmentDate");
        String timeStr = request.getParameter("appointmentTime");
        String reason = request.getParameter("reason");
        String status = request.getParameter("status");

        // Validation
        if (idStr == null || idStr.trim().isEmpty() ||
            patientIdStr == null || patientIdStr.trim().isEmpty() ||
            staffIdStr == null || staffIdStr.trim().isEmpty() ||
            dateStr == null || dateStr.trim().isEmpty() ||
            timeStr == null || timeStr.trim().isEmpty() ||
            reason == null || reason.trim().isEmpty() ||
            status == null || status.trim().isEmpty()) {

            request.setAttribute("errorMessage", "All required fields must be filled!");
            redisplayEditForm(request, response, idStr);
            return;
        }

        try {
            int appointmentId = Integer.parseInt(idStr);
            int patientId = Integer.parseInt(patientIdStr);
            int staffId = Integer.parseInt(staffIdStr);
            Date date = Date.valueOf(dateStr);
            
            // Format HH:MM to HH:MM:00 for java.sql.Time valueOf format requirement
            if (timeStr.length() == 5) {
                timeStr += ":00";
            }
            Time time = Time.valueOf(timeStr);

            // Check collision (exclude the current appointment ID we are updating)
            boolean isConflict = appointmentDao.checkConflict(patientId, staffId, date, time, appointmentId);
            if (isConflict) {
                request.setAttribute("errorMessage", "Double-Booking Conflict! The selected patient or staff member already has a booking at this date and time.");
                redisplayEditForm(request, response, idStr);
                return;
            }

            // Construct model
            AppointmentModel appt = new AppointmentModel();
            appt.setAppointmentId(appointmentId);
            appt.setPatientId(patientId);
            appt.setStaffId(staffId);
            appt.setAppointmentDate(date);
            appt.setAppointmentTime(time);
            appt.setReason(reason.trim());
            appt.setStatus(status);

            boolean success = appointmentDao.updateAppointment(appt);
            if (success) {
                com.dao.DashboardDao dashDao = new com.dao.DashboardDao();
                if ("Completed".equalsIgnoreCase(status)) {
                    dashDao.insertActivity("Payment completed for appointment ID #" + appointmentId);
                } else {
                    dashDao.insertActivity("Appointment updated: ID #" + appointmentId);
                }
                
                response.sendRedirect(request.getContextPath() + "/admin/appointments?success=2");
            } else {
                request.setAttribute("errorMessage", "Failed to update appointment: No rows were affected in the database.");
                redisplayEditForm(request, response, idStr);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Staff ID, Patient ID, and Appointment ID must be numbers!");
            redisplayEditForm(request, response, idStr);
        } catch (IllegalArgumentException e) {
            request.setAttribute("errorMessage", "Invalid Date or Time format provided!");
            redisplayEditForm(request, response, idStr);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "MySQL Database Error: " + e.getMessage() + " (SQLState: " + e.getSQLState() + ", Code: " + e.getErrorCode() + ")");
            redisplayEditForm(request, response, idStr);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            redisplayEditForm(request, response, idStr);
        }
    }

    private void redisplayEditForm(HttpServletRequest request, HttpServletResponse response, String idStr) 
            throws ServletException, IOException {
        try {
            int appointmentId = Integer.parseInt(idStr);
            AppointmentModel appt = appointmentDao.getAppointmentById(appointmentId);
            ArrayList<AddPatientModel> patientsList = patientDao.getAllPatients();
            ArrayList<String[]> staffList = appointmentDao.getAvailableStaff(); // Fetch available staff members

            request.setAttribute("appointment", appt);
            request.setAttribute("patientsList", patientsList);
            request.setAttribute("staffList", staffList); // Attach available staff members

            request.getRequestDispatcher("/WEB-INF/Admin_page/EditAppointment.jsp")
                   .forward(request, response);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin/appointments?error=system_error");
        }
    }
}

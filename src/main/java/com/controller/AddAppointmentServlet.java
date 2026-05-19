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

@WebServlet("/admin/add-appointment")
public class AddAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AppointmentDao appointmentDao = new AppointmentDao();
    private AddPatientDao patientDao = new AddPatientDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Fetch all patients for selection dropdown
        ArrayList<AddPatientModel> patientsList = patientDao.getAllPatients();
        request.setAttribute("patientsList", patientsList);

        // Fetch all available staff members dynamically from the database
        ArrayList<String[]> staffList = appointmentDao.getAvailableStaff();
        request.setAttribute("staffList", staffList);

        // Bind quick action patient pre-selection
        String patientIdParam = request.getParameter("patientId");
        if (patientIdParam != null && !patientIdParam.trim().isEmpty()) {
            try {
                request.setAttribute("selectedPatientId", Integer.parseInt(patientIdParam.trim()));
            } catch (NumberFormatException e) {
                // Ignore
            }
        }

        // Bind quick action staff pre-selection
        String staffIdParam = request.getParameter("staffId");
        if (staffIdParam != null && !staffIdParam.trim().isEmpty()) {
            request.setAttribute("enteredStaffId", staffIdParam.trim());
        }

        request.getRequestDispatcher("/WEB-INF/Admin_page/AddAppointment.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String patientIdStr = request.getParameter("patientId");
        String staffIdStr = request.getParameter("staffId");
        String dateStr = request.getParameter("appointmentDate");
        String timeStr = request.getParameter("appointmentTime"); // Will be in "HH:MM" format from HTML5 input
        String reason = request.getParameter("reason");

        // Validation
        if (patientIdStr == null || patientIdStr.trim().isEmpty() ||
            staffIdStr == null || staffIdStr.trim().isEmpty() ||
            dateStr == null || dateStr.trim().isEmpty() ||
            timeStr == null || timeStr.trim().isEmpty() ||
            reason == null || reason.trim().isEmpty()) {

            request.setAttribute("errorMessage", "All required fields must be filled!");
            doGet(request, response);
            return;
        }

        try {
            int patientId = Integer.parseInt(patientIdStr);
            int staffId = Integer.parseInt(staffIdStr);
            Date date = Date.valueOf(dateStr);
            
            // Format HH:MM to HH:MM:00 for java.sql.Time valueOf format requirement
            if (timeStr.length() == 5) {
                timeStr += ":00";
            }
            Time time = Time.valueOf(timeStr);

            // Check duplicate booking conflict
            boolean isConflict = appointmentDao.checkConflict(patientId, staffId, date, time, null);
            if (isConflict) {
                request.setAttribute("errorMessage", "Double-Booking Conflict! Either this patient or the assigned staff member already has a booking at this date and time.");
                
                // Repopulate form inputs to prevent user frustration
                request.setAttribute("selectedPatientId", patientId);
                request.setAttribute("enteredStaffId", staffIdStr);
                request.setAttribute("enteredDate", dateStr);
                request.setAttribute("enteredTime", request.getParameter("appointmentTime"));
                request.setAttribute("enteredReason", reason);

                doGet(request, response);
                return;
            }

            // Create model
            AppointmentModel appt = new AppointmentModel();
            appt.setPatientId(patientId);
            appt.setStaffId(staffId);
            appt.setAppointmentDate(date);
            appt.setAppointmentTime(time);
            appt.setReason(reason.trim());
            appt.setStatus("Pending"); // Default status for new bookings

            boolean success = appointmentDao.addAppointment(appt);
            if (success) {
                String pName = "Patient #" + patientId;
                AddPatientModel pModel = patientDao.getPatientById(patientId);
                if (pModel != null) {
                    pName = pModel.getPatientName();
                }
                String sName = "Staff #" + staffId;
                com.model.StaffModel sModel = new com.dao.StaffDao().getStaffById(staffId);
                if (sModel != null) {
                    sName = sModel.getStaffName();
                }
                new com.dao.DashboardDao().insertActivity("Appointment booked for " + pName + " with " + sName);
                
                response.sendRedirect(request.getContextPath() + "/admin/appointments?success=1");
            } else {
                request.setAttribute("errorMessage", "Failed to book appointment: No rows were affected in the database.");
                doGet(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Staff ID and Patient ID must be numbers!");
            doGet(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("errorMessage", "Invalid Date or Time format provided!");
            doGet(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "MySQL Database Error: " + e.getMessage() + " (SQLState: " + e.getSQLState() + ", Code: " + e.getErrorCode() + ")");
            doGet(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            doGet(request, response);
        }
    }
}

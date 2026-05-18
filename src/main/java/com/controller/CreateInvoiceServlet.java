package com.controller;

import java.io.IOException;
import java.sql.Date;
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

@WebServlet("/admin/create-invoice")
public class CreateInvoiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private AppointmentDao appointmentDao = new AppointmentDao();
    private AddPatientDao patientDao = new AddPatientDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Fetch all patients for selection dropdown
        ArrayList<AddPatientModel> patientsList = patientDao.getAllPatients();
        request.setAttribute("patientsList", patientsList);

        // Fetch all staff members dynamically from the database
        ArrayList<String[]> staffList = appointmentDao.getAvailableStaff();
        request.setAttribute("staffList", staffList);

        request.getRequestDispatcher("/WEB-INF/Admin_page/CreateInvoice.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String patientIdStr = request.getParameter("patientId");
        String staffIdStr = request.getParameter("staffId");
        String dateStr = request.getParameter("invoiceDate");
        String timeStr = request.getParameter("invoiceTime");
        String reason = request.getParameter("reason");
        String invoiceStatus = request.getParameter("status"); // Paid, Pending, Overdue

        // Validation
        if (patientIdStr == null || patientIdStr.trim().isEmpty() ||
            staffIdStr == null || staffIdStr.trim().isEmpty() ||
            dateStr == null || dateStr.trim().isEmpty() ||
            timeStr == null || timeStr.trim().isEmpty() ||
            reason == null || reason.trim().isEmpty() ||
            invoiceStatus == null || invoiceStatus.trim().isEmpty()) {

            request.setAttribute("errorMessage", "All required billing fields must be completed!");
            doGet(request, response);
            return;
        }

        try {
            int patientId = Integer.parseInt(patientIdStr);
            int staffId = Integer.parseInt(staffIdStr);
            Date date = Date.valueOf(dateStr);
            
            if (timeStr.length() == 5) {
                timeStr += ":00";
            }
            Time time = Time.valueOf(timeStr);

            // Map Invoice Status to Appointment Status for seamless database support
            String apptStatus = "Pending";
            if ("Paid".equalsIgnoreCase(invoiceStatus)) {
                apptStatus = "Completed";
            } else if ("Pending".equalsIgnoreCase(invoiceStatus)) {
                apptStatus = "Confirmed";
            } else if ("Overdue".equalsIgnoreCase(invoiceStatus)) {
                apptStatus = "Pending";
            }

            // Create model
            AppointmentModel appt = new AppointmentModel();
            appt.setPatientId(patientId);
            appt.setStaffId(staffId);
            appt.setAppointmentDate(date);
            appt.setAppointmentTime(time);
            appt.setReason(reason.trim());
            appt.setStatus(apptStatus);

            boolean success = appointmentDao.addAppointment(appt);
            if (success) {
                int newApptId = 0;
                try (java.sql.Connection conn = com.utils.DBconfig.getConnection();
                     java.sql.PreparedStatement ps = conn.prepareStatement("SELECT MAX(appointment_id) FROM appointment");
                     java.sql.ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        newApptId = rs.getInt(1);
                    }
                } catch (Exception e) {}

                com.dao.DashboardDao dashDao = new com.dao.DashboardDao();
                if ("Completed".equals(apptStatus)) {
                    dashDao.insertActivity("Payment completed for appointment ID #" + (newApptId > 0 ? newApptId : ""));
                } else {
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
                    dashDao.insertActivity("Appointment booked for " + pName + " with " + sName);
                }

                response.sendRedirect(request.getContextPath() + "/admin/billing?success=1");
            } else {
                request.setAttribute("errorMessage", "Failed to write invoice to database.");
                doGet(request, response);
            }

        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error compiling invoice: " + e.getMessage());
            doGet(request, response);
        }
    }
}

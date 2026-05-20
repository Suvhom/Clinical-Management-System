package com.controller;

import java.io.IOException;
import java.sql.Date;

import com.dao.AddPatientDao;
import com.model.AddPatientModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/update-patient", asyncSupported = true)
public class UpdatePatientServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AddPatientModel patient = new AddPatientModel();

        String adminId = request.getParameter("adminId");
        String staffId = request.getParameter("staffId");
        String dateOfBirth = request.getParameter("dateOfBirth");

        try {
            patient.setPatientId(Integer.parseInt(request.getParameter("patientId")));

            if (adminId != null && !adminId.trim().isEmpty()) {
                patient.setAdminId(Integer.parseInt(adminId));
            }

            if (staffId != null && !staffId.trim().isEmpty()) {
                patient.setStaffId(Integer.parseInt(staffId));
            }

            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");

            patient.setPatientName(request.getParameter("patientName"));
            patient.setEmail(email != null && !email.trim().isEmpty() ? email.trim() : null);
            patient.setPhone(phone != null && !phone.trim().isEmpty() ? phone.trim() : null);
            patient.setGender(gender != null && !gender.trim().isEmpty() ? gender.trim() : null);
            patient.setAddress(address != null && !address.trim().isEmpty() ? address.trim() : null);
            patient.setUsername(request.getParameter("username"));
            patient.setPassword(request.getParameter("password"));

            if (dateOfBirth != null && !dateOfBirth.trim().isEmpty()) {
                patient.setDateOfBirth(Date.valueOf(dateOfBirth));
            }

            AddPatientDao dao = new AddPatientDao();
            boolean updated = dao.updatePatient(patient);

            if (updated) {
                new com.dao.DashboardDao().insertActivity("Patient profile updated: " + patient.getPatientName());
                response.sendRedirect(request.getContextPath() + "/admin/patients?updated=1");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/edit-patient?id=" + patient.getPatientId() + "&error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/patients?error=updatefailed");
        }
    }
}

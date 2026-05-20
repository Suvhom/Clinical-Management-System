package com.controller.admin;

import java.io.IOException;
import java.sql.Date;

import com.dao.AddPatientDao;
import com.model.AddPatientModel;
import com.utils.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/add-patient", asyncSupported = true)
public class AddPatientServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/Admin_page/AddPatient.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AddPatientModel patient = new AddPatientModel();

        String adminId = request.getParameter("adminId");
        String staffId = request.getParameter("staffId");
        String dateOfBirth = request.getParameter("dateOfBirth");

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
        String patientName = request.getParameter("patientName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (isEmpty(patientName) || isEmpty(username) || isEmpty(password)) {
            response.sendRedirect(request.getContextPath() + "/admin/add-patient?error=1");
            return;
        }

        patient.setPatientName(patientName.trim());
        patient.setEmail(email != null && !email.trim().isEmpty() ? email.trim() : null);
        patient.setPhone(phone != null && !phone.trim().isEmpty() ? phone.trim() : null);
        patient.setGender(gender != null && !gender.trim().isEmpty() ? gender.trim() : null);
        patient.setAddress(address != null && !address.trim().isEmpty() ? address.trim() : null);
        patient.setUsername(username.trim());
        patient.setPassword(PasswordUtil.getHashPassword(password));

        if (dateOfBirth != null && !dateOfBirth.trim().isEmpty()) {
            patient.setDateOfBirth(Date.valueOf(dateOfBirth));
        }

        System.out.println("===== ADD PATIENT FORM DATA =====");
        System.out.println("Patient Name: " + patient.getPatientName());
        System.out.println("Email: " + patient.getEmail());
        System.out.println("Phone: " + patient.getPhone());
        System.out.println("Gender: " + patient.getGender());
        System.out.println("Address: " + patient.getAddress());
        System.out.println("DOB: " + patient.getDateOfBirth());
        System.out.println("Username: " + patient.getUsername());
        System.out.println("Admin ID: " + patient.getAdminId());
        System.out.println("Staff ID: " + patient.getStaffId());

        AddPatientDao dao = new AddPatientDao();
        boolean saved = dao.addPatient(patient);

        if (saved) {
            System.out.println("Patient added successfully.");
            new com.dao.DashboardDao().insertActivity("New patient registered: " + patient.getPatientName());
            response.sendRedirect(request.getContextPath() + "/admin/patients?success=1");
        } else {
            System.out.println("Patient add failed.");
            response.sendRedirect(request.getContextPath() + "/admin/add-patient?error=1");
        }
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }
}

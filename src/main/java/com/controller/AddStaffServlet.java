package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.dao.StaffDao;
import com.model.StaffModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/add-staff")
public class AddStaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDao staffDao = new StaffDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.getRequestDispatcher("/WEB-INF/Admin_page/AddStaff.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("staffName");
        String specialization = request.getParameter("specialization");
        String qualification = request.getParameter("qualification");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String experienceStr = request.getParameter("experience");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String status = request.getParameter("status");

        // Validation
        if (name == null || name.trim().isEmpty() ||
            specialization == null || specialization.trim().isEmpty() ||
            qualification == null || qualification.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            experienceStr == null || experienceStr.trim().isEmpty() ||
            gender == null || gender.trim().isEmpty() ||
            address == null || address.trim().isEmpty() ||
            status == null || status.trim().isEmpty()) {

            request.setAttribute("errorMessage", "All required fields must be filled!");
            doGet(request, response);
            return;
        }

        try {
            int experience = Integer.parseInt(experienceStr);

            StaffModel staff = new StaffModel();
            staff.setStaffName(name.trim());
            staff.setSpecialization(specialization.trim());
            staff.setQualification(qualification.trim());
            staff.setPhone(phone.trim());
            staff.setEmail(email.trim());
            staff.setExperience(experience);
            staff.setGender(gender.trim());
            staff.setAddress(address.trim());
            staff.setStatus(status.trim());

            boolean success = staffDao.addStaff(staff);
            if (success) {
                new com.dao.DashboardDao().insertActivity("New staff added: " + name.trim());
                response.sendRedirect(request.getContextPath() + "/admin/staff?success=1");
            } else {
                request.setAttribute("errorMessage", "Failed to register staff: No rows affected.");
                doGet(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Years of experience must be a valid number!");
            doGet(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "MySQL Database Error: " + e.getMessage() + " (SQLState: " + e.getSQLState() + ")");
            doGet(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            doGet(request, response);
        }
    }
}

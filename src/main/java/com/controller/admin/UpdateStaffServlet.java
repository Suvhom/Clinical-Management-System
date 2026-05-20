package com.controller.admin;

import java.io.IOException;
import java.sql.SQLException;

import com.dao.StaffDao;
import com.model.StaffModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/update-staff", asyncSupported = true)
public class UpdateStaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDao staffDao = new StaffDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("staffId");
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
        if (idStr == null || idStr.trim().isEmpty() ||
            name == null || name.trim().isEmpty() ||
            specialization == null || specialization.trim().isEmpty() ||
            qualification == null || qualification.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            experienceStr == null || experienceStr.trim().isEmpty() ||
            gender == null || gender.trim().isEmpty() ||
            address == null || address.trim().isEmpty() ||
            status == null || status.trim().isEmpty()) {

            request.setAttribute("errorMessage", "All required fields must be filled!");
            redisplayEditForm(request, response, idStr);
            return;
        }

        try {
            int staffId = Integer.parseInt(idStr);
            int experience = Integer.parseInt(experienceStr);

            StaffModel staff = new StaffModel();
            staff.setStaffId(staffId);
            staff.setStaffName(name.trim());
            staff.setSpecialization(specialization.trim());
            staff.setQualification(qualification.trim());
            staff.setPhone(phone.trim());
            staff.setEmail(email.trim());
            staff.setExperience(experience);
            staff.setGender(gender.trim());
            staff.setAddress(address.trim());
            staff.setStatus(status.trim());

            boolean success = staffDao.updateStaff(staff);
            if (success) {
                new com.dao.DashboardDao().insertActivity("Staff profile updated: " + name.trim());
                response.sendRedirect(request.getContextPath() + "/admin/staff?success=2");
            } else {
                request.setAttribute("errorMessage", "Failed to update staff record: No rows affected.");
                redisplayEditForm(request, response, idStr);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Years of experience must be a valid number!");
            redisplayEditForm(request, response, idStr);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "MySQL Database Error: " + e.getMessage() + " (SQLState: " + e.getSQLState() + ")");
            redisplayEditForm(request, response, idStr);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            redisplayEditForm(request, response, idStr);
        }
    }

    private void redisplayEditForm(HttpServletRequest request, HttpServletResponse response, String idStr) 
            throws ServletException, IOException {
        try {
            int staffId = Integer.parseInt(idStr);
            StaffModel staff = staffDao.getStaffById(staffId);
            request.setAttribute("staff", staff);
            request.getRequestDispatcher("/WEB-INF/Admin_page/EditStaff.jsp")
                   .forward(request, response);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin/staff?error=system_error");
        }
    }
}

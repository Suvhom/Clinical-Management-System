package com.controller;

import java.io.IOException;

import com.dao.AdminDao;
import com.model.AdminModel;
import com.utils.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/update-admin", asyncSupported = true)
public class UpdateAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDao adminDao = new AdminDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String adminIdValue = request.getParameter("admin_id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        int adminId;
        try {
            adminId = Integer.parseInt(adminIdValue);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin/admins?error=1");
            return;
        }

        if (isEmpty(username) || isEmpty(password) || isEmpty(fullName)
                || isEmpty(email) || isEmpty(phone) || isEmpty(address)) {
            response.sendRedirect(request.getContextPath() + "/admin/edit-admin?id=" + adminId + "&error=1");
            return;
        }

        AdminModel admin = new AdminModel();
        admin.setAdminId(adminId);
        admin.setUsername(username.trim());
        admin.setPassword(PasswordUtil.getHashPassword(password.trim()));
        admin.setFullName(fullName.trim());
        admin.setEmail(email.trim());
        admin.setPhone(phone.trim());
        admin.setAddress(address.trim());

        boolean success = adminDao.updateAdmin(admin);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/admins?updated=1");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/edit-admin?id=" + adminId + "&error=1");
        }
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }
}

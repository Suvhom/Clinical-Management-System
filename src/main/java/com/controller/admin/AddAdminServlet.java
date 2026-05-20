package com.controller.admin;

import java.io.IOException;

import com.dao.AdminDao;
import com.model.AdminModel;
import com.utils.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/add-admin", asyncSupported = true)
public class AddAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDao adminDao = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/Admin_page/AddAdmin.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        if (isEmpty(username) || isEmpty(password) || isEmpty(fullName)
                || isEmpty(email) || isEmpty(phone) || isEmpty(address)) {
            response.sendRedirect(request.getContextPath() + "/admin/add-admin?error=1");
            return;
        }

        AdminModel admin = new AdminModel();
        admin.setUsername(username.trim());
        admin.setPassword(PasswordUtil.getHashPassword(password.trim()));
        admin.setFullName(fullName.trim());
        admin.setEmail(email.trim());
        admin.setPhone(phone.trim());
        admin.setAddress(address.trim());

        boolean success = adminDao.addAdmin(admin);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/admins?success=1");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/add-admin?error=1");
        }
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }
}

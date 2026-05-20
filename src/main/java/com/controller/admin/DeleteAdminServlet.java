package com.controller.admin;

import java.io.IOException;

import com.dao.AdminDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/delete-admin", asyncSupported = true)
public class DeleteAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDao adminDao = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/admins?error=1");
            return;
        }

        try {
            int adminId = Integer.parseInt(id);
            boolean success = adminDao.deleteAdmin(adminId);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/admins?deleted=1");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/admins?error=1");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/admins?error=1");
        }
    }
}

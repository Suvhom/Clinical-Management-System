package com.controller.admin;

import java.io.IOException;

import com.dao.AdminDao;
import com.model.AdminModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/edit-admin", asyncSupported = true)
public class EditAdminServlet extends HttpServlet {
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
            AdminModel admin = adminDao.getAdminById(adminId);

            if (admin == null) {
                response.sendRedirect(request.getContextPath() + "/admin/admins?error=1");
                return;
            }

            request.setAttribute("admin", admin);
            request.getRequestDispatcher("/WEB-INF/Admin_page/EditAdmin.jsp")
                   .forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/admins?error=1");
        }
    }
}

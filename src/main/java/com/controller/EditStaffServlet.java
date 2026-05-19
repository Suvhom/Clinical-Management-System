package com.controller;

import java.io.IOException;

import com.dao.StaffDao;
import com.model.StaffModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/edit-staff")
public class EditStaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDao staffDao = new StaffDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/staff");
            return;
        }

        try {
            int staffId = Integer.parseInt(idStr);
            StaffModel staff = staffDao.getStaffById(staffId);

            if (staff == null) {
                response.sendRedirect(request.getContextPath() + "/admin/staff");
                return;
            }

            request.setAttribute("staff", staff);
            request.getRequestDispatcher("/WEB-INF/Admin_page/EditStaff.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin/staff");
        }
    }
}

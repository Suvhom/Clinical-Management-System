package com.controller.admin;

import java.io.IOException;
import com.dao.StaffDao;
import com.dao.DashboardDao;
import com.model.StaffModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/delete-staff", asyncSupported = true)
public class DeleteStaffServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private StaffDao staffDao = new StaffDao();
    private DashboardDao dashboardDao = new DashboardDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.trim().isEmpty()) {
            try {
                int staffId = Integer.parseInt(idStr.trim());
                
                // Get staff name for log activity before deletion
                String staffName = "Staff #" + staffId;
                StaffModel staff = staffDao.getStaffById(staffId);
                if (staff != null) {
                    staffName = staff.getStaffName();
                }

                boolean success = staffDao.deleteStaff(staffId);
                if (success) {
                    // Log to dynamic dashboard activity tracking
                    dashboardDao.insertActivity("Deleted staff member: " + staffName);
                    
                    response.sendRedirect(request.getContextPath() + "/admin/staff?success=3");
                    return;
                }
            } catch (Exception e) {
                System.out.println("ERROR DELETING STAFF ID " + idStr + ": " + e.getMessage());
            }
        }
        response.sendRedirect(request.getContextPath() + "/admin/staff?error=true");
    }
}

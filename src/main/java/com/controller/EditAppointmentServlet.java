package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.dao.AddPatientDao;
import com.dao.AppointmentDao;
import com.model.AddPatientModel;
import com.model.AppointmentModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/edit-appointment", asyncSupported = true)
public class EditAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AppointmentDao appointmentDao = new AppointmentDao();
    private AddPatientDao patientDao = new AddPatientDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/appointments");
            return;
        }

        try {
            int appointmentId = Integer.parseInt(idStr);
            AppointmentModel appt = appointmentDao.getAppointmentById(appointmentId);
            ArrayList<AddPatientModel> patientsList = patientDao.getAllPatients();
            ArrayList<String[]> staffList = appointmentDao.getAvailableStaff(); // Fetch available staff members

            if (appt == null) {
                response.sendRedirect(request.getContextPath() + "/admin/appointments");
                return;
            }

            request.setAttribute("appointment", appt);
            request.setAttribute("patientsList", patientsList);
            request.setAttribute("staffList", staffList); // Attach available staff members

            request.getRequestDispatcher("/WEB-INF/Admin_page/EditAppointment.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin/appointments");
        }
    }
}

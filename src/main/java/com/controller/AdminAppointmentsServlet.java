package com.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.stream.Collectors;

import com.dao.AppointmentDao;
import com.model.AppointmentModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/appointments", asyncSupported = true)
public class AdminAppointmentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AppointmentDao appointmentDao = new AppointmentDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get filter and search parameters
        String tabFilter = request.getParameter("filter"); // all, today, upcoming, pending
        if (tabFilter == null) {
            tabFilter = "all";
        }

        String search = request.getParameter("search"); // Search query keyword
        if (search != null) {
            search = search.trim().toLowerCase();
        }

        // Fetch all appointments from DAO
        ArrayList<AppointmentModel> allAppointments = appointmentDao.getAllAppointments();

        // 1. Apply Tab Date/Status Filters
        final Date today = new Date(System.currentTimeMillis());
        ArrayList<AppointmentModel> filtered = new ArrayList<>();

        for (AppointmentModel appt : allAppointments) {
            boolean keep = false;
            
            if ("all".equalsIgnoreCase(tabFilter)) {
                keep = true;
            } else if ("today".equalsIgnoreCase(tabFilter)) {
                // Check if appointment date matches today's date
                if (appt.getAppointmentDate().toString().equals(today.toString())) {
                    keep = true;
                }
            } else if ("upcoming".equalsIgnoreCase(tabFilter)) {
                // Check if appointment is in the future
                if (appt.getAppointmentDate().after(today)) {
                    keep = true;
                }
            } else if ("pending".equalsIgnoreCase(tabFilter)) {
                // Check if status is Pending
                if ("Pending".equalsIgnoreCase(appt.getStatus())) {
                    keep = true;
                }
            }
            
            if (keep) {
                filtered.add(appt);
            }
        }

        // 2. Apply Text Search Filter (patient name, staff ID, reason, status)
        if (search != null && !search.isEmpty()) {
            final String finalSearch = search;
            filtered = filtered.stream()
                .filter(appt -> 
                    (appt.getPatientName() != null && appt.getPatientName().toLowerCase().contains(finalSearch)) ||
                    (String.valueOf(appt.getStaffId()).contains(finalSearch)) ||
                    (appt.getReason() != null && appt.getReason().toLowerCase().contains(finalSearch)) ||
                    (appt.getStatus() != null && appt.getStatus().toLowerCase().contains(finalSearch))
                )
                .collect(Collectors.toCollection(ArrayList::new));
        }

        // Set request attributes
        request.setAttribute("appointmentsList", filtered);
        request.setAttribute("currentFilter", tabFilter);
        request.setAttribute("currentSearch", search != null ? search : "");

        request.getRequestDispatcher("/WEB-INF/Admin_page/AdminAppointments.jsp")
               .forward(request, response);
    }
}

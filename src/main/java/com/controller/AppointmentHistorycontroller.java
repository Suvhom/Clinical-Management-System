package com.controller;

import java.io.IOException;
import java.util.List;

import com.model.AppointmentHistorymodel;
import com.service.AppointmentHistoryservice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/appointment-history", asyncSupported = true)
public class AppointmentHistorycontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private AppointmentHistoryservice service = new AppointmentHistoryservice();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        Integer patientId = getPatientIdFromSession(session);

        if (patientId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String selectedStatus = normalizeStatus(request.getParameter("status"));
        Integer selectedAppointmentId = getIntegerParameter(request.getParameter("view"));

        List<AppointmentHistorymodel> appointments =
                service.getAppointmentsByPatientId(patientId, selectedStatus);

        request.setAttribute("appointments", appointments);
        request.setAttribute("selectedStatus", selectedStatus);
        request.setAttribute("selectedAppointmentId", selectedAppointmentId);

        request.getRequestDispatcher("/WEB-INF/User_Pages/AppointmentHistory.jsp")
               .forward(request, response);
    }

    private Integer getPatientIdFromSession(HttpSession session) {
        if (session == null || session.getAttribute("patient_id") == null) {
            return null;
        }

        Object patientIdValue = session.getAttribute("patient_id");

        if (patientIdValue instanceof Number) {
            return ((Number) patientIdValue).intValue();
        }

        if (patientIdValue instanceof String) {
            try {
                return Integer.parseInt(((String) patientIdValue).trim());
            } catch (NumberFormatException e) {
                return null;
            }
        }

        return null;
    }

    private Integer getIntegerParameter(String value) {
        if (value == null || value.trim().isEmpty()) {
            return null;
        }

        try {
            return Integer.parseInt(value.trim());
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private String normalizeStatus(String status) {
        if (status == null) {
            return "all";
        }

        String value = status.toLowerCase();
        if (value.equals("upcoming") || value.equals("completed") || value.equals("cancelled")) {
            return value;
        }

        return "all";
    }
}

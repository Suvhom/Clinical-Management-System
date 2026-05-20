package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.*;
import com.model.BookAppointmentmodel;
import com.service.BookAppointmentservice;

@WebServlet(asyncSupported = true, urlPatterns = { "/AppointmentHistory" })
public class AppointmentHistorycontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookAppointmentservice service = new BookAppointmentservice();

    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("MMM dd, yyyy");
    private static final DateTimeFormatter TIME_FORMATTER = DateTimeFormatter.ofPattern("hh:mm a");

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer patientId = getPatientIdFromSession(session);

        if (patientId == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        List<BookAppointmentmodel> appointments = service.getAppointmentsByPatientId(patientId);
        request.setAttribute("appointments", buildAppointmentHistory(appointments));

        request.getRequestDispatcher("/WEB-INF/User_Pages/AppointmentHistory.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private Integer getPatientIdFromSession(HttpSession session) {
        if (session == null || session.getAttribute("patient_id") == null) {
            return null;
        }

        Object value = session.getAttribute("patient_id");

        if (value instanceof Number) {
            return ((Number) value).intValue();
        }

        if (value instanceof String) {
            try {
                return Integer.parseInt(((String) value).trim());
            } catch (NumberFormatException e) {
                return null;
            }
        }

        return null;
    }

    private List<AppointmentHistoryView> buildAppointmentHistory(List<BookAppointmentmodel> appointments) {
        List<AppointmentHistoryView> history = new ArrayList<>();

        for (BookAppointmentmodel appointment : appointments) {
            history.add(new AppointmentHistoryView(
                    formatDate(appointment.getAppointmentDate()),
                    formatTime(appointment.getAppointmentTime()),
                    getProviderName(appointment.getStaffName()),
                    getTreatment(appointment),
                    formatStatus(appointment.getStatus()),
                    appointment.getStatusCssClass(),
                    getActionLabel(appointment.getStatus())
            ));
        }

        return history;
    }

    private String formatDate(String value) {
        try {
            return LocalDate.parse(value).format(DATE_FORMATTER);
        } catch (Exception e) {
            return value == null ? "Date not set" : value;
        }
    }

    private String formatTime(String value) {
        try {
            return LocalTime.parse(value).format(TIME_FORMATTER);
        } catch (Exception e) {
            return value == null ? "Time not set" : value;
        }
    }

    private String getProviderName(String staffName) {
        return staffName == null || staffName.trim().isEmpty()
                ? "Assigned Therapist"
                : "Dr. " + staffName;
    }

    private String getTreatment(BookAppointmentmodel appointment) {
        if (appointment.getReason() != null && !appointment.getReason().trim().isEmpty()) {
            return appointment.getReason();
        }

        if (appointment.getSpecialization() != null && !appointment.getSpecialization().trim().isEmpty()) {
            return appointment.getSpecialization();
        }

        return "Physiotherapy Session";
    }

    private String formatStatus(String value) {
        if (value == null || value.trim().isEmpty()) {
            return "Upcoming";
        }

        String status = value.trim();
        return status.substring(0, 1).toUpperCase() + status.substring(1).toLowerCase();
    }

    private String getActionLabel(String status) {
        if (status == null) return "Reschedule";

        String value = status.toLowerCase();

        if (value.equals("completed")) return "View Details";
        if (value.equals("cancelled")) return "Book Again";

        return "Reschedule";
    }

    public static class AppointmentHistoryView {
        private String appointmentDate, appointmentTime, providerName, treatment, status, statusCssClass, actionLabel;

        public AppointmentHistoryView(String appointmentDate, String appointmentTime, String providerName,
                String treatment, String status, String statusCssClass, String actionLabel) {
            this.appointmentDate = appointmentDate;
            this.appointmentTime = appointmentTime;
            this.providerName = providerName;
            this.treatment = treatment;
            this.status = status;
            this.statusCssClass = statusCssClass;
            this.actionLabel = actionLabel;
        }

        public String getAppointmentDate() { return appointmentDate; }
        public String getAppointmentTime() { return appointmentTime; }
        public String getProviderName() { return providerName; }
        public String getTreatment() { return treatment; }
        public String getStatus() { return status; }
        public String getStatusCssClass() { return statusCssClass; }
        public String getActionLabel() { return actionLabel; }
    }
}
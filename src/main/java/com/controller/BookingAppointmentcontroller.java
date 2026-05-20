package com.controller;

import java.io.IOException;

import com.model.BookAppointmentmodel;
import com.service.BookAppointmentservice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(asyncSupported = true, urlPatterns = { "/BookingAppointment" })
public class BookingAppointmentcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BookAppointmentservice service = new BookAppointmentservice();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/User_Pages/BookAppointment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String staffIdStr = request.getParameter("staff_Id");
        String appointmentDate = request.getParameter("appointmentDate");
        String appointmentTime = request.getParameter("appointmentTime");
        String reason = request.getParameter("reason");

        if (isBlank(staffIdStr) || isBlank(appointmentDate) || isBlank(appointmentTime) || isBlank(reason)) {

            request.setAttribute("error", "Please fill up the form.");
            request.getRequestDispatcher("/WEB-INF/User_Pages/BookAppointment.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession(false);
        Integer patientId = getPatientIdFromSession(session);

        if (patientId == null) {
            request.setAttribute("error", "Please login before booking appointment.");
            request.getRequestDispatcher("/WEB-INF/User_Pages/BookAppointment.jsp").forward(request, response);
            return;
        }

        try {
            int staffId = Integer.parseInt(staffIdStr);

            BookAppointmentmodel appointment = new BookAppointmentmodel(
                    patientId,
                    staffId,
                    appointmentDate,
                    appointmentTime,
                    reason
            );

            boolean success = service.bookAppointment(appointment);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/AppointmentHistory");
            } else {
                request.setAttribute("error", "Appointment booking failed. Please try again.");
                request.getRequestDispatcher("/WEB-INF/User_Pages/BookAppointment.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong while booking appointment.");
            request.getRequestDispatcher("/WEB-INF/User_Pages/BookAppointment.jsp").forward(request, response);
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
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
}

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

@WebServlet(asyncSupported = true, urlPatterns = { "/AppointmentHistory" })
public class AppointmentHistorycontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private AppointmentHistoryservice service = new AppointmentHistoryservice();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("patient_id") == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        int patientId = (int) session.getAttribute("patient_id");

        List<AppointmentHistorymodel> appointments =
                service.getAppointmentsByPatientId(patientId);

        request.setAttribute("appointments", appointments);

        request.getRequestDispatcher("/WEB-INF/User_Pages/AppointmentHistory.jsp")
               .forward(request, response);
    }
}
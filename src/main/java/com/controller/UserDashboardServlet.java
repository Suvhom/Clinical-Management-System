package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Calendar;
import com.model.PatientModel;
import com.dao.PatientDao;

@WebServlet("/UserDashboard")
public class UserDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session guard
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("patient") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get patient from session
        PatientModel patient = (PatientModel) session.getAttribute("patient");

        try {
            // Refresh from DB
            PatientDao dao = new PatientDao();
            PatientModel freshPatient = dao.getPatientById(patient.getPatientId());

            if (freshPatient == null) {
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Build greeting based on time
            Calendar cal = Calendar.getInstance();
            int hour = cal.get(Calendar.HOUR_OF_DAY);
            String greeting = hour < 12 ? "Good morning"
                            : hour < 17 ? "Good afternoon"
                            : "Good evening";

            // Build avatar HTML in servlet 
            String imgTag;
            String rawImage = freshPatient.getImage();
            if (rawImage != null && !rawImage.isEmpty()) {
                imgTag = "<img src=\"data:image/*;base64," + rawImage
                       + "\" alt=\"Profile\" class=\"avatar a1\">";
            } else {
                imgTag = "<b class=\"avatar a1\"></b>";
            }

            // Passes everything to JSP as request attributes
            session.setAttribute("patient", freshPatient);
            request.setAttribute("patient",  freshPatient);
            request.setAttribute("greeting", greeting);
            request.setAttribute("imgTag",   imgTag);

            request.getRequestDispatcher("/pages/UserDashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
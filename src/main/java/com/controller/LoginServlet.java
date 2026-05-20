package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.model.PatientModel;
import com.dao.PatientDao;
import com.utils.PasswordUtil;
import com.utils.CookieUtil;  

@WebServlet(urlPatterns = "/login", asyncSupported = true)
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("patient") != null) {
            response.sendRedirect(request.getContextPath() + "/UserDashboard");
            return;
        }

        String username = CookieUtil.getCookie(request, "username");
        if (username != null) {
            try {
                PatientDao dao = new PatientDao();
                PatientModel patient = dao.getPatientByUsername(username);
                if (patient != null) {
                    HttpSession newSession = request.getSession(true);
                    setPatientSession(newSession, patient);
                    newSession.setMaxInactiveInterval(30 * 60);
                    System.out.println("LOGIN DEBUG: Existing patient session restored from cookie.");
                    System.out.println("LOGIN DEBUG: Redirecting to /UserDashboard");
                    response.sendRedirect(request.getContextPath() + "/UserDashboard");
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String loginId = request.getParameter("patientAccessInput");
        String password = request.getParameter("patientSecretInput");

        System.out.println("LOGIN DEBUG: Entered username/email = " + loginId);

        if (loginId == null || loginId.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            System.out.println("LOGIN DEBUG: Login failed because username/email or password was empty.");
            request.setAttribute("errorMessage", "Invalid username/email or password.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        try {
            PatientDao dao = new PatientDao();
            PatientModel patient = dao.getPatientByUsernameOrEmail(loginId.trim());

            if (patient == null) {
                System.out.println("LOGIN DEBUG: Patient found = false");
                request.setAttribute("errorMessage", "Invalid username/email or password.");
                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                return;
            }

            System.out.println("LOGIN DEBUG: Patient found = true");
            boolean passwordMatched = PasswordUtil.checkPassword(password, patient.getPassword());
            System.out.println("LOGIN DEBUG: Password matched = " + passwordMatched);

            if (!passwordMatched) {
                request.setAttribute("errorMessage", "Invalid username/email or password.");
                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                return;
            }

            // Creates session
            HttpSession session = request.getSession(true);
            setPatientSession(session, patient);
            session.setMaxInactiveInterval(30 * 60);

            System.out.println("LOGIN DEBUG: Login successful for patient ID = " + patient.getPatientId());
            System.out.println("LOGIN DEBUG: Redirecting to /UserDashboard");
            response.sendRedirect(request.getContextPath() + "/UserDashboard");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("LOGIN DEBUG: Login failed because an exception occurred.");
            request.setAttribute("errorMessage", "Invalid username/email or password.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
        }
    }

    private void setPatientSession(HttpSession session, PatientModel patient) {
        session.setAttribute("patient", patient);
        session.setAttribute("username", patient.getUsername());
        session.setAttribute("patient_id", patient.getPatientId());
        session.setAttribute("patientId", patient.getPatientId());
        session.setAttribute("patientName", patient.getPatientName());
        session.setAttribute("role", "patient");
    }
}

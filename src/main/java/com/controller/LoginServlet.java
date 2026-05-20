package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.model.PatientModel;
import com.dao.PatientDao;
import com.utils.PasswordUtil;
import com.utils.CookieUtil;  

@WebServlet("/login")
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
                    newSession.setAttribute("patient",    patient);
                    newSession.setAttribute("username",   patient.getUsername());
                    newSession.setAttribute("patient_id", patient.getPatientId());
                    newSession.setMaxInactiveInterval(30 * 60);
                    response.sendRedirect(request.getContextPath() + "/UserDashboard");
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email    = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Username and password are required.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        try {
            PatientDao dao = new PatientDao();
            PatientModel patient = dao.getPatientByUsername(email.trim());

            if (patient == null) {
                request.setAttribute("errorMessage", "No account found with that username.");
                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                return;
            }

            if (!PasswordUtil.checkPassword(password, patient.getPassword())) {
                request.setAttribute("errorMessage", "Incorrect password.");
                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                return;
            }

            // Creates session
            HttpSession session = request.getSession(true);
            session.setAttribute("patient",    patient);
            session.setAttribute("username",   patient.getUsername());
            session.setAttribute("patient_id", patient.getPatientId());
            session.setMaxInactiveInterval(30 * 60);

            response.sendRedirect(request.getContextPath() + "/UserDashboard");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong. Please try again.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
        }
    }
}
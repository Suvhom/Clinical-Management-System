package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.model.PatientModel;
import com.dao.PatientDao;
import com.utils.PasswordUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            PatientDao dao = new PatientDao();
            PatientModel patient = dao.getPatientByUsername(username);

            if (patient == null) {
                request.setAttribute("errorMessage", "No account found with that email.");
                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                return;
            }

            if (!PasswordUtil.checkPassword(password, patient.getPassword())) {
                request.setAttribute("errorMessage", "Incorrect password.");
                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                return;
            }

            // Login success — save patient in session
            HttpSession session = request.getSession();
            session.setAttribute("patient", patient);
            session.setAttribute("username", patient.getUsername());

            response.sendRedirect(request.getContextPath() + "/pages/UserDashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong. Please try again.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
        }
    }
}
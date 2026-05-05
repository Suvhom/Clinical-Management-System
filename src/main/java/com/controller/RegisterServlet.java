package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import com.dao.PatientDao;
import com.utils.PasswordUtil;

@WebServlet("/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/pages/register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String patientName = request.getParameter("fullName");
        String email       = request.getParameter("email");
        String password    = request.getParameter("password");
        String confirm     = request.getParameter("confirmPassword");
        String username = email;

        if (password == null || !password.equals(confirm)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
            return;
        }

        // Hash the password before saving
        String hashedPassword = PasswordUtil.getHashPassword(password);

        // Handle image
        String imageBase64 = null;
        try {
            Part filePart = request.getPart("image");
            if (filePart != null && filePart.getSize() > 0) {
                InputStream is = filePart.getInputStream();
                byte[] imageBytes = is.readAllBytes();
                imageBase64 = Base64.getEncoder().encodeToString(imageBytes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // It inserts into DB pass empty strings for fields not in form
        try {
            PatientDao dao = new PatientDao();
            dao.insertPatient(patientName, email, "", "", "", "", username, hashedPassword, imageBase64);
            System.out.println("Patient inserted successfully!");
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        } catch (Exception e) {
            System.out.println("Insert failed: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
        }
    }
}
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

@WebServlet(urlPatterns = "/register", asyncSupported = true)
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Collect all form values
        String fullName        = request.getParameter("fullName");
        String email           = request.getParameter("email");
        String phone           = request.getParameter("phone");
        String gender          = request.getParameter("gender");
        String address         = request.getParameter("address");
        String dateOfBirth     = request.getParameter("dateOfBirth");
        String password        = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Create DAO here at the top so it's available everywhere
        PatientDao dao = new PatientDao();

        // Full name is required
        if (fullName == null || fullName.trim().isEmpty()) {
            forwardWithError(request, response, "Please enter your full name.");
            return;
        }

        // Checking if the email is empty of not
        if (email == null || email.trim().isEmpty()) {
            forwardWithError(request, response, "Please enter your email address.");
            return;
        }

        // checking if the email exists in database or not
        try {
            if (dao.getPatientByUsername(email) != null) {
                forwardWithError(request, response, "An account with this email already exists. Please log in.");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            forwardWithError(request, response, "Something went wrong while checking your email. Please try again.");
            return;
        }

        // Password must be at least 8 characters
        if (password == null || password.length() < 8) {
            forwardWithError(request, response, "Password must be at least 8 characters long.");
            return;
        }

        // Both passwords must match
        if (!password.equals(confirmPassword)) {
            forwardWithError(request, response, "Passwords do not match. Please try again.");
            return;
        }

        // Hash the password before saving
        String hashedPassword = PasswordUtil.getHashPassword(password);

        // Handle profile picture upload
        String imageBase64 = null;
        try {
            Part imagePart = request.getPart("image");
            if (imagePart != null && imagePart.getSize() > 0) {
                if (!imagePart.getContentType().startsWith("image/")) {
                    forwardWithError(request, response, "Only image files are allowed for the profile picture.");
                    return;
                }
                InputStream imageStream = imagePart.getInputStream();
                imageBase64 = Base64.getEncoder().encodeToString(imageStream.readAllBytes());
            }
        } catch (Exception e) {
            // Picture upload failed — not critical, just skip it
            e.printStackTrace();
        }

        // All good — save the new patient to the database
        try {
            dao.insertPatient(fullName, email, phone, gender, address, dateOfBirth, email, hashedPassword, imageBase64);
            response.sendRedirect(request.getContextPath() + "/login");
        } catch (Exception e) {
            e.printStackTrace();
            forwardWithError(request, response, "Something went wrong on our end. Please try again.");
        }
    }

    // Attaching error message and stay on the register page
    private void forwardWithError(HttpServletRequest request, HttpServletResponse response, String message) 
    		throws ServletException, IOException {
        request.setAttribute("errorMessage", message);
        request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
    }
}
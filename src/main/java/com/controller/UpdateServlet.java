package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import com.model.PatientModel;
import com.service.PatientService;

@WebServlet("/update")
@MultipartConfig
public class UpdateServlet extends HttpServlet {

    private PatientService service = new PatientService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        PatientModel patient = (PatientModel) session.getAttribute("patient");

        if (patient == null) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }

        String type     = request.getParameter("type");
        String username = patient.getPatientName();

        if ("image".equals(type)) {
            try {
                Part filePart = request.getPart("image");
                if (filePart != null && filePart.getSize() > 0) {
                    InputStream is = filePart.getInputStream();
                    byte[] imageBytes = is.readAllBytes();
                    String imageBase64 = Base64.getEncoder().encodeToString(imageBytes);

                    boolean success = service.updateImage(username, imageBase64);
                    if (success) {
                        patient.setImage(imageBase64);
                        session.setAttribute("student", patient);
                        request.setAttribute("success", "Profile picture updated successfully!");
                    } else {
                        request.setAttribute("error", "Failed to update picture. Try again.");
                    }
                } else {
                    request.setAttribute("error", "Please select an image.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Something went wrong.");
            }

        } else if ("password".equals(type)) {
            String currentPassword = request.getParameter("currentPassword");
            String newPassword     = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            if (!patient.getPassword().equals(currentPassword)) {
                request.setAttribute("error", "Current password is incorrect.");
            } else if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("error", "New passwords do not match.");
            } else if (newPassword.length() < 6) {
                request.setAttribute("error", "Password must be at least 6 characters.");
            } else {
                boolean success = service.updatePassword(username, newPassword);
                if (success) {
                    patient.setPassword(newPassword);
                    session.setAttribute("student", patient);
                    request.setAttribute("success", "Password updated successfully!");
                } else {
                    request.setAttribute("error", "Failed to update password. Try again.");
                }
            }
        }

        request.getRequestDispatcher("/pages/UpdateProfile.jsp").forward(request, response);
    }
}
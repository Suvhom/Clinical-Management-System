package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.model.PatientModel;

@WebServlet("/UpdateProfile")
@MultipartConfig
public class UpdateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("patient") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        PatientModel patient = (PatientModel) session.getAttribute("patient");

        // Build avatar
        String imgTag;
        String rawImage = patient.getImage();
        if (rawImage != null && !rawImage.isEmpty()) {
            imgTag = "<img class=\"profile-img\" src=\"data:image/*;base64,"
                   + rawImage + "\" alt=\"Profile Picture\">";
        } else {
            imgTag = "<div class=\"profile-img-placeholder\">?</div>";
        }

        // Build name and username HTML
        String nameTag     = "<h2>" + patient.getPatientName() + "</h2>";
        String usernameTag = "<p class=\"username-label\">" + patient.getUsername() + "</p>";

        // Build success/error message HTML from session
        String successMsg = "";
        String errorMsg   = "";
        if (session.getAttribute("success") != null) {
            successMsg = "<p class=\"success\">" + session.getAttribute("success") + "</p>";
            session.removeAttribute("success");
        }
        if (session.getAttribute("error") != null) {
            errorMsg = "<p class=\"error\">" + session.getAttribute("error") + "</p>";
            session.removeAttribute("error");
        }

        //Set all as request attributes
        request.setAttribute("imgTag",      imgTag);
        request.setAttribute("nameTag",     nameTag);
        request.setAttribute("usernameTag", usernameTag);
        request.setAttribute("successMsg",  successMsg);
        request.setAttribute("errorMsg",    errorMsg);

        request.getRequestDispatcher("/pages/UpdateProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        PatientModel patient = (PatientModel) session.getAttribute("patient");

        if (patient == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String type     = request.getParameter("type");
        String username = patient.getUsername();

        if ("image".equals(type)) {
            try {
                Part filePart = request.getPart("image");
                if (filePart != null && filePart.getSize() > 0) {
                    java.io.InputStream is = filePart.getInputStream();
                    byte[] imageBytes = is.readAllBytes();
                    String imageBase64 = java.util.Base64.getEncoder().encodeToString(imageBytes);

                    com.dao.PatientDao dao = new com.dao.PatientDao();
                    dao.updateImage(username, imageBase64);

                    patient.setImage(imageBase64);
                    session.setAttribute("patient", patient);
                    session.setAttribute("success", "Profile picture updated successfully!");
                } else {
                    session.setAttribute("error", "Please select an image.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("error", "Something went wrong.");
            }

        } else if ("password".equals(type)) {
            String currentPassword = request.getParameter("currentPassword");
            String newPassword     = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            if (!patient.getPassword().equals(currentPassword)) {
                session.setAttribute("error", "Current password is incorrect.");
            } else if (!newPassword.equals(confirmPassword)) {
                session.setAttribute("error", "New passwords do not match.");
            } else if (newPassword.length() < 6) {
                session.setAttribute("error", "Password must be at least 6 characters.");
            } else {
                try {
                    com.dao.PatientDao dao = new com.dao.PatientDao();
                    dao.updatePassword(username, newPassword);
                    patient.setPassword(newPassword);
                    session.setAttribute("patient", patient);
                    session.setAttribute("success", "Password updated successfully!");
                } catch (Exception e) {
                    e.printStackTrace();
                    session.setAttribute("error", "Failed to update password.");
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/UserDashboard");
    }
}
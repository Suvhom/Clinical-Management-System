package com.controller;

import java.io.IOException;

import com.dao.InquiryDao;
import com.model.InquiryModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/contact-inquiry", asyncSupported = true)
public class ContactInquiryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String doctorPreference = request.getParameter("doctorPreference");
        String description = request.getParameter("description");

        if (isBlank(firstName) || isBlank(lastName) || isBlank(email)) {
            response.sendRedirect(request.getContextPath() + "/contact?error=missing");
            return;
        }

        if (isBlank(description)) {
            response.sendRedirect(request.getContextPath() + "/contact?error=description");
            return;
        }

        InquiryModel inquiry = new InquiryModel(
                firstName.trim(),
                lastName.trim(),
                email.trim(),
                clean(phone),
                clean(doctorPreference),
                description.trim()
        );

        InquiryDao dao = new InquiryDao();
        boolean saved = dao.saveInquiry(inquiry);

        if (saved) {
            response.sendRedirect(request.getContextPath() + "/contact?success=1");
        } else {
            response.sendRedirect(request.getContextPath() + "/contact?error=1");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/contact");
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }

    private String clean(String value) {
        if (value == null || value.trim().isEmpty()) {
            return null;
        }
        return value.trim();
    }
}

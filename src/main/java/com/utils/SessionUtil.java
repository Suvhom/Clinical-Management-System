package com.utils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.model.PatientModel;

public class SessionUtil {

    // Store any value in session
    public static void setAttribute(HttpServletRequest request, String key, Object value) {
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(30 * 60);
        session.setAttribute(key, value);
    }

    // Get any value from session
    public static Object getAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            return session.getAttribute(key);
        }
        return null;
    }

    // Destroy the session on logout
    public static void invalidate(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }

    // Check if patient is logged in — use this in every protected servlet
    public static PatientModel getLoggedInPatient(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return null;
        }
        PatientModel patient = (PatientModel) session.getAttribute("patient");
        if (patient == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return null;
        }
        return patient;
    }
}
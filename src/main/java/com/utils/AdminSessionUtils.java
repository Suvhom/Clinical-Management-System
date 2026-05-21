package com.utils;

import com.model.AdminModel;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AdminSessionUtils {
    private static final int SESSION_TIMEOUT = 30 * 60;

    public static void setAdminSession(HttpServletRequest request, AdminModel admin) {
        HttpSession session = request.getSession(true);
        session.setMaxInactiveInterval(SESSION_TIMEOUT);
        session.setAttribute("role", "admin");
        session.setAttribute("adminId", admin.getAdminId());
        session.setAttribute("adminName", admin.getFullName());
        session.setAttribute("adminEmail", admin.getEmail());
        session.setAttribute("adminUsername", admin.getUsername());
    }

    public static boolean isAdminLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null
                && "admin".equals(session.getAttribute("role"))
                && session.getAttribute("adminId") != null;
    }

    public static AdminModel getLoggedInAdmin(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession(false);

        if (session == null || !"admin".equals(session.getAttribute("role"))
                || session.getAttribute("adminId") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return null;
        }

        AdminModel admin = new AdminModel();
        admin.setAdminId((Integer) session.getAttribute("adminId"));
        admin.setFullName((String) session.getAttribute("adminName"));
        admin.setEmail((String) session.getAttribute("adminEmail"));
        admin.setUsername((String) session.getAttribute("adminUsername"));
        return admin;
    }

    public static Integer getAdminId(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return null;
        }

        Object adminId = session.getAttribute("adminId");
        return adminId instanceof Integer ? (Integer) adminId : null;
    }

    public static String getAdminName(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return null;
        }

        Object adminName = session.getAttribute("adminName");
        return adminName != null ? adminName.toString() : null;
    }

    public static void invalidate(HttpServletRequest request, HttpServletResponse response) {
        CookieUtil.deleteCookie(response, "adminUsername");

        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
}

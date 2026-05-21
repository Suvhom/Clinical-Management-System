package com.filter;

import java.io.IOException;

import com.dao.AdminDao;
import com.dao.PatientDao;
import com.model.AdminModel;
import com.model.PatientModel;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {
    "/UserDashboard",
    "/UpdateProfile",
    "/BookingAppointment",
    "/appointment-history",
    "/user/exercise-plans",
    "/admin/*"
})
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpServletResponse httpResp = (HttpServletResponse) response;

        String uri = httpReq.getRequestURI();
        String contextPath = httpReq.getContextPath();

        if (uri.equals(contextPath + "/admin/login")
                || uri.equals(contextPath + "/admin/logout")
                || uri.equals(contextPath + "/logout")) {
            chain.doFilter(request, response);
            return;
        }

        if (uri.startsWith(contextPath + "/admin/")) {
            handleAdminFilter(httpReq, httpResp, chain);
        } else {
            handlePatientFilter(httpReq, httpResp, chain);
        }
    }

    private void handleAdminFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpSession session = request.getSession(false);

        if (session != null && "admin".equals(session.getAttribute("role"))
                && session.getAttribute("adminId") != null) {
            setNoCacheHeaders(response);
            chain.doFilter(request, response);
            return;
        }

        String adminUsername = getCookieValue(request, "adminUsername");

        if (adminUsername != null) {
            AdminDao dao = new AdminDao();
            AdminModel admin = dao.getAdminByUsername(adminUsername);

            if (admin != null) {
                HttpSession newSession = request.getSession(true);
                newSession.setMaxInactiveInterval(30 * 60);
                newSession.setAttribute("role", "admin");
                newSession.setAttribute("adminId", admin.getAdminId());
                newSession.setAttribute("adminName", admin.getFullName());
                newSession.setAttribute("adminEmail", admin.getEmail());
                newSession.setAttribute("adminUsername", admin.getUsername());

                setNoCacheHeaders(response);
                chain.doFilter(request, response);
                return;
            }
        }

        response.sendRedirect(request.getContextPath() + "/admin/login");
    }

    private void handlePatientFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("patient") != null) {
            setNoCacheHeaders(response);
            chain.doFilter(request, response);
            return;
        }

        String username = getCookieValue(request, "username");

        if (username != null) {
            try {
                PatientDao dao = new PatientDao();
                PatientModel patient = dao.getPatientByUsername(username);

                if (patient != null) {
                    HttpSession newSession = request.getSession(true);
                    newSession.setMaxInactiveInterval(30 * 60);
                    newSession.setAttribute("patient", patient);
                    newSession.setAttribute("username", patient.getUsername());
                    newSession.setAttribute("patient_id", patient.getPatientId());
                    newSession.setAttribute("patientId", patient.getPatientId());
                    newSession.setAttribute("patientName", patient.getPatientName());
                    newSession.setAttribute("role", "patient");

                    setNoCacheHeaders(response);
                    chain.doFilter(request, response);
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/login");
    }

    private String getCookieValue(HttpServletRequest request, String cookieName) {
        Cookie[] cookies = request.getCookies();

        if (cookies == null) {
            return null;
        }

        for (Cookie cookie : cookies) {
            if (cookieName.equals(cookie.getName())) {
                return cookie.getValue();
            }
        }

        return null;
    }

    private void setNoCacheHeaders(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}

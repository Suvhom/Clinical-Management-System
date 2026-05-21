package com.controller.admin;

import java.io.IOException;

import com.dao.AdminDao;
import com.model.AdminModel;
import com.utils.AdminSessionUtils;
import com.utils.CookieUtil;
import com.utils.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/login", asyncSupported = true)
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int COOKIE_MAX_AGE = 30 * 60;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (AdminSessionUtils.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            return;
        }

        String usernameFromCookie = CookieUtil.getCookie(request, "adminUsername");

        if (usernameFromCookie != null) {
            AdminDao dao = new AdminDao();
            AdminModel admin = dao.getAdminByUsername(usernameFromCookie);

            if (admin != null) {
                AdminSessionUtils.setAdminSession(request, admin);
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                return;
            }
        }

        request.setAttribute("errorMessage", "");
        request.setAttribute("usernameValue", "");
        request.getRequestDispatcher("/WEB-INF/Admin_page/AdminLogin.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("adminAccessInput");
        String password = request.getParameter("adminSecretInput");

        if (isEmpty(username)) {
            forwardWithError(request, response, "Email or username is required.", "");
            return;
        }

        if (isEmpty(password)) {
            forwardWithError(request, response, "Password is required.", username.trim());
            return;
        }

        AdminDao dao = new AdminDao();
        AdminModel admin = dao.getAdminByUsername(username.trim());

        if (admin == null) {
            forwardWithError(request, response, "No account found with that email or username.", username.trim());
            return;
        }

        boolean passwordMatch = PasswordUtil.checkPassword(password.trim(), admin.getPassword());

        if (!passwordMatch) {
            forwardWithError(request, response, "Incorrect password. Please try again.", username.trim());
            return;
        }

        AdminSessionUtils.setAdminSession(request, admin);
        CookieUtil.setCookie(response, "adminUsername", admin.getUsername(), COOKIE_MAX_AGE);

        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
    }

    private void forwardWithError(HttpServletRequest request, HttpServletResponse response,
                                  String message, String enteredUsername)
            throws ServletException, IOException {
        request.setAttribute("errorMessage", message);
        request.setAttribute("usernameValue", enteredUsername != null ? enteredUsername : "");
        request.getRequestDispatcher("/WEB-INF/Admin_page/AdminLogin.jsp").forward(request, response);
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }
}

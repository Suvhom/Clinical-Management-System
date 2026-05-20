package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.utils.CookieUtil;   

@WebServlet(urlPatterns = "/logout", asyncSupported = true)
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Destroy session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        CookieUtil.deleteCookie(response, "username");

        response.sendRedirect(request.getContextPath() + "/login");
    }
}
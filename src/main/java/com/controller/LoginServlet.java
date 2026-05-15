package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.hashing.model.StudentModel;
import com.hashing.service.StudentService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private PatientService service = new PatientService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        PatientModel student = service.getStudentByUsername(username);

        if (student == null) {
            request.setAttribute("error", "User not found.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        // Simple password check (plain text for now — hash later with PasswordUtil)
        if (!student.getPassword().equals(password)) {
            request.setAttribute("error", "Incorrect password.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        // Create session
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("student", student);

        // Create cookie
        Cookie cookie = new Cookie("username", username);
        cookie.setMaxAge(60 * 60 * 24); // 1 day
        response.addCookie(cookie);

        response.sendRedirect(request.getContextPath() + "/pages/profile.jsp");
    }
}
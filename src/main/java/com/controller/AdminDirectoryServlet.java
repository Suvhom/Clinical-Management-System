package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.dao.AdminDao;
import com.model.AdminModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/admins", asyncSupported = true)
public class AdminDirectoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDao adminDao = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<AdminModel> adminList = adminDao.getAllAdmins();
        request.setAttribute("adminList", adminList);

        request.getRequestDispatcher("/WEB-INF/Admin_page/AdminDirectory.jsp")
               .forward(request, response);
    }
}

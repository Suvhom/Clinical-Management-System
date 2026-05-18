package com.controller;

import java.io.IOException;
import com.dao.AddPatientDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/delete-patient")
public class DeletePatientServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private AddPatientDao patientDao = new AddPatientDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.trim().isEmpty()) {
            try {
                int patientId = Integer.parseInt(idStr);
                boolean success = patientDao.deletePatient(patientId);
                if (success) {
                    response.sendRedirect(request.getContextPath() + "/admin/patients?deleted=true");
                    return;
                }
            } catch (Exception e) {
                System.out.println("ERROR DELETING PATIENT ID " + idStr + ": " + e.getMessage());
            }
        }
        response.sendRedirect(request.getContextPath() + "/admin/patients?error=true");
    }
}

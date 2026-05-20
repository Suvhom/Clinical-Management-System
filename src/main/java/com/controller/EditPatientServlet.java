package com.controller;

import java.io.IOException;

import com.dao.AddPatientDao;
import com.model.AddPatientModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/edit-patient", asyncSupported = true)
public class EditPatientServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/patients");
            return;
        }

        try {
            int patientId = Integer.parseInt(id);

            AddPatientDao dao = new AddPatientDao();
            AddPatientModel patient = dao.getPatientById(patientId);

            if (patient == null) {
                response.sendRedirect(request.getContextPath() + "/admin/patients?error=notfound");
                return;
            }

            request.setAttribute("patient", patient);

            request.getRequestDispatcher("/WEB-INF/Admin_page/EditPatient.jsp")
                   .forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/patients");
        }
    }
}

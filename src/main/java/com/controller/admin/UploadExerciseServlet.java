package com.controller.admin;

import java.io.IOException;

import com.dao.AddPatientDao;
import com.model.AddPatientModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/upload-exercise", asyncSupported = true)
public class UploadExerciseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String patientIdStr = request.getParameter("patientId");

        if (patientIdStr == null || patientIdStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/patients");
            return;
        }

        try {
            int patientId = Integer.parseInt(patientIdStr);
            AddPatientDao dao = new AddPatientDao();
            AddPatientModel patient = dao.getPatientById(patientId);

            if (patient == null) {
                response.sendRedirect(request.getContextPath() + "/admin/patients?error=patientnotfound");
                return;
            }

            request.setAttribute("patient", patient);
            request.getRequestDispatcher("/WEB-INF/Admin_page/UploadExercise.jsp")
                   .forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/patients");
        }
    }
}

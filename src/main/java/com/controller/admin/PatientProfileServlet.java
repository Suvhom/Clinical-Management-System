package com.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import com.dao.AddPatientDao;
import com.model.AddPatientModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/patients", asyncSupported = true)
public class PatientProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AddPatientDao dao = new AddPatientDao();
        String search = request.getParameter("search");
        ArrayList<AddPatientModel> patients;

        if (search != null && !search.trim().isEmpty()) {
            patients = dao.searchPatients(search.trim());
        } else {
            patients = dao.getAllPatients();
        }

        request.setAttribute("patients", patients);

        request.getRequestDispatcher("/WEB-INF/Admin_page/PatientProfile.jsp")
               .forward(request, response);
    }
}

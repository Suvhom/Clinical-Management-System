package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.dao.AddPatientDao;
import com.dao.AppointmentDao;
import com.model.AddPatientModel;
import com.model.AppointmentModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/patient-detail")
public class PatientDetailServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private AddPatientDao patientDao = new AddPatientDao();
    private AppointmentDao appointmentDao = new AppointmentDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        int patientId = -1;

        try {
            if (idStr != null && !idStr.trim().isEmpty()) {
                patientId = Integer.parseInt(idStr);
            } else {
                // Default fallback: load the first patient from the directory
                ArrayList<AddPatientModel> allPatients = patientDao.getAllPatients();
                if (allPatients != null && !allPatients.isEmpty()) {
                    patientId = allPatients.get(0).getPatientId();
                }
            }

            if (patientId != -1) {
                AddPatientModel patient = patientDao.getPatientById(patientId);
                if (patient != null) {
                    // Fetch this patient's specific appointments history
                    ArrayList<AppointmentModel> appointmentsList = appointmentDao.getAppointmentsByPatientId(patientId);
                    request.setAttribute("patient", patient);
                    request.setAttribute("appointmentsList", appointmentsList);

                    AppointmentModel upcomingAppointment = null;
                    if (appointmentsList != null) {
                        for (AppointmentModel appointment : appointmentsList) {
                            String status = appointment.getStatus();
                            if (!"Cancelled".equalsIgnoreCase(status) && !"Completed".equalsIgnoreCase(status)) {
                                upcomingAppointment = appointment;
                                break;
                            }
                        }
                    }
                    request.setAttribute("upcomingAppointment", upcomingAppointment);
                }
            }

        } catch (Exception e) {
            System.out.println("ERROR LOADING PATIENT DETAIL:");
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/Admin_page/PatientDetail.jsp")
               .forward(request, response);
    }
}

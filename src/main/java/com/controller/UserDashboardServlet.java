package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Calendar;
import com.model.PatientModel;
import com.model.BookAppointmentmodel;
import com.model.ExerciseModel;
import com.dao.PatientDao;
import com.dao.BookAppointmentdao;
import com.dao.ExerciseDao;

@WebServlet(urlPatterns = "/UserDashboard", asyncSupported = true)
public class UserDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session guard
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("patient") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get patient from session
        PatientModel patient = (PatientModel) session.getAttribute("patient");

        try {
            // Refresh from DB
            PatientDao dao = new PatientDao();
            PatientModel freshPatient = dao.getPatientById(patient.getPatientId());

            if (freshPatient == null) {
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Building greeting based on time
            Calendar cal = Calendar.getInstance();
            int hour = cal.get(Calendar.HOUR_OF_DAY);
            String greeting = hour < 12 ? "Good morning"
                            : hour < 17 ? "Good afternoon"
                            : "Good evening";

            BookAppointmentdao appointmentDao = new BookAppointmentdao();
            ExerciseDao exerciseDao = new ExerciseDao();

            BookAppointmentmodel upcomingAppointment =
                    appointmentDao.getUpcomingAppointmentByPatientId(freshPatient.getPatientId());
            List<ExerciseModel> todaysExercises =
                    exerciseDao.getExercisesByPatientId(freshPatient.getPatientId());

            int upcomingCount = appointmentDao.countUpcomingAppointments(freshPatient.getPatientId());
            int assignedExerciseCount = exerciseDao.countExercisesByPatientId(freshPatient.getPatientId());

            // Passes everything to JSP as request attributes
            session.setAttribute("patient", freshPatient);
            session.setAttribute("patientName", freshPatient.getPatientName());
            request.setAttribute("patient",  freshPatient);
            request.setAttribute("greeting", greeting);
            request.setAttribute("upcomingAppointment", upcomingAppointment);
            request.setAttribute("todaysExercises", todaysExercises);
            request.setAttribute("upcomingCount", upcomingCount);
            request.setAttribute("assignedExerciseCount", assignedExerciseCount);

            request.getRequestDispatcher("/WEB-INF/User_Pages/UserDashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

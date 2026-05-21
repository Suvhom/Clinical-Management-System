package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.dao.ExerciseDao;
import com.model.ExerciseModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/user/exercise-plans", asyncSupported = true)
public class ExercisePlanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Integer patientId = getPatientIdFromSession(session);

        if (patientId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        ExerciseDao exerciseDao = new ExerciseDao();
        ArrayList<ExerciseModel> assignedExercises = exerciseDao.getExercisesByPatientId(patientId);

        request.setAttribute("assignedExercises", assignedExercises);
        request.getRequestDispatcher("/WEB-INF/User_Pages/ExercisePlans.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private Integer getPatientIdFromSession(HttpSession session) {
        Object patientIdValue = session.getAttribute("patientId");

        if (patientIdValue == null) {
            patientIdValue = session.getAttribute("patient_id");
        }

        if (patientIdValue instanceof Integer) {
            return (Integer) patientIdValue;
        }

        if (patientIdValue instanceof String) {
            try {
                return Integer.parseInt((String) patientIdValue);
            } catch (NumberFormatException e) {
                return null;
            }
        }

        return null;
    }
}

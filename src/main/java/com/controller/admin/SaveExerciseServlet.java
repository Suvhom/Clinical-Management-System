package com.controller.admin;

import java.io.IOException;

import com.dao.ExerciseDao;
import com.model.ExerciseModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/save-exercise", asyncSupported = true)
public class SaveExerciseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String patientIdStr = request.getParameter("patientId");
        String exerciseName = request.getParameter("exerciseName");
        String focusArea = request.getParameter("focusArea");
        String description = request.getParameter("description");
        String videoUrl = request.getParameter("videoUrl");

        if (patientIdStr == null || patientIdStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/patients");
            return;
        }

        // Validation: Exercise Name is required (NOT NULL in database)
        if (exerciseName == null || exerciseName.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/upload-exercise?patientId=" + patientIdStr + "&error=missingname");
            return;
        }

        try {
            int patientId = Integer.parseInt(patientIdStr);

            ExerciseModel exercise = new ExerciseModel();
            exercise.setPatientId(patientId);
            exercise.setExerciseName(exerciseName.trim());
            exercise.setFocusArea(focusArea != null && !focusArea.trim().isEmpty() ? focusArea.trim() : null);
            exercise.setDescription(description != null && !description.trim().isEmpty() ? description.trim() : null);
            exercise.setVideoUrl(videoUrl != null && !videoUrl.trim().isEmpty() ? videoUrl.trim() : null);

            ExerciseDao dao = new ExerciseDao();
            boolean success = dao.insertExercise(exercise);

            if (success) {
                // Log activity in administrative dashboard log
                new com.dao.DashboardDao().insertActivity("Uploaded exercise: " + exercise.getExerciseName() + " for Patient ID: " + patientId);
                response.sendRedirect(request.getContextPath() + "/admin/patients?successUpload=1");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/upload-exercise?patientId=" + patientIdStr + "&error=1");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/patients");
        }
    }
}

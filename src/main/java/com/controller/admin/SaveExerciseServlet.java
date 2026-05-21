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
        String focusArea    = request.getParameter("focusArea");
        String description  = request.getParameter("description");
        String videoUrl     = request.getParameter("videoUrl");

        System.out.println("SAVE EXERCISE POST HIT");
        System.out.println("patientIdStr: " + patientIdStr);
        System.out.println("exerciseName: " + exerciseName);

        if (patientIdStr == null || patientIdStr.trim().isEmpty()) {
            System.out.println("PATIENT ID IS MISSING - REDIRECTING");
            response.sendRedirect(request.getContextPath() + "/admin/patients");
            return;
        }

        if (exerciseName == null || exerciseName.trim().isEmpty()) {
            System.out.println("EXERCISE NAME IS MISSING");
            response.sendRedirect(request.getContextPath() + "/admin/upload-exercise?patientId=" + patientIdStr + "&error=missingname");
            return;
        }

        try {
            int patientId = Integer.parseInt(patientIdStr.trim());

            ExerciseModel exercise = new ExerciseModel();
            exercise.setPatientId(patientId);
            exercise.setExerciseName(exerciseName.trim());
            exercise.setFocusArea(focusArea != null ? focusArea.trim() : "");
            exercise.setDescription(description != null ? description.trim() : "");
            exercise.setVideoUrl(videoUrl != null ? videoUrl.trim() : "");

            System.out.println("CALLING insertExercise FOR PATIENT: " + patientId);

            ExerciseDao dao = new ExerciseDao();
            boolean success = dao.insertExercise(exercise);

            System.out.println("INSERT RESULT: " + success);

            if (success) {
                try {
                    new com.dao.DashboardDao().insertActivity("Uploaded exercise: " + exercise.getExerciseName() + " for Patient ID: " + patientId);
                } catch (Exception logEx) {
                    System.out.println("ACTIVITY LOG FAILED: " + logEx.getMessage());
                    logEx.printStackTrace();
                }
                response.sendRedirect(request.getContextPath() + "/admin/patients?successUpload=1");
            } else {
                System.out.println("INSERT RETURNED FALSE");
                response.sendRedirect(request.getContextPath() + "/admin/upload-exercise?patientId=" + patientIdStr + "&error=1");
            }

        } catch (Exception e) {
            System.out.println("SERVLET CRASHED: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/upload-exercise?patientId=" + patientIdStr + "&error=1");
        }
    }
}
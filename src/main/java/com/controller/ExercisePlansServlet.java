package com.controller;

import java.io.IOException;

import com.dao.ExerciseDao;
import com.model.ExerciseModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/ExercisePlans" })
public class ExercisePlansServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ExercisePlansServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        try {
            if (keyword != null && !keyword.trim().isEmpty()) {

                ExerciseDao dao = new ExerciseDao();
                ExerciseModel exercise = dao.searchExercise(keyword);

                if (exercise != null) {
                	request.setAttribute("exerciseName", exercise.getExerciseName());
                	request.setAttribute("focusArea", exercise.getFocusArea());
                	request.setAttribute("description", exercise.getDescription());
                	request.setAttribute("videoUrl", exercise.getVideoUrl());
                } else {
                	 request.setAttribute("message", "No exercise found.");
                	    request.setAttribute("exerciseName", "No result");
                }
            }

            request.getRequestDispatcher("WEB-INF/pages/ExercisePlans.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
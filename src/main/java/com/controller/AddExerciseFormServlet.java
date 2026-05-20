package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


import com.utils.DBconfig;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(urlPatterns = "/admin/add-exercise", asyncSupported = true)
public class AddExerciseFormServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Load page
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/Admin_page/AddExerciseForm.jsp")
               .forward(request, response);
    }

    // Save to DB
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String exerciseName = request.getParameter("exerciseName");
        String focusArea = request.getParameter("focusArea");
        String description = request.getParameter("description");
        String videoUrl = request.getParameter("videoUrl");

        try {
            Connection con = DBconfig.getConnection();

            String sql = "INSERT INTO exercise (exercise_name, focus_area, description, video_url) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, exerciseName);
            ps.setString(2, focusArea);
            ps.setString(3, description);
            ps.setString(4, videoUrl);

            ps.executeUpdate();

            request.setAttribute("success", "Exercise added successfully!");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to add exercise");
        }

        request.getRequestDispatcher("/WEB-INF/Admin_page/AddExerciseForm.jsp")
               .forward(request, response);
    }
}

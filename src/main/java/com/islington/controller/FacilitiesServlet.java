package com.islington.controller;

import java.io.IOException;
import com.islington.dao.TreatmentDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FacilitiesServlet")
public class FacilitiesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FacilitiesServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        try {
            if (keyword != null && !keyword.trim().isEmpty()) {
                TreatmentDao dao = new TreatmentDao();
                String result = dao.searchFacilities(keyword);
                request.setAttribute("searchResults", result);
            }

            request.getRequestDispatcher("/WEB-INF/pages/facilities.jsp").forward(request, response);

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
package com.islington.controller;

import java.io.IOException;

import com.islington.dao.TreatmentDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FacilitiesSearchServlet")
public class FacilitiesSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FacilitiesSearchServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        try {
            TreatmentDao dao = new TreatmentDao();
            int treatmentId = dao.findMatchingFacilityId(keyword);

            int pageId = 0;

            if (treatmentId == 10) {
                pageId = 1;
            } else if (treatmentId == 11) {
                pageId = 2;
            } else if (treatmentId == 12) {
                pageId = 3;
            } else if (treatmentId == 13) {
                pageId = 4;
            } else if (treatmentId == 14) {
                pageId = 5;
            } else if (treatmentId == 15) {
                pageId = 6;
            } else if (treatmentId == 16) {
                pageId = 7;
            } else if (treatmentId == 17) {
                pageId = 8;
            }

            if (pageId > 0) {
                response.sendRedirect(request.getContextPath() + "/FacilitiesServlet#facility-" + pageId);
            } else {
                response.sendRedirect(request.getContextPath() + "/FacilitiesServlet");
            }

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
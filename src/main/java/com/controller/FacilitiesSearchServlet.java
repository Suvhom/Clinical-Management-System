package com.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/facilities/search", "/FacilitiesSearchServlet" }, asyncSupported = true)
public class FacilitiesSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FacilitiesSearchServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        int pageId = resolveFacilityAnchor(keyword);
        String target = request.getContextPath() + "/facilities";
        if (pageId > 0) {
            target += "#facility-" + pageId;
        }
        response.sendRedirect(target);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private int resolveFacilityAnchor(String keyword) {
        if (keyword == null) {
            return 0;
        }

        String query = keyword.trim().toLowerCase();
        if (query.isEmpty()) {
            return 0;
        }

        if (query.contains("outpatient") || query.contains("inpatient") || query.contains("patient")) {
            return 1;
        }
        if (query.contains("room") || query.contains("bed") || query.contains("cabin")) {
            return 2;
        }
        if (query.contains("equipment") || query.contains("x-ray") || query.contains("diagnostic")) {
            return 3;
        }
        if (query.contains("infrastructure") || query.contains("parking") || query.contains("canteen")) {
            return 4;
        }
        if (query.contains("ipd") || query.contains("treatment")) {
            return 5;
        }
        if (query.contains("home")) {
            return 6;
        }
        if (query.contains("pharmacy") || query.contains("medicine")) {
            return 7;
        }
        if (query.contains("package") || query.contains("health")) {
            return 8;
        }
        return 0;
    }
}

package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.stream.Collectors;

import com.dao.StaffDao;
import com.model.StaffModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/staff")
public class AdminStaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDao staffDao = new StaffDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get filter and search parameters
        String search = request.getParameter("search");
        if (search != null) {
            search = search.trim().toLowerCase();
        }

        String specialization = request.getParameter("specialization");
        String status = request.getParameter("status");
        String gender = request.getParameter("gender");
        String minExpStr = request.getParameter("minExperience");

        ArrayList<StaffModel> allStaff = staffDao.getAllStaff();
        ArrayList<StaffModel> filtered = new ArrayList<>();

        for (StaffModel s : allStaff) {
            boolean keep = true;

            // Apply Search filter (ID, name, spec, qualification, phone, email, address)
            if (search != null && !search.isEmpty()) {
                boolean match = String.valueOf(s.getStaffId()).contains(search) ||
                                (s.getStaffName() != null && s.getStaffName().toLowerCase().contains(search)) ||
                                (s.getSpecialization() != null && s.getSpecialization().toLowerCase().contains(search)) ||
                                (s.getQualification() != null && s.getQualification().toLowerCase().contains(search)) ||
                                (s.getPhone() != null && s.getPhone().toLowerCase().contains(search)) ||
                                (s.getEmail() != null && s.getEmail().toLowerCase().contains(search)) ||
                                (s.getAddress() != null && s.getAddress().toLowerCase().contains(search));
                if (!match) keep = false;
            }

            // Apply Specialization filter
            if (specialization != null && !specialization.trim().isEmpty() && !"All".equalsIgnoreCase(specialization)) {
                if (s.getSpecialization() == null || !s.getSpecialization().equalsIgnoreCase(specialization.trim())) {
                    keep = false;
                }
            }

            // Apply Status filter
            if (status != null && !status.trim().isEmpty() && !"All".equalsIgnoreCase(status)) {
                if (s.getStatus() == null || !s.getStatus().equalsIgnoreCase(status.trim())) {
                    keep = false;
                }
            }

            // Apply Gender filter
            if (gender != null && !gender.trim().isEmpty() && !"All".equalsIgnoreCase(gender)) {
                if (s.getGender() == null || !s.getGender().equalsIgnoreCase(gender.trim())) {
                    keep = false;
                }
            }

            // Apply Minimum Experience filter
            if (minExpStr != null && !minExpStr.trim().isEmpty()) {
                try {
                    int minExp = Integer.parseInt(minExpStr);
                    if (s.getExperience() < minExp) {
                        keep = false;
                    }
                } catch (NumberFormatException e) {
                    // Ignore invalid format
                }
            }

            if (keep) {
                filtered.add(s);
            }
        }

        // Set request attributes
        request.setAttribute("staffList", filtered);
        request.setAttribute("currentSearch", search != null ? search : "");
        request.setAttribute("selectedSpec", specialization != null ? specialization : "All");
        request.setAttribute("selectedStatus", status != null ? status : "All");
        request.setAttribute("selectedGender", gender != null ? gender : "All");
        request.setAttribute("selectedMinExp", minExpStr != null ? minExpStr : "");

        request.getRequestDispatcher("/WEB-INF/Admin_page/AdminStaff.jsp")
               .forward(request, response);
    }
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.StaffModel" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Directory - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/AdminStaff.css">

    <style>
        /* Premium button styles for Staff Directory actions to ensure consistent looks & bypass caching */
        .staff-action-group {
            display: flex;
            gap: 6px;
            align-items: center;
            flex-wrap: wrap;
        }
        .staff-action-btn {
            text-decoration: none;
            padding: 6px 12px !important;
            border-radius: 8px !important;
            font-size: 12px !important;
            font-weight: 700 !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            border: none !important;
            transition: background-color 0.2s ease, transform 0.1s ease !important;
        }
        .staff-action-btn.edit {
            background: #eef4ff !important;
            color: #1677d8 !important;
        }
        .staff-action-btn.edit:hover {
            background: #dbeafe !important;
        }
        .staff-action-btn.book {
            background: #f5f3ff !important;
            color: #7c3aed !important;
        }
        .staff-action-btn.book:hover {
            background: #ede9fe !important;
        }
        .staff-action-btn.view {
            background: #e0f2fe !important;
            color: #0369a1 !important;
        }
        .staff-action-btn.view:hover {
            background: #bae6fd !important;
        }
        .staff-action-btn.delete {
            background: #fee2e2 !important;
            color: #b91c1c !important;
        }
        .staff-action-btn.delete:hover {
            background: #fca5a5 !important;
        }
    </style>
</head>

<body>

    <main class="layout">

        <!-- Sidebar -->
        <div class="sidebar">

            <div class="brand">
                <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="MotionRehab Logo">
                <span>MotionRehab</span>
            </div>

            <nav class="nav-menu">
			    <a class="nav-item" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
			    <a class="nav-item" href="${pageContext.request.contextPath}/admin/appointments">Appointments</a>
			    <a class="nav-item" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
			    <a class="nav-item" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
			    <a class="nav-item active" href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
			</nav>

            <div class="nav-bottom">
                <a class="nav-item" href="#">Settings</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/logout">Log out</a>
            </div>

        </div>

        <!-- Main Page -->
        <section class="page">

            <!-- Topbar -->
            <header class="topbar">

                <h1>Staff Management</h1>
                <div class="top-actions">
                    <button class="icon" type="button">!</button>

                    <div class="profile">
                        <div>
                            <strong>Dr. Suvhom K.C</strong>
                            <span>Clinic Administrator</span>
                        </div>
                        <img class="profile-avatar" src="${pageContext.request.contextPath}/Images/Admin_Profile.png" alt="Admin profile" width="48" height="48">
                    </div>

                </div>
            </header>

            <!-- Content -->
            <section class="content">

                <!-- Title Row -->
                <div class="title-row">
                    <div>
                        <h2>Staff Directory</h2>
                        <p>Manage clinic physiotherapists, specialties, workloads and schedules.</p>
                    </div>

                    <a class="primary-btn" href="${pageContext.request.contextPath}/admin/add-staff" style="text-decoration: none; display: inline-flex; align-items: center; justify-content: center; height: 46px; box-sizing: border-box;">+ Add Staff Member</a>
                </div>

                <!-- Success Banners -->
                <% if (request.getParameter("success") != null) { %>
                    <% if ("1".equals(request.getParameter("success"))) { %>
                        <p class="success-message" style="background: #dcfce7; color: #15803d; padding: 12px 18px; border-radius: 8px; font-weight: 600; margin-bottom: 20px;">
                            ✔ New staff record registered successfully.
                        </p>
                    <% } else if ("2".equals(request.getParameter("success"))) { %>
                        <p class="success-message" style="background: #e0f2fe; color: #0369a1; padding: 12px 18px; border-radius: 8px; font-weight: 600; margin-bottom: 20px;">
                            ✔ Staff profile and availability status updated successfully.
                        </p>
                    <% } else if ("3".equals(request.getParameter("success"))) { %>
                        <p class="success-message" style="background: #fee2e2; color: #991b1b; padding: 12px 18px; border-radius: 8px; font-weight: 600; margin-bottom: 20px; border-left: 4px solid #991b1b;">
                            ✔ Staff record has been deleted successfully.
                        </p>
                    <% } %>
                <% } %>
                <% if (request.getParameter("error") != null) { %>
                    <p class="error-message" style="background: #fee2e2; color: #b91c1c; padding: 12px 18px; border-radius: 8px; font-weight: 600; margin-bottom: 20px; border-left: 4px solid #b91c1c;">
                        ❌ Failed to perform the operation. Please try again.
                    </p>
                <% } %>

                <%
                    String currentSearch = (String) request.getAttribute("currentSearch");
                    if (currentSearch == null) currentSearch = "";

                    String selectedSpec = (String) request.getAttribute("selectedSpec");
                    if (selectedSpec == null) selectedSpec = "All";

                    String selectedStatus = (String) request.getAttribute("selectedStatus");
                    if (selectedStatus == null) selectedStatus = "All";

                    String selectedGender = (String) request.getAttribute("selectedGender");
                    if (selectedGender == null) selectedGender = "All";

                    String selectedMinExp = (String) request.getAttribute("selectedMinExp");
                    if (selectedMinExp == null) selectedMinExp = "";
                %>

                <!-- Search Control -->
                <div class="filter-card" style="margin-bottom: 20px; padding: 16px; background: #ffffff; border-radius: 12px; border: 1px solid #e5e7eb; box-shadow: 0 1px 3px rgba(0,0,0,0.05);">
                    <form action="${pageContext.request.contextPath}/admin/staff" method="get" style="display: flex; gap: 8px; width: 100%;">
                        <div style="flex: 1; position: relative;">
                            <input
                                type="text"
                                name="search"
                                value="<%= currentSearch %>"
                                placeholder="Search by Staff ID, Name, Specialization, Email..."
                                style="width: 100%; height: 42px; border: 1px solid #e5e7eb; border-radius: 8px; padding: 0 16px; font-size: 15px; outline: none; background: #ffffff; box-sizing: border-box;"
                            >
                        </div>
                        <button type="submit" class="primary-btn" style="padding: 0 24px; height: 42px; font-size: 14px; display: inline-flex; align-items: center; justify-content: center; box-sizing: border-box; border-radius: 8px;">Search</button>
                        <a href="${pageContext.request.contextPath}/admin/staff" style="padding: 0 20px; height: 42px; font-size: 14px; display: inline-flex; align-items: center; justify-content: center; box-sizing: border-box; border-radius: 8px; text-decoration: none; background: #f3f4f6; color: #374151; font-weight: 600; border: 1px solid #e5e7eb; transition: background-color 0.2s ease; cursor: pointer;" onmouseover="this.style.backgroundColor='#e5e7eb'" onmouseout="this.style.backgroundColor='#f3f4f6'">Clear</a>
                    </form>
                </div>

                <!-- Directory Card -->
                <div class="table-card">

                    <table>
                        <thead>
                            <tr>
                                <th>Staff Member</th>
                                <th>Specialization / Credentials</th>
                                <th>Contact Information</th>
                                <th>Experience</th>
                                <th>Active Workload</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<StaffModel> staffList = (ArrayList<StaffModel>) request.getAttribute("staffList");
                                if (staffList != null && !staffList.isEmpty()) {
                                    for (StaffModel s : staffList) {
                                        String pillClass = "gray";
                                        if ("Active".equalsIgnoreCase(s.getStatus())) {
                                            pillClass = "green";
                                        } else if ("Busy".equalsIgnoreCase(s.getStatus())) {
                                            pillClass = "orange";
                                        } else if ("On Leave".equalsIgnoreCase(s.getStatus())) {
                                            pillClass = "yellow";
                                        } else if ("Inactive".equalsIgnoreCase(s.getStatus())) {
                                            pillClass = "red";
                                        }

                                        // Workload pill indicators
                                        String workloadClass = "gray";
                                        int workload = s.getActiveAppointmentsCount();
                                        if (workload == 0) {
                                            workloadClass = "green";
                                        } else if (workload <= 2) {
                                            workloadClass = "yellow";
                                        } else {
                                            workloadClass = "red"; // Overloaded staff
                                        }
                            %>
                            <tr>
                                <td>
                                    <div class="person">
                                        <span class="avatar a2"></span>
                                        <div>
                                            <strong><%= s.getStaffName() %></strong>
                                            <small>#ST-<%= s.getStaffId() %> | <%= s.getGender() %></small>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    <strong><%= s.getSpecialization() %></strong>
                                    <small><%= s.getQualification() %></small>
                                </td>

                                <td>
                                    <strong><%= s.getEmail() %></strong>
                                    <small><%= s.getPhone() %></small>
                                </td>

                                <td>
                                    <strong><%= s.getExperience() %> Yrs</strong>
                                </td>

                                <td>
                                    <span class="pill <%= workloadClass %>" style="min-width: 90px; text-align: center;">
                                        <%= workload %> active <%= workload == 1 ? "appt" : "appts" %>
                                    </span>
                                </td>

                                <td>
                                    <span class="pill <%= pillClass %>"><%= s.getStatus() %></span>
                                </td>

                                <td>
                                    <div class="staff-action-group">
                                        <a href="${pageContext.request.contextPath}/admin/edit-staff?id=<%= s.getStaffId() %>" class="staff-action-btn edit" title="Edit Profile">✎ Edit</a>
                                        <a href="${pageContext.request.contextPath}/admin/delete-staff?id=<%= s.getStaffId() %>" class="staff-action-btn delete" onclick="return confirm('Are you sure you want to delete this staff member?');" title="Delete Profile">🗑 Delete</a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="7" style="text-align: center; color: #6b7280; padding: 40px 0;">
                                    No staff members found matching your search parameters.
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>

                    <div class="table-footer">
                        <p>Showing <%= staffList != null ? staffList.size() : 0 %> entries</p>
                    </div>

                </div>

            </section>

        </section>

    </main>

</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.StaffModel" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Directory - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminStaff.css">
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

                    <div class="top-search">
                        Search...
                    </div>

                    <button class="bell-btn">⌕</button>

                    <div class="profile">
                        <div>
                            <strong>Dr. Emily Chen</strong>
                            <span>Clinic Administrator</span>
                        </div>
                        <div class="profile-img"></div>
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
                    <% } %>
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

                <!-- Filter Controls -->
                <div class="filter-card">

                    <form action="${pageContext.request.contextPath}/admin/staff" method="get" class="filter-form">
                        
                        <div class="filter-grid">
                            
                            <div class="input-group">
                                <label for="search">Keyword Search</label>
                                <input type="text" id="search" name="search" value="<%= currentSearch %>" placeholder="Search name, specialization, email...">
                            </div>

                            <div class="input-group">
                                <label for="specialization">Specialization</label>
                                <select id="specialization" name="specialization">
                                    <option value="All" <%= "All".equals(selectedSpec) ? "selected" : "" %>>All Specializations</option>
                                    <option value="General Physiotherapy" <%= "General Physiotherapy".equals(selectedSpec) ? "selected" : "" %>>General Physiotherapy</option>
                                    <option value="Sports Injury Rehab" <%= "Sports Injury Rehab".equals(selectedSpec) ? "selected" : "" %>>Sports Injury Rehab</option>
                                    <option value="Back and Neck Pain" <%= "Back and Neck Pain".equals(selectedSpec) ? "selected" : "" %>>Back and Neck Pain</option>
                                    <option value="Post-Surgical Rehab" <%= "Post-Surgical Rehab".equals(selectedSpec) ? "selected" : "" %>>Post-Surgical Rehab</option>
                                    <option value="Manual Therapy" <%= "Manual Therapy".equals(selectedSpec) ? "selected" : "" %>>Manual Therapy</option>
                                    <option value="Neurological Rehab" <%= "Neurological Rehab".equals(selectedSpec) ? "selected" : "" %>>Neurological Rehab</option>
                                </select>
                            </div>

                            <div class="input-group">
                                <label for="status">Working Status</label>
                                <select id="status" name="status">
                                    <option value="All" <%= "All".equals(selectedStatus) ? "selected" : "" %>>All Statuses</option>
                                    <option value="Active" <%= "Active".equals(selectedStatus) ? "selected" : "" %>>Active</option>
                                    <option value="Busy" <%= "Busy".equals(selectedStatus) ? "selected" : "" %>>Busy</option>
                                    <option value="On Leave" <%= "On Leave".equals(selectedStatus) ? "selected" : "" %>>On Leave</option>
                                    <option value="Inactive" <%= "Inactive".equals(selectedStatus) ? "selected" : "" %>>Inactive</option>
                                </select>
                            </div>

                            <div class="input-group">
                                <label for="gender">Gender</label>
                                <select id="gender" name="gender">
                                    <option value="All" <%= "All".equals(selectedGender) ? "selected" : "" %>>All Genders</option>
                                    <option value="Male" <%= "Male".equals(selectedGender) ? "selected" : "" %>>Male</option>
                                    <option value="Female" <%= "Female".equals(selectedGender) ? "selected" : "" %>>Female</option>
                                    <option value="Other" <%= "Other".equals(selectedGender) ? "selected" : "" %>>Other</option>
                                </select>
                            </div>

                            <div class="input-group">
                                <label for="minExperience">Min Experience (Yrs)</label>
                                <input type="number" id="minExperience" name="minExperience" value="<%= selectedMinExp %>" placeholder="e.g. 3" min="0">
                            </div>

                            <div class="input-group button-group" style="display: flex; align-items: flex-end; justify-content: flex-end; height: 100%;">
                                <button type="submit" class="primary-btn" style="width: 100%; height: 42px; font-size: 14px;">Apply Filters</button>
                            </div>

                        </div>

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
                                    <div class="actions">
                                        <a href="${pageContext.request.contextPath}/admin/edit-staff?id=<%= s.getStaffId() %>" class="edit-link" title="Edit Profile">✎ Edit</a>
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

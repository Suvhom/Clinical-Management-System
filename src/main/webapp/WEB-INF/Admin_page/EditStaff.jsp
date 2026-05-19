<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.StaffModel" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Staff Member - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/AddPatient.css">
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

        <!-- Main Page Area -->
        <section class="page">

            <!-- Topbar -->
            <header class="topbar">

                <h1>Edit Staff Member</h1>
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
            <div class="content">

                <%
                    StaffModel staff = (StaffModel) request.getAttribute("staff");
                %>

                <!-- Breadcrumb -->
                <div class="breadcrumb">
                    <a href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
                    <span>›</span>
                    <p>Edit Staff Member</p>
                </div>

                <!-- Error Messages -->
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p class="error-message" style="background: #fee2e2; color: #b91c1c; padding: 12px 18px; border-radius: 8px; font-weight: 600; margin-bottom: 20px; border-left: 4px solid #b91c1c;">
                        <%= request.getAttribute("errorMessage") %>
                    </p>
                <% } %>

                <!-- Form Card -->
                <div class="form-card">

                    <form action="${pageContext.request.contextPath}/admin/update-staff" method="post">

                        <input type="hidden" name="staffId" value="<%= staff.getStaffId() %>">

                        <section class="form-section">

                            <h2>Update Profile & Availability Status</h2>

                            <div class="form-grid">

                                <div class="input-group">
                                    <label for="staffName">Staff / Doctor Name</label>
                                    <input type="text" id="staffName" name="staffName" value="<%= staff.getStaffName() %>" required>
                                </div>

                                <div class="input-group">
                                    <label for="specialization">Specialization</label>
                                    <select id="specialization" name="specialization" required>
                                        <option value="General Physiotherapy" <%= "General Physiotherapy".equals(staff.getSpecialization()) ? "selected" : "" %>>General Physiotherapy</option>
                                        <option value="Sports Injury Rehab" <%= "Sports Injury Rehab".equals(staff.getSpecialization()) ? "selected" : "" %>>Sports Injury Rehab</option>
                                        <option value="Back and Neck Pain" <%= "Back and Neck Pain".equals(staff.getSpecialization()) ? "selected" : "" %>>Back and Neck Pain</option>
                                        <option value="Post-Surgical Rehab" <%= "Post-Surgical Rehab".equals(staff.getSpecialization()) ? "selected" : "" %>>Post-Surgical Rehab</option>
                                        <option value="Manual Therapy" <%= "Manual Therapy".equals(staff.getSpecialization()) ? "selected" : "" %>>Manual Therapy</option>
                                        <option value="Neurological Rehab" <%= "Neurological Rehab".equals(staff.getSpecialization()) ? "selected" : "" %>>Neurological Rehab</option>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <label for="qualification">Qualifications</label>
                                    <input type="text" id="qualification" name="qualification" value="<%= staff.getQualification() %>" required>
                                </div>

                                <div class="input-group">
                                    <label for="experience">Years of Experience</label>
                                    <input type="number" id="experience" name="experience" value="<%= staff.getExperience() %>" min="0" required>
                                </div>

                                <div class="input-group">
                                    <label for="email">Email Address</label>
                                    <input type="email" id="email" name="email" value="<%= staff.getEmail() %>" required>
                                </div>

                                <div class="input-group">
                                    <label for="phone">Phone Number</label>
                                    <input type="text" id="phone" name="phone" value="<%= staff.getPhone() %>" required>
                                </div>

                                <div class="input-group">
                                    <label for="gender">Gender</label>
                                    <select id="gender" name="gender" required>
                                        <option value="Male" <%= "Male".equalsIgnoreCase(staff.getGender()) ? "selected" : "" %>>Male</option>
                                        <option value="Female" <%= "Female".equalsIgnoreCase(staff.getGender()) ? "selected" : "" %>>Female</option>
                                        <option value="Other" <%= "Other".equalsIgnoreCase(staff.getGender()) ? "selected" : "" %>>Other</option>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <label for="status">Working Status</label>
                                    <select id="status" name="status" required>
                                        <option value="Active" <%= "Active".equalsIgnoreCase(staff.getStatus()) ? "selected" : "" %>>Active</option>
                                        <option value="Busy" <%= "Busy".equalsIgnoreCase(staff.getStatus()) ? "selected" : "" %>>Busy</option>
                                        <option value="On Leave" <%= "On Leave".equalsIgnoreCase(staff.getStatus()) ? "selected" : "" %>>On Leave</option>
                                        <option value="Inactive" <%= "Inactive".equalsIgnoreCase(staff.getStatus()) ? "selected" : "" %>>Inactive</option>
                                    </select>
                                </div>

                                <div class="input-group full">
                                    <label for="address">Residential Address</label>
                                    <input type="text" id="address" name="address" value="<%= staff.getAddress() %>" required>
                                </div>

                            </div>

                        </section>

                        <!-- Buttons -->
                        <div class="form-actions">

                            <a href="${pageContext.request.contextPath}/admin/staff" class="cancel-btn">
                                Cancel
                            </a>

                            <button type="submit" class="save-btn" style="background: #1677d8; border-color: #1677d8;">
                                Update Staff Record
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </section>

    </main>

</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.AddPatientModel" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedule New Appointment - MotionRehab</title>

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
                <a class="nav-item active" href="${pageContext.request.contextPath}/admin/appointments">Appointments</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
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

                <h1>Schedule Appointment</h1>
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

                <!-- Breadcrumb -->
                <div class="breadcrumb">
                    <a href="${pageContext.request.contextPath}/admin/appointments">Appointments Directory</a>
                    <span>›</span>
                    <p>Schedule Appointment</p>
                </div>

                <!-- Error Messages -->
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p class="error-message" style="background: #fee2e2; color: #b91c1c; padding: 12px 18px; border-radius: 8px; font-weight: 600; margin-bottom: 20px; border-left: 4px solid #b91c1c;">
                        <%= request.getAttribute("errorMessage") %>
                    </p>
                <% } %>

                <!-- Form Card -->
                <div class="form-card">

                    <form action="${pageContext.request.contextPath}/admin/add-appointment" method="post">

                        <section class="form-section">

                            <h2>Appointment Information</h2>

                            <div class="form-grid">

                                <div class="input-group">
                                    <label for="patientId">Select Patient</label>
                                    <select id="patientId" name="patientId" required>
                                        <option value="">Choose patient...</option>
                                        <%
                                            ArrayList<AddPatientModel> patients = (ArrayList<AddPatientModel>) request.getAttribute("patientsList");
                                            Integer selectedPatientId = (Integer) request.getAttribute("selectedPatientId");
                                            if (patients != null) {
                                                for (AddPatientModel patient : patients) {
                                                    boolean isSel = selectedPatientId != null && selectedPatientId == patient.getPatientId();
                                        %>
                                            <option value="<%= patient.getPatientId() %>" <%= isSel ? "selected" : "" %>>
                                                <%= patient.getPatientName() %> (#PT-<%= patient.getPatientId() %>)
                                            </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <label for="staffId">Assigned Physiotherapist / Staff</label>
                                    <select id="staffId" name="staffId" required>
                                        <option value="">Choose staff...</option>
                                        <%
                                            ArrayList<String[]> staffList = (ArrayList<String[]>) request.getAttribute("staffList");
                                            String enteredStaffId = (String) request.getAttribute("enteredStaffId");
                                            if (staffList != null) {
                                                for (String[] staff : staffList) {
                                                    boolean isSel = enteredStaffId != null && enteredStaffId.equals(staff[0]);
                                        %>
                                            <option value="<%= staff[0] %>" <%= isSel ? "selected" : "" %>>
                                                <%= staff[1] %> (#<%= staff[0] %>)
                                            </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <label for="appointmentDate">Appointment Date</label>
                                    <input
                                        type="date"
                                        id="appointmentDate"
                                        name="appointmentDate"
                                        value="<%= request.getAttribute("enteredDate") != null ? request.getAttribute("enteredDate") : "" %>"
                                        required>
                                </div>

                                <div class="input-group">
                                    <label for="appointmentTime">Preferred Time Slot</label>
                                    <input
                                        type="time"
                                        id="appointmentTime"
                                        name="appointmentTime"
                                        value="<%= request.getAttribute("enteredTime") != null ? request.getAttribute("enteredTime") : "" %>"
                                        required>
                                </div>

                                <div class="input-group full">
                                    <label for="reason">Treatment / Visit Reason</label>
                                    <%
                                        String enteredReason = (String) request.getAttribute("enteredReason");
                                    %>
                                    <select id="reason" name="reason" required>
                                        <option value="">Select Treatment Reason</option>
                                        <option value="General Physiotherapy" <%= "General Physiotherapy".equals(enteredReason) ? "selected" : "" %>>General Physiotherapy</option>
                                        <option value="Sports Injury Rehab" <%= "Sports Injury Rehab".equals(enteredReason) ? "selected" : "" %>>Sports Injury Rehab</option>
                                        <option value="Back and Neck Pain" <%= "Back and Neck Pain".equals(enteredReason) ? "selected" : "" %>>Back and Neck Pain</option>
                                        <option value="Post-Surgical Rehab" <%= "Post-Surgical Rehab".equals(enteredReason) ? "selected" : "" %>>Post-Surgical Rehab</option>
                                        <option value="Manual Therapy" <%= "Manual Therapy".equals(enteredReason) ? "selected" : "" %>>Manual Therapy</option>
                                        <option value="Neurological Rehab" <%= "Neurological Rehab".equals(enteredReason) ? "selected" : "" %>>Neurological Rehab</option>
                                    </select>
                                </div>

                            </div>

                        </section>

                        <!-- Buttons -->
                        <div class="form-actions">

                            <a href="${pageContext.request.contextPath}/admin/appointments" class="cancel-btn">
                                Cancel
                            </a>

                            <button type="submit" class="save-btn" style="background: #1677d8; border-color: #1677d8;">
                                Save Appointment
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </section>

    </main>

</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.AddPatientModel" %>
<%@ page import="com.model.AppointmentModel" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reschedule / Edit Appointment - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AddPatient.css">
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

                <h1>Edit Appointment</h1>

                <div class="top-actions">

                    <div class="search">
                        Search...
                    </div>

                    <button class="icon">!</button>

                    <div class="profile">
                        <div>
                            <strong>Dr. Suvhom K.C</strong>
                            <span>Clinic Administrator</span>
                        </div>
                        <b class="avatar a2"></b>
                    </div>

                </div>

            </header>

            <!-- Content -->
            <div class="content">

                <%
                    AppointmentModel appt = (AppointmentModel) request.getAttribute("appointment");
                %>

                <!-- Breadcrumb -->
                <div class="breadcrumb">
                    <a href="${pageContext.request.contextPath}/admin/appointments">Appointments Directory</a>
                    <span>›</span>
                    <p>Reschedule / Edit Appointment</p>
                </div>

                <!-- Error Messages -->
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p class="error-message" style="background: #fee2e2; color: #b91c1c; padding: 12px 18px; border-radius: 8px; font-weight: 600; margin-bottom: 20px; border-left: 4px solid #b91c1c;">
                        <%= request.getAttribute("errorMessage") %>
                    </p>
                <% } %>

                <!-- Form Card -->
                <div class="form-card">

                    <form action="${pageContext.request.contextPath}/admin/update-appointment" method="post">

                        <input type="hidden" name="appointmentId" value="<%= appt.getAppointmentId() %>">

                        <section class="form-section">

                            <h2>Edit Appointment Details</h2>

                            <div class="form-grid">

                                <div class="input-group">
                                    <label for="patientId">Select Patient</label>
                                    <select id="patientId" name="patientId" required>
                                        <%
                                            ArrayList<AddPatientModel> patients = (ArrayList<AddPatientModel>) request.getAttribute("patientsList");
                                            if (patients != null) {
                                                for (AddPatientModel patient : patients) {
                                                    boolean isSel = (patient.getPatientId() == appt.getPatientId());
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
                                        <%
                                            ArrayList<String[]> staffList = (ArrayList<String[]>) request.getAttribute("staffList");
                                            if (staffList != null) {
                                                for (String[] staff : staffList) {
                                                    boolean isSel = (Integer.parseInt(staff[0]) == appt.getStaffId());
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
                                        value="<%= appt.getAppointmentDate() %>"
                                        required>
                                </div>

                                <div class="input-group">
                                    <label for="appointmentTime">Preferred Time Slot</label>
                                    <%
                                        // Format java.sql.Time (HH:MM:SS) to standard HTML time input (HH:MM)
                                        String timeStr = appt.getAppointmentTime().toString();
                                        if (timeStr.length() > 5) {
                                            timeStr = timeStr.substring(0, 5);
                                        }
                                    %>
                                    <input 
                                        type="time" 
                                        id="appointmentTime"
                                        name="appointmentTime" 
                                        value="<%= timeStr %>"
                                        required>
                                </div>

                                <div class="input-group">
                                    <label for="reason">Treatment / Visit Reason</label>
                                    <select id="reason" name="reason" required>
                                        <option value="General Physiotherapy" <%= "General Physiotherapy".equals(appt.getReason()) ? "selected" : "" %>>General Physiotherapy</option>
                                        <option value="Sports Injury Rehab" <%= "Sports Injury Rehab".equals(appt.getReason()) ? "selected" : "" %>>Sports Injury Rehab</option>
                                        <option value="Back and Neck Pain" <%= "Back and Neck Pain".equals(appt.getReason()) ? "selected" : "" %>>Back and Neck Pain</option>
                                        <option value="Post-Surgical Rehab" <%= "Post-Surgical Rehab".equals(appt.getReason()) ? "selected" : "" %>>Post-Surgical Rehab</option>
                                        <option value="Manual Therapy" <%= "Manual Therapy".equals(appt.getReason()) ? "selected" : "" %>>Manual Therapy</option>
                                        <option value="Neurological Rehab" <%= "Neurological Rehab".equals(appt.getReason()) ? "selected" : "" %>>Neurological Rehab</option>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <label for="status">Appointment Status</label>
                                    <select id="status" name="status" required>
                                        <option value="Pending" <%= "Pending".equalsIgnoreCase(appt.getStatus()) ? "selected" : "" %>>Pending</option>
                                        <option value="Confirmed" <%= "Confirmed".equalsIgnoreCase(appt.getStatus()) ? "selected" : "" %>>Confirmed</option>
                                        <option value="Completed" <%= "Completed".equalsIgnoreCase(appt.getStatus()) ? "selected" : "" %>>Completed</option>
                                        <option value="Cancelled" <%= "Cancelled".equalsIgnoreCase(appt.getStatus()) ? "selected" : "" %>>Cancelled</option>
                                        <option value="Rescheduled" <%= "Rescheduled".equalsIgnoreCase(appt.getStatus()) ? "selected" : "" %>>Rescheduled</option>
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
                                Update Appointment
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </section>

    </main>

</body>

</html>

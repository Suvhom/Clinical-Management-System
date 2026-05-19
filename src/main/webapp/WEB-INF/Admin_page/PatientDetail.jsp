<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.AddPatientModel" %>
<%@ page import="com.model.AppointmentModel" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Detail - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/PatientDetail.css">
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
			    <a class="nav-item active" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
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

                <h1>Admin Overview</h1>

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
                    AddPatientModel patient = (AddPatientModel) request.getAttribute("patient");
                    ArrayList<AppointmentModel> apptsList = (ArrayList<AppointmentModel>) request.getAttribute("appointmentsList");
                    
                    if (patient == null) {
                %>
                <div style="padding: 40px; text-align: center; background: #ffffff; border-radius: 12px; border: 1px solid #e5e7eb;">
                    <h2 style="color: #ef4444;">Patient Record Not Found</h2>
                    <p style="color: #6b7280; margin-top: 8px;">The requested patient record could not be found or does not exist in the database.</p>
                    <a class="primary-btn" href="${pageContext.request.contextPath}/admin/patients" style="text-decoration: none; display: inline-block; margin-top: 16px;">Back to Patients Directory</a>
                </div>
                <%
                    } else {
                %>

                <!-- Back Button -->
                <a class="back" href="${pageContext.request.contextPath}/admin/patients" style="text-decoration: none; font-weight: 600; color: #1677d8;">
                    ← Back to Patients
                </a>

                <!-- Patient Header -->
                <div class="card patient-hero">

                    <div class="patient-info">
                        <div class="patient-avatar large"></div>

                        <div>
                            <h2><%= patient.getPatientName() %></h2>

                            <p>
                                #PT-<%= patient.getPatientId() %> | <%= patient.getGender() != null ? patient.getGender() : "Not Specified" %> <br>
                                Phone: <%= patient.getPhone() != null ? patient.getPhone() : "Not Specified" %> <br>
                                Email: <%= patient.getEmail() != null ? patient.getEmail() : "Not Specified" %> <br>
                                Date of Birth: <%= patient.getDateOfBirth() != null ? patient.getDateOfBirth() : "Not Specified" %>
                            </p>

                            <div class="patient-actions">
                                <button>Message</button>
                                <a class="btn-link" href="${pageContext.request.contextPath}/admin/edit-patient?id=<%= patient.getPatientId() %>">Edit Profile</a>
                                <a class="btn-link delete" href="#" onclick="confirmDelete(<%= patient.getPatientId() %>)">Delete Patient</a>
                            </div>
                        </div>
                    </div>

                    <span class="pill green">Active</span>

                </div>

                <!-- Detail Grid -->
                <div class="detail-grid">

                    <!-- Left Side -->
                    <section class="left-column">

                        <!-- Appointment History / Medical History -->
                        <div class="card">
                            <div class="card-head">
                                <h2>Appointment History</h2>
                            </div>

                            <%
                                if (apptsList != null && !apptsList.isEmpty()) {
                                    for (AppointmentModel a : apptsList) {
                                        String pillClass = "gray";
                                        if ("Confirmed".equalsIgnoreCase(a.getStatus())) {
                                            pillClass = "green";
                                        } else if ("Pending".equalsIgnoreCase(a.getStatus())) {
                                            pillClass = "yellow";
                                        } else if ("Cancelled".equalsIgnoreCase(a.getStatus())) {
                                            pillClass = "red";
                                        } else if ("Rescheduled".equalsIgnoreCase(a.getStatus())) {
                                            pillClass = "orange";
                                        }
                            %>
                            <div class="history-item" style="border-left: 4px solid <%= "red".equals(pillClass) ? "#ef4444" : "green".equals(pillClass) ? "#22c55e" : "yellow".equals(pillClass) ? "#eab308" : "orange".equals(pillClass) ? "#f97316" : "#9ca3af" %>; padding-left: 14px; margin-bottom: 16px;">
                                <strong><%= a.getAppointmentDate() %> at <%= a.getAppointmentTime() %></strong>
                                <p style="margin: 4px 0 2px 0; font-weight: 700; font-size: 15px;">
                                    <%= a.getReason() %> 
                                    <span class="pill <%= pillClass %>" style="padding: 2px 8px; font-size: 11px; min-width: auto; margin-left: 6px;"><%= a.getStatus() %></span>
                                </p>
                                <p style="color: #6b7280; font-size: 13px; margin: 0;">
                                    Assigned Staff ID: <strong>#<%= a.getStaffId() %></strong>
                                </p>
                            </div>
                            <%
                                    }
                                } else {
                            %>
                            <div style="text-align: center; color: #6b7280; padding: 30px 0;">
                                <p style="margin: 0; font-size: 15px;">No appointments found in this patient's medical history timeline.</p>
                            </div>
                            <% } %>
                        </div>

                        <!-- Exercise Plan -->
                        <div class="card">
                            <div class="card-head">
                                <h2>Exercise Plan</h2>
                            </div>

                            <div class="exercise-list">
                                <p>Heel Slides <span>3 x 10</span></p>
                                <p>Quad Sets <span>15 reps</span></p>
                                <p>Straight Leg Raises <span>3 x 12</span></p>
                            </div>
                        </div>

                    </section>

                    <!-- Right Side -->
                    <aside class="right-column">

                        <!-- Prescribe Exercise -->
                        <div class="card prescribe-card">
                            <h2>Prescribe Exercise</h2>
                            <p>Add new exercises to patient plan.</p>

                            <a class="primary-btn" href="${pageContext.request.contextPath}/admin/add-exercise">
                                Add Exercise
                            </a>
                        </div>

                        <!-- Vitals -->
                        <div class="card">
                            <h2>Vitals</h2>

                            <div class="vitals">
                                <p><span>Height</span><strong>182 cm</strong></p>
                                <p><span>Weight</span><strong>78 kg</strong></p>
                                <p><span>Blood Type</span><strong>O+</strong></p>
                                <p><span>Allergies</span><strong>Penicillin</strong></p>
                            </div>
                        </div>

                        <!-- Appointment Card -->
                        <div class="card">
                            <h2>Upcoming Appointment</h2>

                            <%
                                AppointmentModel upcoming = null;
                                if (apptsList != null) {
                                    java.sql.Date todayDate = new java.sql.Date(System.currentTimeMillis());
                                    for (AppointmentModel a : apptsList) {
                                        // Pick the first upcoming (future date) or today's active appointment
                                        if (!"Cancelled".equalsIgnoreCase(a.getStatus()) && !"Completed".equalsIgnoreCase(a.getStatus())) {
                                            upcoming = a;
                                            break;
                                        }
                                    }
                                }

                                if (upcoming != null) {
                                    String pillClass = "yellow";
                                    if ("Confirmed".equalsIgnoreCase(upcoming.getStatus())) pillClass = "green";
                                    else if ("Rescheduled".equalsIgnoreCase(upcoming.getStatus())) pillClass = "orange";
                            %>
                            <div class="appointment-box" style="margin-bottom: 12px;">
                                <strong style="font-size: 15px; color: #111827;"><%= upcoming.getReason() %> with Staff #<%= upcoming.getStaffId() %></strong>
                                <p style="color: #6b7280; font-size: 14px; margin-top: 4px;"><%= upcoming.getAppointmentDate() %> – <%= upcoming.getAppointmentTime() %></p>
                                <span class="pill <%= pillClass %>" style="margin-top: 8px; display: inline-block; padding: 4px 10px; font-size: 11px; min-width: auto;"><%= upcoming.getStatus() %></span>
                            </div>

                            <a class="secondary-btn" href="${pageContext.request.contextPath}/admin/edit-appointment?id=<%= upcoming.getAppointmentId() %>" style="text-decoration: none; display: block; text-align: center; margin-top: 12px; font-weight: 600; padding: 10px; border: 1px solid #d1d5db; border-radius: 6px; background: #ffffff; color: #374151;">Reschedule / Edit</a>
                            <%
                                } else {
                            %>
                            <div class="appointment-box" style="text-align: center; padding: 16px 0;">
                                <p style="color: #6b7280; margin: 0; font-size: 14px;">No upcoming visits scheduled.</p>
                            </div>
                            <a class="secondary-btn" href="${pageContext.request.contextPath}/admin/add-appointment?patientId=<%= patient.getPatientId() %>" style="text-decoration: none; display: block; text-align: center; margin-top: 12px; font-weight: 700; padding: 10px; border: 1px solid #1677d8; border-radius: 6px; background: #1677d8; color: #ffffff;">Schedule Visit</a>
                            <% } %>
                        </div>

                    </aside>

                </div>

                <%
                    }
                %>

            </div>

        </section>

    </main>

    <script>
        function confirmDelete(patientId) {
            if (confirm("Are you sure you want to delete this patient? This will permanently remove their records, appointment histories, and active billing files from the database.")) {
                window.location.href = "${pageContext.request.contextPath}/admin/delete-patient?id=" + patientId;
            }
        }
    </script>

</body>

</html>
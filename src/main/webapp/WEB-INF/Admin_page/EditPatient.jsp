<%@ page import="com.model.AddPatientModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    AddPatientModel patient = (AddPatientModel) request.getAttribute("patient");

    if (patient == null) {
%>
        <p>Patient not found.</p>
<%
        return;
    }
%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Edit Patient - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AddPatient.css">
</head>

<body>

<main class="layout">

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

    <section class="page">

        <header class="topbar">

            <h1>Edit Patient</h1>

            <div class="top-actions">

                <div class="search">
                    Search patients, doctors...
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

        <div class="content">

            <div class="breadcrumb">
                <a href="${pageContext.request.contextPath}/admin/patients">Patients Directory</a>
                <span>›</span>
                <p>Edit Patient</p>
            </div>

            <% if (request.getParameter("error") != null) { %>
                <p class="error-message">
                    Patient could not be updated. Please try again.
                </p>
            <% } %>

            <div class="form-card">

                <form action="${pageContext.request.contextPath}/admin/update-patient" method="post">

                    <input type="hidden" name="patientId" value="<%= patient.getPatientId() %>">

                    <section class="form-section">

                        <h2>Edit Patient Information</h2>

                        <div class="form-grid">

                            <div class="input-group">
                                <label>Patient Name</label>
                                <input type="text" name="patientName" value="<%= patient.getPatientName() %>" required>
                            </div>

                            <div class="input-group">
                                <label>Email Address</label>
                                <input type="email" name="email" value="<%= patient.getEmail() == null ? "" : patient.getEmail() %>">
                            </div>

                            <div class="input-group">
                                <label>Phone Number</label>
                                <input type="text" name="phone" value="<%= patient.getPhone() == null ? "" : patient.getPhone() %>">
                            </div>

                            <div class="input-group">
                                <label>Gender</label>
                                <select name="gender">
                                    <option value="">Select gender</option>
                                    <option value="Male" <%= "Male".equals(patient.getGender()) ? "selected" : "" %>>Male</option>
                                    <option value="Female" <%= "Female".equals(patient.getGender()) ? "selected" : "" %>>Female</option>
                                    <option value="Other" <%= "Other".equals(patient.getGender()) ? "selected" : "" %>>Other</option>
                                </select>
                            </div>

                            <div class="input-group">
                                <label>Date of Birth</label>
                                <input type="date" name="dateOfBirth" value="<%= patient.getDateOfBirth() == null ? "" : patient.getDateOfBirth() %>">
                            </div>

                            <div class="input-group">
                                <label>Admin ID</label>
                                <input type="number" name="adminId" value="<%= patient.getAdminId() == null ? "" : patient.getAdminId() %>">
                            </div>

                            <div class="input-group">
                                <label>Assigned Staff ID</label>
                                <input type="number" name="staffId" value="<%= patient.getStaffId() == null ? "" : patient.getStaffId() %>">
                            </div>

                            <div class="input-group">
                                <label>Username</label>
                                <input type="text" name="username" value="<%= patient.getUsername() == null ? "" : patient.getUsername() %>" required>
                            </div>

                            <div class="input-group">
                                <label>Password</label>
                                <input type="text" name="password" value="<%= patient.getPassword() == null ? "" : patient.getPassword() %>" required>
                            </div>

                            <div class="input-group full">
                                <label>Address</label>
                                <input type="text" name="address" value="<%= patient.getAddress() == null ? "" : patient.getAddress() %>">
                            </div>

                        </div>

                    </section>

                    <div class="form-actions">

                        <a href="${pageContext.request.contextPath}/admin/patients" class="cancel-btn">
                            Cancel
                        </a>

                        <button type="submit" class="save-btn">
                            Update Patient
                        </button>

                    </div>

                </form>

            </div>

        </div>

    </section>

</main>

</body>
</html>
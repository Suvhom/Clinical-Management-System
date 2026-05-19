<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Edit Patient - MotionRehab</title>

    <!-- External CSS files -->
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
            <a class="nav-item active" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
            <a class="nav-item" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
            <a class="nav-item" href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
        </nav>

        <div class="nav-bottom">
            <a class="nav-item" href="#">Settings</a>
            <a class="nav-item" href="${pageContext.request.contextPath}/logout">Log out</a>
        </div>

    </div>

    <!-- Page Area -->
    <section class="page">

        <!-- Topbar -->
        <header class="topbar">

            <h1>Edit Patient</h1>
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

        <!-- Main Content -->
        <div class="content">

            <!-- Breadcrumb -->
            <div class="breadcrumb">
                <a href="${pageContext.request.contextPath}/admin/patients">Patients Directory</a>
                <span>›</span>
                <p>Edit Patient</p>
            </div>

            <!-- Error Message -->
            <c:if test="${not empty param.error}">
                <p class="error-message">
                    Patient could not be updated. Please try again.
                </p>
            </c:if>

            <c:choose>

                <c:when test="${not empty patient}">

                    <!-- Form Card -->
                    <div class="form-card">

                        <form action="${pageContext.request.contextPath}/admin/update-patient" method="post">

                            <input type="hidden" name="patientId" value="${patient.patientId}">

                            <section class="form-section">

                                <h2>Edit Patient Information</h2>

                                <div class="form-grid">

                                    <div class="input-group">
                                        <label for="patientName">Patient Name</label>
                                        <input
                                            type="text"
                                            id="patientName"
                                            name="patientName"
                                            value="${patient.patientName}"
                                            required>
                                    </div>

                                    <div class="input-group">
                                        <label for="email">Email Address</label>
                                        <input
                                            type="email"
                                            id="email"
                                            name="email"
                                            value="${patient.email}">
                                    </div>

                                    <div class="input-group">
                                        <label for="phone">Phone Number</label>
                                        <input
                                            type="text"
                                            id="phone"
                                            name="phone"
                                            value="${patient.phone}">
                                    </div>

                                    <div class="input-group">
                                        <label for="gender">Gender</label>
                                        <select id="gender" name="gender">
                                            <option value="">Select gender</option>

                                            <option value="Male" ${patient.gender == 'Male' ? 'selected' : ''}>
                                                Male
                                            </option>

                                            <option value="Female" ${patient.gender == 'Female' ? 'selected' : ''}>
                                                Female
                                            </option>

                                            <option value="Other" ${patient.gender == 'Other' ? 'selected' : ''}>
                                                Other
                                            </option>
                                        </select>
                                    </div>

                                    <div class="input-group">
                                        <label for="dateOfBirth">Date of Birth</label>
                                        <input
                                            type="date"
                                            id="dateOfBirth"
                                            name="dateOfBirth"
                                            value="${patient.dateOfBirth}">
                                    </div>

                                    <div class="input-group">
                                        <label for="adminId">Admin ID</label>
                                        <input
                                            type="number"
                                            id="adminId"
                                            name="adminId"
                                            value="${patient.adminId}"
                                            placeholder="Leave empty if not needed">
                                    </div>

                                    <div class="input-group">
                                        <label for="staffId">Assigned Staff ID</label>
                                        <input
                                            type="number"
                                            id="staffId"
                                            name="staffId"
                                            value="${patient.staffId}"
                                            placeholder="Leave empty if not assigned">
                                    </div>

                                    <div class="input-group">
                                        <label for="username">Username</label>
                                        <input
                                            type="text"
                                            id="username"
                                            name="username"
                                            value="${patient.username}"
                                            required>
                                    </div>

                                    <div class="input-group">
                                        <label for="password">Password</label>
                                        <input
                                            type="text"
                                            id="password"
                                            name="password"
                                            value="${patient.password}"
                                            required>
                                    </div>

                                    <div class="input-group full">
                                        <label for="address">Address</label>
                                        <input
                                            type="text"
                                            id="address"
                                            name="address"
                                            value="${patient.address}">
                                    </div>

                                </div>

                            </section>

                            <!-- Buttons -->
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

                </c:when>

                <c:otherwise>

                    <div class="form-card">
                        <p class="error-message">
                            Patient not found.
                        </p>

                        <div class="form-actions">
                            <a href="${pageContext.request.contextPath}/admin/patients" class="cancel-btn">
                                Back to Patients
                            </a>
                        </div>
                    </div>

                </c:otherwise>

            </c:choose>

        </div>

    </section>

</main>

</body>
</html>

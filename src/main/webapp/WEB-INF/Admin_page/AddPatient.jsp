<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Patient - MotionRehab</title>

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
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/admins">Admin Directory</a>
        </nav>

        <div class="nav-bottom">
            <a class="nav-item" href="${pageContext.request.contextPath}/admin/logout">Log out</a>
        </div>

    </div>

    <!-- Page Area -->
    <section class="page">

        <!-- Topbar -->
                    <header class="topbar">
                <h1>Add New Patient</h1>

                <div class="top-actions">
                    <div class="profile">
                        <div>
                            <strong>Clinic Administrator</strong>
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
                <span>&gt;</span>
                <p>Add New Patient</p>
            </div>

            <!-- Messages -->
            <c:if test="${not empty param.error}">
                <p class="error-message">
                    Patient could not be saved. Please check the data and try again.
                </p>
            </c:if>

            <c:if test="${not empty param.success}">
                <p class="success-message">
                    Patient saved successfully.
                </p>
            </c:if>

            <!-- Form Card -->
            <div class="form-card">

                <form action="${pageContext.request.contextPath}/admin/add-patient" method="post" autocomplete="off">

                    <section class="form-section">

                        <h2>Patient Information</h2>

                        <div class="form-grid">

                            <div class="input-group">
                                <label for="patientName">Patient Name</label>
                                <input
                                    type="text"
                                    id="patientName"
                                    name="patientName"
                                    placeholder="e.g. Ram K.C"
                                    autocomplete="off"
                                    required>
                            </div>

                            <div class="input-group">
                                <label for="email">Email Address</label>
                                <input
                                    type="email"
                                    id="email"
                                    name="email"
                                    placeholder="eg123@example.com"
                                    autocomplete="off">
                            </div>

                            <div class="input-group">
                                <label for="phone">Phone Number</label>
                                <input
                                    type="text"
                                    id="phone"
                                    name="phone"
                                    placeholder="+977 9800000000"
                                    autocomplete="off">
                            </div>

                            <div class="input-group">
                                <label for="gender">Gender</label>
                                <select id="gender" name="gender">
                                    <option value="">Select gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>

                            <div class="input-group">
                                <label for="dateOfBirth">Date of Birth</label>
                                <input
                                    type="date"
                                    id="dateOfBirth"
                                    name="dateOfBirth">
                            </div>

                            <div class="input-group">
                                <label for="adminId">Admin ID</label>
                                <input
                                    type="number"
                                    id="adminId"
                                    name="adminId"
                                    placeholder="Leave empty if not needed"
                                    autocomplete="off">
                            </div>

                            <div class="input-group">
                                <label for="staffId">Assigned Staff ID</label>
                                <input
                                    type="number"
                                    id="staffId"
                                    name="staffId"
                                    placeholder="Leave empty if not assigned"
                                    autocomplete="off">
                            </div>

                            <div class="input-group">
                                <label for="username">Username</label>
                                <input
                                    type="text"
                                    id="username"
                                    name="username"
                                    placeholder="e.g. Ram"
                                    autocomplete="new-password"
                                    required>
                            </div>

                            <div class="input-group">
                                <label for="password">Password</label>
                                <input
                                    type="password"
                                    id="password"
                                    name="password"
                                    placeholder="Enter password"
                                    autocomplete="new-password"
                                    required>
                            </div>

                            <div class="input-group full">
                                <label for="address">Address</label>
                                <input
                                    type="text"
                                    id="address"
                                    name="address"
                                    placeholder="Enter full address"
                                    autocomplete="off">
                            </div>

                        </div>

                    </section>

                    <!-- Buttons -->
                    <div class="form-actions">

                        <a href="${pageContext.request.contextPath}/admin/patients" class="cancel-btn">
                            Cancel
                        </a>

                        <button type="submit" class="save-btn">
                            Save Patient
                        </button>

                    </div>

                </form>

            </div>

        </div>

    </section>

</main>

</body>
</html>

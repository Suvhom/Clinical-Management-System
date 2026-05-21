<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Upload Exercise - MotionRehab</title>

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

    <!-- Main Page -->
    <section class="page">

        <!-- Topbar -->
                    <header class="topbar">
                <h1>Upload Exercise</h1>

                <div class="top-actions">
                    <div class="profile">
                        <div>
                            <strong>Clinic Administrator</strong>
                        </div>
                        <img class="profile-avatar" src="${pageContext.request.contextPath}/Images/Admin_Profile.png" alt="Admin profile" width="48" height="48">
                    </div>
                </div>
            </header>

        <!-- Content -->
        <div class="content">

            <!-- Breadcrumb -->
            <div class="breadcrumb">
                <a href="${pageContext.request.contextPath}/admin/patients">Patients Directory</a>
                <span>&gt;</span>
                <p>Upload Exercise</p>
            </div>

            <!-- Error Message -->
            <c:if test="${not empty param.error}">
                <p class="error-message">
                    <c:choose>
                        <c:when test="${param.error == 'missingname'}">
                            Exercise Name is required.
                        </c:when>

                        <c:otherwise>
                            Exercise could not be saved. Please check the data and try again.
                        </c:otherwise>
                    </c:choose>
                </p>
            </c:if>

            <c:choose>

                <c:when test="${not empty patient}">

                    <!-- Form Card -->
                    <div class="form-card">

                        <form action="${pageContext.request.contextPath}/admin/save-exercise" method="post">

                            <input type="hidden" name="patientId" value="${patient.patientId}">

                            <section class="form-section">

                                <h2>
                                    Upload Exercise for ${patient.patientName}
                                    <span class="muted-text">(ID: ${patient.patientId})</span>
                                </h2>

                                <p class="form-note">
                                    Configure and assign rehabilitation exercise details for this patient.
                                </p>

                                <div class="form-grid">

                                    <div class="input-group full">
                                        <label for="exerciseName">
                                            Exercise Name <span class="required-star">*</span>
                                        </label>

                                        <input
                                            type="text"
                                            id="exerciseName"
                                            name="exerciseName"
                                            placeholder="e.g. Quad Clenches"
                                            required>
                                    </div>

                                    <div class="input-group">
                                        <label for="focusArea">Focus Area</label>

                                        <input
                                            type="text"
                                            id="focusArea"
                                            name="focusArea"
                                            placeholder="e.g. Quadriceps, Lower Knee">
                                    </div>

                                    <div class="input-group">
                                        <label for="videoUrl">Video URL</label>

                                        <input
                                            type="url"
                                            id="videoUrl"
                                            name="videoUrl"
                                            placeholder="e.g. https://www.youtube.com/watch?v=...">
                                    </div>

                                    <div class="input-group full">
                                        <label for="description">Exercise Description</label>

                                        <textarea
                                            id="description"
                                            name="description"
                                            placeholder="Describe the steps, sets, repetitions, or cautions for the exercise..."
                                            rows="5"></textarea>
                                    </div>

                                </div>

                            </section>

                            <!-- Buttons -->
                            <div class="form-actions">

                                <a href="${pageContext.request.contextPath}/admin/patients" class="cancel-btn">
                                    Cancel
                                </a>

                                <button type="submit" class="save-btn">
                                    Save Exercise
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

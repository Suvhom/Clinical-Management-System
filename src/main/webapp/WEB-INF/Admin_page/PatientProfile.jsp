<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Patients - MotionRehab</title>

    <!-- Importing External CSS files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/PatientProfile.css">
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

            <h1>Patients</h1>
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

            <!-- Page Heading -->
            <div class="title-row">

                <div>
                    <h2>Patients Directory</h2>
                    <p>View and manage registered patients</p>
                </div>

                <a class="primary" href="${pageContext.request.contextPath}/admin/add-patient">  + Add New Patient </a>

            </div>

            <!-- Messages -->
            <c:if test="${not empty param.success}">
                <p class="success-message">Patient added successfully.</p>
            </c:if>

            <c:if test="${not empty param.updated}">
                <p class="success-message">Patient updated successfully.</p>
            </c:if>

            <c:if test="${not empty param.successUpload}">
                <p class="success-message">Exercise uploaded successfully for the patient.</p>
            </c:if>

            <c:if test="${not empty param.deleted}">
                <p class="delete-message">
                    Patient record and related appointments were deleted successfully.
                </p>
            </c:if>

            <c:if test="${not empty param.error}">
                <p class="error-message">
                    Something went wrong. Please try again.
                </p>
            </c:if>

            <!-- Search Bar -->
            <div class="search-row">

                <form action="${pageContext.request.contextPath}/admin/patients" method="get" class="patient-search-form">

                    <div class="search-input-wrap">
                        <input
                            type="text"
                            name="search"
                            placeholder="Search by patient name or ID"
                            value="${param.search}">
                    </div>

                    <button type="submit" class="search-btn">
                        Search
                    </button>

                    <c:if test="${not empty param.search}">
                        <a href="${pageContext.request.contextPath}/admin/patients" class="clear-btn">
                            Clear
                        </a>
                    </c:if>

                </form>

            </div>

            <!-- Patients Table -->
            <div class="table-card">

                <table>

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Patient Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Gender</th>
                            <th>Date of Birth</th>
                            <th>Username</th>
                            <th>Created At</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:choose>

                            <c:when test="${not empty patients}">

                                <c:forEach var="patient" items="${patients}">

                                    <tr>
                                        <td>${patient.patientId}</td>

                                        <td>
                                            <a class="patient-link"
                                               href="${pageContext.request.contextPath}/admin/patient-detail?id=${patient.patientId}">
                                                ${empty patient.patientName ? '-' : patient.patientName}
                                            </a>
                                        </td>

                                        <td>${empty patient.email ? '-' : patient.email}</td>
                                        <td>${empty patient.phone ? '-' : patient.phone}</td>
                                        <td>${empty patient.gender ? '-' : patient.gender}</td>
                                        <td>${empty patient.dateOfBirth ? '-' : patient.dateOfBirth}</td>
                                        <td>${empty patient.username ? '-' : patient.username}</td>
                                        <td>${empty patient.createdAt ? '-' : patient.createdAt}</td>

                                        <td>

                                        <!-- Action to Edit delete and upload exercise for patient -->
                                            <div class="action-group">

                                                <a class="edit-btn"
                                                   href="${pageContext.request.contextPath}/admin/edit-patient?id=${patient.patientId}">
                                                    Edit
                                                </a>

                                                <a class="upload-btn"
                                                   href="${pageContext.request.contextPath}/admin/upload-exercise?patientId=${patient.patientId}">
                                                    Upload Exercise
                                                </a>

                                                <a class="delete-btn"
                                                   href="${pageContext.request.contextPath}/admin/delete-patient?id=${patient.patientId}"
                                                   onclick="return confirm('Are you sure you want to delete this patient record?');">
                                                    Delete
                                                </a>

                                            </div>
                                        </td>
                                    </tr>

                                </c:forEach>

                            </c:when>

                            <c:otherwise>
                                <tr>
                                    <td colspan="9">No patients found.</td>
                                </tr>
                            </c:otherwise>

                        </c:choose>

                    </tbody>

                </table>

            </div>

        </div>

    </section>

</main>

</body>
</html>

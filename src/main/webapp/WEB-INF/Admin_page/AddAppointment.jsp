<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/admins">Admin Directory</a>
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
                    <a href="${pageContext.request.contextPath}/admin/appointments">Appointments Directory</a>
                    <span>&gt;</span>
                    <p>Schedule Appointment</p>
                </div>

                <c:if test="${not empty errorMessage}">
                    <p class="error-message">
                        ${errorMessage}
                    </p>
                </c:if>

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
                                        <c:forEach var="patient" items="${patientsList}">
                                            <option value="${patient.patientId}" ${selectedPatientId == patient.patientId ? 'selected' : ''}>
                                                ${patient.patientName} (#PT-${patient.patientId})
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <label for="staffId">Assigned Physiotherapist / Staff</label>
                                    <select id="staffId" name="staffId" required>
                                        <option value="">Choose staff...</option>
                                        <c:forEach var="staff" items="${staffList}">
                                            <option value="${staff[0]}" ${enteredStaffId == staff[0] ? 'selected' : ''}>
                                                ${staff[1]} (#${staff[0]})
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <label for="appointmentDate">Appointment Date</label>
                                    <input
                                        type="date"
                                        id="appointmentDate"
                                        name="appointmentDate"
                                        value="${empty enteredDate ? '' : enteredDate}"
                                        required>
                                </div>

                                <div class="input-group">
                                    <label for="appointmentTime">Preferred Time Slot</label>
                                    <input
                                        type="time"
                                        id="appointmentTime"
                                        name="appointmentTime"
                                        value="${empty enteredTime ? '' : enteredTime}"
                                        required>
                                </div>

                                <div class="input-group full">
                                    <label for="reason">Treatment / Visit Reason</label>
                                    <select id="reason" name="reason" required>
                                        <option value="">Select Treatment Reason</option>
                                        <option value="General Physiotherapy" ${enteredReason == 'General Physiotherapy' ? 'selected' : ''}>General Physiotherapy</option>
                                        <option value="Sports Injury Rehab" ${enteredReason == 'Sports Injury Rehab' ? 'selected' : ''}>Sports Injury Rehab</option>
                                        <option value="Back and Neck Pain" ${enteredReason == 'Back and Neck Pain' ? 'selected' : ''}>Back and Neck Pain</option>
                                        <option value="Post-Surgical Rehab" ${enteredReason == 'Post-Surgical Rehab' ? 'selected' : ''}>Post-Surgical Rehab</option>
                                        <option value="Manual Therapy" ${enteredReason == 'Manual Therapy' ? 'selected' : ''}>Manual Therapy</option>
                                        <option value="Neurological Rehab" ${enteredReason == 'Neurological Rehab' ? 'selected' : ''}>Neurological Rehab</option>
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

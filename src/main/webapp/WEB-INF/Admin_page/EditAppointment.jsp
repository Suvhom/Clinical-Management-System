<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reschedule / Edit Appointment - MotionRehab</title>

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
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/logout">Log out</a>
            </div>

        </div>

        <!-- Main Page Area -->
        <section class="page">

            <!-- Topbar -->
            <header class="topbar">
                <h1>Edit Appointment</h1>

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
                    <p>Reschedule / Edit Appointment</p>
                </div>

                <c:if test="${not empty errorMessage}">
                    <p class="error-message">
                        ${errorMessage}
                    </p>
                </c:if>

                <!-- Form Card -->
                <div class="form-card">

                    <form action="${pageContext.request.contextPath}/admin/update-appointment" method="post">

                        <input type="hidden" name="appointmentId" value="${appointment.appointmentId}">

                        <section class="form-section">

                            <h2>Edit Appointment Details</h2>

                            <div class="form-grid">

                                <div class="input-group">
                                    <label for="patientId">Select Patient</label>
                                    <select id="patientId" name="patientId" required>
                                        <c:forEach var="patient" items="${patientsList}">
                                            <option value="${patient.patientId}" ${patient.patientId == appointment.patientId ? 'selected' : ''}>
                                                ${patient.patientName} (PT-${patient.patientId})
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <label for="staffId">Assigned Physiotherapist / Staff</label>
                                    <select id="staffId" name="staffId" required>
                                        <c:forEach var="staff" items="${staffList}">
                                            <option value="${staff[0]}" ${staff[0] == appointment.staffId ? 'selected' : ''}>
                                                ${staff[1]} (ST-${staff[0]})
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
                                        value="${appointment.appointmentDate}"
                                        required>
                                </div>

                                <div class="input-group">
                                    <label for="appointmentTime">Preferred Time Slot</label>
                                    <input
                                        type="time"
                                        id="appointmentTime"
                                        name="appointmentTime"
                                        value="${appointment.appointmentTime}"
                                        required>
                                </div>

                                <div class="input-group">
                                    <label for="reason">Treatment / Visit Reason</label>
                                    <select id="reason" name="reason" required>
                                        <option value="General Physiotherapy" ${appointment.reason == 'General Physiotherapy' ? 'selected' : ''}>General Physiotherapy</option>
                                        <option value="Sports Injury Rehab" ${appointment.reason == 'Sports Injury Rehab' ? 'selected' : ''}>Sports Injury Rehab</option>
                                        <option value="Back and Neck Pain" ${appointment.reason == 'Back and Neck Pain' ? 'selected' : ''}>Back and Neck Pain</option>
                                        <option value="Post-Surgical Rehab" ${appointment.reason == 'Post-Surgical Rehab' ? 'selected' : ''}>Post-Surgical Rehab</option>
                                        <option value="Manual Therapy" ${appointment.reason == 'Manual Therapy' ? 'selected' : ''}>Manual Therapy</option>
                                        <option value="Neurological Rehab" ${appointment.reason == 'Neurological Rehab' ? 'selected' : ''}>Neurological Rehab</option>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <label for="status">Appointment Status</label>
                                    <select id="status" name="status" required>
                                        <option value="Pending" ${appointment.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                        <option value="Confirmed" ${appointment.status == 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                                        <option value="Completed" ${appointment.status == 'Completed' ? 'selected' : ''}>Completed</option>
                                        <option value="Cancelled" ${appointment.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                                        <option value="Rescheduled" ${appointment.status == 'Rescheduled' ? 'selected' : ''}>Rescheduled</option>
                                    </select>
                                </div>

                            </div>

                        </section>

                        <!-- Buttons -->
                        <div class="form-actions">

                            <a href="${pageContext.request.contextPath}/admin/appointments" class="cancel-btn">
                                Cancel
                            </a>

                            <button type="submit" class="save-btn blue-save-btn">
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Detail - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/PatientDetail.css">
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
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/admins">Admin Directory</a>
            </nav>

            <div class="nav-bottom">
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/logout">Log out</a>
            </div>

        </div>

        <section class="page">

            <header class="topbar">
                <h1>Admin Overview</h1>

                <div class="top-actions">
                    <div class="profile">
                        <div>
                            <strong>Clinic Administrator</strong>
                        </div>
                        <img class="profile-avatar" src="${pageContext.request.contextPath}/Images/Admin_Profile.png" alt="Admin profile" width="48" height="48">
                    </div>
                </div>
            </header>

            <div class="content">

                <c:choose>
                    <c:when test="${empty patient}">
                        <div class="patient-not-found">
                            <h2>Patient Record Not Found</h2>
                            <p>The requested patient record could not be found or does not exist in the database.</p>
                            <a class="primary-btn not-found-link" href="${pageContext.request.contextPath}/admin/patients">Back to Patients Directory</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a class="back" href="${pageContext.request.contextPath}/admin/patients">
                            Back to Patients
                        </a>

                        <div class="card patient-hero">

                            <div class="patient-info">
                                <div class="patient-avatar large"></div>

                                <div>
                                    <h2>${empty patient.patientName ? '-' : patient.patientName}</h2>

                                    <p>
                                        PT-${patient.patientId} | ${empty patient.gender ? 'Not Specified' : patient.gender} <br>
                                        Phone: ${empty patient.phone ? 'Not Specified' : patient.phone} <br>
                                        Email: ${empty patient.email ? 'Not Specified' : patient.email} <br>
                                        Date of Birth: ${empty patient.dateOfBirth ? 'Not Specified' : patient.dateOfBirth}
                                    </p>

                                    <div class="patient-actions">
                                        <button>Message</button>
                                        <a class="btn-link" href="${pageContext.request.contextPath}/admin/edit-patient?id=${patient.patientId}">Edit Profile</a>
                                        <a class="btn-link delete" href="#" onclick="confirmDelete(${patient.patientId})">Delete Patient</a>
                                    </div>
                                </div>
                            </div>

                            <span class="pill green">Active</span>

                        </div>

                        <div class="detail-grid">

                            <section class="left-column">

                                <div class="card">
                                    <div class="card-head">
                                        <h2>Appointment History</h2>
                                    </div>

                                    <c:choose>
                                        <c:when test="${not empty appointmentsList}">
                                            <c:forEach var="a" items="${appointmentsList}">
                                                <div class="history-item ${a.status == 'Cancelled' ? 'status-cancelled' : a.status == 'Confirmed' ? 'status-confirmed' : a.status == 'Pending' ? 'status-pending' : a.status == 'Rescheduled' ? 'status-rescheduled' : 'status-default'}">
                                                    <strong>${a.appointmentDate} at ${a.appointmentTime}</strong>
                                                    <p class="history-reason">
                                                        ${empty a.reason ? '-' : a.reason}
                                                        <span class="pill compact-pill ${a.status == 'Confirmed' ? 'green' : a.status == 'Pending' ? 'yellow' : a.status == 'Cancelled' ? 'red' : a.status == 'Rescheduled' ? 'orange' : 'gray'}">${a.status}</span>
                                                    </p>
                                                    <p class="history-staff">
                                                        Assigned Staff ID: <strong>ST-${a.staffId}</strong>
                                                    </p>
                                                </div>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="patient-empty-state">
                                                <p>No appointments found in this patient's medical history timeline.</p>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

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

                            <aside class="right-column">

                                <div class="card prescribe-card">
                                    <h2>Prescribe Exercise</h2>
                                    <p>Add new exercises to patient plan.</p>

                                    <a class="primary-btn" href="${pageContext.request.contextPath}/admin/add-exercise">
                                        Add Exercise
                                    </a>
                                </div>

                                <div class="card">
                                    <h2>Vitals</h2>

                                    <div class="vitals">
                                        <p><span>Height</span><strong>182 cm</strong></p>
                                        <p><span>Weight</span><strong>78 kg</strong></p>
                                        <p><span>Blood Type</span><strong>O+</strong></p>
                                        <p><span>Allergies</span><strong>Penicillin</strong></p>
                                    </div>
                                </div>

                                <div class="card">
                                    <h2>Upcoming Appointment</h2>

                                    <c:choose>
                                        <c:when test="${not empty upcomingAppointment}">
                                            <div class="appointment-box upcoming-box">
                                                <strong>${upcomingAppointment.reason} with Staff ST-${upcomingAppointment.staffId}</strong>
                                                <p>${upcomingAppointment.appointmentDate} - ${upcomingAppointment.appointmentTime}</p>
                                                <span class="pill compact-pill upcoming-status ${upcomingAppointment.status == 'Confirmed' ? 'green' : upcomingAppointment.status == 'Rescheduled' ? 'orange' : 'yellow'}">${upcomingAppointment.status}</span>
                                            </div>

                                            <a class="secondary-btn appointment-action-link" href="${pageContext.request.contextPath}/admin/edit-appointment?id=${upcomingAppointment.appointmentId}">Reschedule / Edit</a>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="appointment-box no-upcoming-box">
                                                <p>No upcoming visits scheduled.</p>
                                            </div>
                                            <a class="secondary-btn appointment-action-link schedule-link" href="${pageContext.request.contextPath}/admin/add-appointment?patientId=${patient.patientId}">Schedule Visit</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                            </aside>

                        </div>
                    </c:otherwise>
                </c:choose>

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

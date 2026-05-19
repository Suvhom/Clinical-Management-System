<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Appointments - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/AdminAppointments.css?v=2">

    <style>
        .new-appointment-btn {
            text-decoration: none !important;
        }

        .filter-card {
            display: flex !important;
            align-items: center !important;
            justify-content: space-between !important;
            gap: 18px !important;
            flex-wrap: wrap !important;
        }

        .appointment-search-form {
            display: flex !important;
            align-items: center !important;
            gap: 14px !important;
            width: min(100%, 620px) !important;
        }

        .appointment-search-form .filter-search {
            flex: 1 !important;
            width: auto !important;
            height: 44px !important;
        }

        .filter-search input {
            width: 100% !important;
            height: 100% !important;
            border: none !important;
            outline: none !important;
            background: transparent !important;
        }

        .search-btn {
            height: 44px !important;
            min-width: 110px !important;
            width: auto !important;
        }
    </style>
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

    <!-- Page -->
    <section class="page">

        <!-- Topbar -->
        <header class="topbar">

            <h1>Appointments</h1>

            <div class="top-actions">

                <button class="icon" type="button">!</button>

                <div class="profile">
                    <div>
                        <strong>Dr. Suvhom K.C</strong>
                        <span>Clinic Administrator</span>
                    </div>

                    <img class="profile-avatar"
                         src="${pageContext.request.contextPath}/Images/Admin_Profile.png"
                         alt="Admin profile"
                         width="48"
                         height="48">
                </div>

            </div>

        </header>

        <!-- Content -->
        <section class="content">

            <!-- Title -->
            <div class="title-row">

                <div>
                    <h2>Manage Appointments</h2>
                    <p>View, schedule and manage all patient appointments.</p>
                </div>

                <a class="primary-btn new-appointment-btn"
                   href="${pageContext.request.contextPath}/admin/add-appointment">
                    + New Appointment
                </a>

            </div>

            <!-- Success Messages -->
            <c:if test="${not empty param.success}">

                <c:choose>

                    <c:when test="${param.success == '1'}">
                        <p class="success-message">
                            Appointment scheduled successfully.
                        </p>
                    </c:when>

                    <c:when test="${param.success == '2'}">
                        <p class="success-message info-message">
                            Appointment rescheduled / updated successfully.
                        </p>
                    </c:when>

                    <c:when test="${param.success == '3'}">
                        <p class="success-message warning-message">
                            Appointment cancelled successfully.
                        </p>
                    </c:when>

                    <c:when test="${param.success == '4'}">
                        <p class="success-message delete-message">
                            Appointment has been deleted successfully from the database.
                        </p>
                    </c:when>

                </c:choose>

            </c:if>

            <!-- Filters -->
            <div class="filter-card">

                <div class="tabs">

                    <a class="${empty currentFilter || currentFilter == 'all' ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/admin/appointments?filter=all&search=${empty currentSearch ? '' : currentSearch}">
                        All Appointments
                    </a>

                    <a class="${currentFilter == 'today' ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/admin/appointments?filter=today&search=${empty currentSearch ? '' : currentSearch}">
                        Today
                    </a>

                    <a class="${currentFilter == 'upcoming' ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/admin/appointments?filter=upcoming&search=${empty currentSearch ? '' : currentSearch}">
                        Upcoming
                    </a>

                    <a class="${currentFilter == 'pending' ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/admin/appointments?filter=pending&search=${empty currentSearch ? '' : currentSearch}">
                        Pending
                    </a>

                </div>

                <form action="${pageContext.request.contextPath}/admin/appointments"
                      method="get"
                      class="appointment-search-form">

                    <input type="hidden"
                           name="filter"
                           value="${empty currentFilter ? 'all' : currentFilter}">

                    <div class="filter-search">
                        <input
                            type="text"
                            name="search"
                            value="${empty currentSearch ? '' : currentSearch}"
                            placeholder="Search patient, staff ID, reason, status...">
                    </div>

                    <button type="submit" class="primary-btn search-btn">
                        Search
                    </button>

                </form>

            </div>

            <!-- Table -->
            <div class="table-card">

                <table>

                    <thead>
                        <tr>
                            <th>Patient</th>
                            <th>Date & Time</th>
                            <th>Assigned Staff</th>
                            <th>Reason / Treatment</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:choose>

                            <c:when test="${not empty appointmentsList}">

                                <c:forEach var="appt" items="${appointmentsList}">

                                    <c:set var="pillClass" value="gray" />

                                    <c:choose>
                                        <c:when test="${appt.status == 'Confirmed'}">
                                            <c:set var="pillClass" value="green" />
                                        </c:when>

                                        <c:when test="${appt.status == 'In Progress'}">
                                            <c:set var="pillClass" value="orange" />
                                        </c:when>

                                        <c:when test="${appt.status == 'Pending'}">
                                            <c:set var="pillClass" value="yellow" />
                                        </c:when>

                                        <c:when test="${appt.status == 'Cancelled'}">
                                            <c:set var="pillClass" value="red" />
                                        </c:when>

                                        <c:when test="${appt.status == 'Rescheduled'}">
                                            <c:set var="pillClass" value="orange" />
                                        </c:when>

                                        <c:when test="${appt.status == 'Completed'}">
                                            <c:set var="pillClass" value="gray" />
                                        </c:when>
                                    </c:choose>

                                    <tr>

                                        <td>
                                            <div class="person">
                                                <span class="avatar a1"></span>

                                                <div>
                                                    <strong>${empty appt.patientName ? '-' : appt.patientName}</strong>
                                                    <small>#PT-${appt.patientId}</small>
                                                </div>
                                            </div>
                                        </td>

                                        <td>
                                            <strong>${empty appt.appointmentTime ? '-' : appt.appointmentTime}</strong>
                                            <small>${empty appt.appointmentDate ? '-' : appt.appointmentDate}</small>
                                        </td>

                                        <td>
                                            <div class="doctor">
                                                <span class="avatar small a2"></span>
                                                <strong>Staff #${appt.staffId}</strong>
                                            </div>
                                        </td>

                                        <td>
                                            ${empty appt.reason ? '-' : appt.reason}
                                        </td>

                                        <td>
                                            <span class="pill ${pillClass}">
                                                ${empty appt.status ? '-' : appt.status}
                                            </span>
                                        </td>

                                        <td>
                                            <div class="actions">

                                                <a class="action-btn edit-action"
                                                   href="${pageContext.request.contextPath}/admin/edit-appointment?id=${appt.appointmentId}"
                                                   title="Reschedule / Edit">
                                                   
                                                </a>

                                                <a class="action-btn delete-action"
                                                   href="${pageContext.request.contextPath}/admin/delete-appointment?id=${appt.appointmentId}"
                                                   onclick="return confirm('Are you sure you want to delete this appointment record?');"
                                                   title="Delete Appointment">
                                                   
                                                </a>

                                            </div>
                                        </td>

                                    </tr>

                                </c:forEach>

                            </c:when>

                            <c:otherwise>

                                <tr>
                                    <td colspan="6" class="empty-row">
                                        No appointments found matching your filters.
                                    </td>
                                </tr>

                            </c:otherwise>

                        </c:choose>

                    </tbody>

                </table>

                <div class="table-footer">
                    <p>Showing ${empty appointmentsList ? 0 : fn:length(appointmentsList)} entries</p>
                </div>

            </div>

        </section>

    </section>

</main>

</body>

</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/AdminDashboard.css">
</head>

<body>

    <main class="layout">

        <div class="sidebar">

            <div class="brand">
                <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="MotionRehab Logo">
                <span>MotionRehab</span>
            </div>

            <nav class="nav-menu">
                <a class="nav-item active" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/appointments">Appointments</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
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

                <section class="stats-grid">

                    <div class="card stat">
                        <span>Total Patients</span>
                        <b><fmt:formatNumber value="${empty overviewCounts.totalPatients ? 0 : overviewCounts.totalPatients}" type="number" /></b>
                        <small class="ok">Registered patients</small>
                    </div>

                    <div class="card stat">
                        <span>Total Staff</span>
                        <b>${empty overviewCounts.totalStaff ? 0 : overviewCounts.totalStaff}</b>
                        <small>All staff members</small>
                    </div>

                    <div class="card stat">
                        <span>Active Staff</span>
                        <b>${empty overviewCounts.activeDoctors ? 0 : overviewCounts.activeDoctors}</b>
                        <small class="ok">Physiotherapists online</small>
                    </div>

                    <div class="card stat">
                        <span>Appointments Today</span>
                        <b>${empty overviewCounts.appointmentsToday ? 0 : overviewCounts.appointmentsToday}</b>
                        <small>Active bookings</small>
                    </div>

                    <div class="card stat">
                        <span>Monthly Revenue</span>
                        <b>NRP <fmt:formatNumber value="${empty overviewCounts.monthlyRevenue ? 0 : overviewCounts.monthlyRevenue}" type="number" /></b>
                        <small class="ok">Current month</small>
                    </div>

                </section>

                <section class="dashboard-grid">

                    <article class="card appointments">

                        <div class="card-head">
                            <h2>Today's Appointments</h2>
                            <a class="schedule-btn" href="${pageContext.request.contextPath}/admin/appointments">
                                View All Schedule
                            </a>
                        </div>

                        <table>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty todayAppointments}">
                                        <tr>
                                            <td colspan="5" class="dashboard-empty-cell">
                                                No appointments scheduled for today.
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="appt" items="${todayAppointments}" varStatus="status">
                                            <tr>
                                                <td>${appt[3]}</td>
                                                <td>
                                                    <b class="avatar mini a${(status.index mod 6) + 1}"></b>
                                                    ${appt[1]}
                                                    <br>
                                                    <small>PT-${appt[0]}</small>
                                                </td>
                                                <td>${appt[2]}</td>
                                                <td>${appt[4]}</td>
                                                <td>
                                                    <span class="pill ${appt[5] == 'Completed' || appt[5] == 'Confirmed' ? 'green' : appt[5] == 'In Progress' || appt[5] == 'Rescheduled' ? 'orange' : appt[5] == 'Cancelled' ? 'red' : 'yellow'}">
                                                        ${appt[5]}
                                                    </span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>

                    </article>

                    <aside class="right-col">

                        <article class="card">
                            <h2>Available Staff</h2>
                            <div class="staff-list">
                                <c:choose>
                                    <c:when test="${empty availableStaff}">
                                        <p class="dashboard-empty-text">No active staff found.</p>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="staff" items="${availableStaff}" varStatus="status">
                                            <div class="staff-list-item">
                                                <b class="avatar mini staff-avatar a${((status.index + 1) mod 6) + 1}"></b>
                                                <div class="staff-list-info">
                                                    <div class="staff-list-head">
                                                        <strong>${staff[1]}</strong>
                                                        <span class="dot ${staff[5] == 'Busy' ? 'busy' : ''}" title="${staff[5]}"></span>
                                                    </div>
                                                    <div class="staff-specialization">${staff[2]}</div>
                                                    <div class="staff-contact-list">
                                                        <span>Phone: ${staff[3]}</span>
                                                        <span>Email: ${staff[4]}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </article>

                        <article class="card activity">
                            <h2>Recent Activity</h2>
                            <div class="activity-list">
                                <c:choose>
                                    <c:when test="${empty recentActivities}">
                                        <p class="dashboard-empty-text">No recent activities logged.</p>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="act" items="${recentActivities}">
                                            <div class="activity-item">
                                                <span>${act[0]}</span>
                                                <small>${act[1]}</small>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </article>

                    </aside>

                </section>

            </div>

        </section>

    </main>

</body>

</html>

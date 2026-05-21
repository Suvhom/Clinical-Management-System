<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Directory - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/AdminStaff.css">
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
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
                <a class="nav-item active" href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/admins">Admin Directory</a>
            </nav>

            <div class="nav-bottom">
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/logout">Log out</a>
            </div>

        </div>

        <section class="page">

            <header class="topbar">
                <h1>Staff Management</h1>

                <div class="top-actions">
                    <div class="profile">
                        <div>
                            <strong>Clinic Administrator</strong>
                        </div>
                        <img class="profile-avatar" src="${pageContext.request.contextPath}/Images/Admin_Profile.png" alt="Admin profile" width="48" height="48">
                    </div>
                </div>
            </header>

            <section class="content">

                <div class="title-row">
                    <div>
                        <h2>Staff Directory</h2>
                        <p>Manage clinic physiotherapists, specialties, workloads and schedules.</p>
                    </div>

                    <a class="primary-btn staff-add-btn" href="${pageContext.request.contextPath}/admin/add-staff">+ Add Staff Member</a>
                </div>

                <c:if test="${not empty param.success}">
                    <c:choose>
                        <c:when test="${param.success == '1'}">
                            <p class="success-message">New staff record registered successfully.</p>
                        </c:when>
                        <c:when test="${param.success == '2'}">
                            <p class="success-message">Staff profile and availability status updated successfully.</p>
                        </c:when>
                        <c:when test="${param.success == '3'}">
                            <p class="delete-message">Staff record has been deleted successfully.</p>
                        </c:when>
                    </c:choose>
                </c:if>

                <c:if test="${not empty param.error}">
                    <p class="error-message">Failed to perform the operation. Please try again.</p>
                </c:if>

                <div class="filter-card staff-filter-card">
                    <form class="staff-search-form" action="${pageContext.request.contextPath}/admin/staff" method="get">
                        <div class="staff-search-field">
                            <input
                                type="text"
                                name="search"
                                value="${empty currentSearch ? '' : currentSearch}"
                                placeholder="Search by Staff ID, Name, Specialization, Email..."
                            >
                        </div>
                        <button type="submit" class="primary-btn staff-search-btn">Search</button>
                        <a class="staff-clear-btn" href="${pageContext.request.contextPath}/admin/staff">Clear</a>
                    </form>
                </div>

                <div class="table-card">

                    <table>
                        <thead>
                            <tr>
                                <th>Staff Member</th>
                                <th>Specialization / Credentials</th>
                                <th>Contact Information</th>
                                <th>Experience</th>
                                <th>Active Workload</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty staffList}">
                                    <c:forEach var="s" items="${staffList}">
                                        <tr>
                                            <td>
                                                <div class="person">
                                                    <span class="avatar a2"></span>
                                                    <div>
                                                        <strong>${empty s.staffName ? '-' : s.staffName}</strong>
                                                        <small>ST-${s.staffId} | ${empty s.gender ? '-' : s.gender}</small>
                                                    </div>
                                                </div>
                                            </td>

                                            <td>
                                                <strong>${empty s.specialization ? '-' : s.specialization}</strong>
                                                <small>${empty s.qualification ? '-' : s.qualification}</small>
                                            </td>

                                            <td>
                                                <strong>${empty s.email ? '-' : s.email}</strong>
                                                <small>${empty s.phone ? '-' : s.phone}</small>
                                            </td>

                                            <td>
                                                <strong>${s.experience} Yrs</strong>
                                            </td>

                                            <td>
                                                <span class="pill workload-pill ${s.activeAppointmentsCount == 0 ? 'green' : s.activeAppointmentsCount <= 2 ? 'yellow' : 'red'}">
                                                    ${s.activeAppointmentsCount} active ${s.activeAppointmentsCount == 1 ? 'appt' : 'appts'}
                                                </span>
                                            </td>

                                            <td>
                                                <span class="pill ${s.status == 'Active' ? 'green' : s.status == 'Busy' ? 'orange' : s.status == 'On Leave' ? 'yellow' : s.status == 'Inactive' ? 'red' : 'gray'}">
                                                    ${empty s.status ? '-' : s.status}
                                                </span>
                                            </td>

                                            <td>
                                                <div class="staff-action-group">
                                                    <a href="${pageContext.request.contextPath}/admin/edit-staff?id=${s.staffId}" class="staff-action-btn edit" title="Edit Profile">Edit</a>
                                                    <a href="${pageContext.request.contextPath}/admin/delete-staff?id=${s.staffId}" class="staff-action-btn delete" onclick="return confirm('Are you sure you want to delete this staff member?');" title="Delete Profile">Delete</a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="7" class="empty-table-cell">
                                            No staff members found matching your search parameters.
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>

                    <div class="table-footer">
                        <p>Showing ${empty staffList ? 0 : staffList.size()} entries</p>
                    </div>

                </div>

            </section>

        </section>

    </main>

</body>

</html>

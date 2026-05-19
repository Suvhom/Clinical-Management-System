<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.AppointmentModel" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Appointments - MotionRehab</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/AdminAppointments.css">
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
                        <img class="profile-avatar" src="${pageContext.request.contextPath}/Images/Admin_Profile.png" alt="Admin profile" width="48" height="48">
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

                    <a class="primary-btn" href="${pageContext.request.contextPath}/admin/add-appointment" style="text-decoration: none; display: inline-flex; align-items: center; justify-content: center; height: 46px; box-sizing: border-box;">+ New Appointment</a>
                </div>

                <!-- Success / Notification Banners -->
                <% if (request.getParameter("success") != null) { %>
                    <% if ("1".equals(request.getParameter("success"))) { %>
                        <p class="success-message" style="background: #dcfce7; color: #15803d; padding: 12px 18px; border-radius: 8px; font-weight: 600; margin-bottom: 20px;">
                            ✔ Appointment scheduled successfully.
                        </p>
                    <% } else if ("2".equals(request.getParameter("success"))) { %>
                        <p class="success-message" style="background: #e0f2fe; color: #0369a1; padding: 12px 18px; border-radius: 8px; font-weight: 600; margin-bottom: 20px;">
                            ✔ Appointment rescheduled / updated successfully.
                        </p>
                    <% } else if ("3".equals(request.getParameter("success"))) { %>
                        <p class="success-message" style="background: #fee2e2; color: #b91c1c; padding: 12px 18px; border-radius: 8px; font-weight: 600; margin-bottom: 20px;">
                            ✔ Appointment cancelled successfully.
                        </p>
                    <% } else if ("4".equals(request.getParameter("success"))) { %>
                        <p class="success-message" style="background: #fee2e2; color: #b91c1c; padding: 12px 18px; border-radius: 8px; font-weight: 600; margin-bottom: 20px; border-left: 4px solid #b91c1c;">
                            ✔ Appointment has been deleted successfully from the database.
                        </p>
                    <% } %>
                <% } %>

                <%
                    String currentFilter = (String) request.getAttribute("currentFilter");
                    if (currentFilter == null) currentFilter = "all";

                    String currentSearch = (String) request.getAttribute("currentSearch");
                    if (currentSearch == null) currentSearch = "";
                %>

                <!-- Filters -->
                <div class="filter-card">

                    <div class="tabs">
                        <a class="<%= "all".equals(currentFilter) ? "active" : "" %>" href="${pageContext.request.contextPath}/admin/appointments?filter=all&search=<%= currentSearch %>">All Appointments</a>
                        <a class="<%= "today".equals(currentFilter) ? "active" : "" %>" href="${pageContext.request.contextPath}/admin/appointments?filter=today&search=<%= currentSearch %>">Today</a>
                        <a class="<%= "upcoming".equals(currentFilter) ? "active" : "" %>" href="${pageContext.request.contextPath}/admin/appointments?filter=upcoming&search=<%= currentSearch %>">Upcoming</a>
                        <a class="<%= "pending".equals(currentFilter) ? "active" : "" %>" href="${pageContext.request.contextPath}/admin/appointments?filter=pending&search=<%= currentSearch %>">Pending</a>
                    </div>

                    <form action="${pageContext.request.contextPath}/admin/appointments" method="get" style="display: flex; gap: 8px; width: 100%; grid-column: span 3;">
                        <input type="hidden" name="filter" value="<%= currentFilter %>">
                        <div class="filter-search" style="flex: 1; padding: 0; position: relative;">
                            <input
                                type="text"
                                name="search"
                                value="<%= currentSearch %>"
                                placeholder="Search patient, staff ID, reason, status..."
                                style="width: 100%; height: 42px; border: 1px solid #e5e7eb; border-radius: 8px; padding-left: 42px; font-size: 15px; outline: none; background: #ffffff;"
                            >
                        </div>
                        <button type="submit" class="primary-btn" style="padding: 0 18px; height: 42px; font-size: 14px;">Search</button>
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

                            <%
                                ArrayList<AppointmentModel> appts = (ArrayList<AppointmentModel>) request.getAttribute("appointmentsList");
                                if (appts != null && !appts.isEmpty()) {
                                    for (AppointmentModel appt : appts) {
                                        String pillClass = "gray";
                                        if ("Confirmed".equalsIgnoreCase(appt.getStatus())) {
                                            pillClass = "green";
                                        } else if ("In Progress".equalsIgnoreCase(appt.getStatus())) {
                                            pillClass = "orange";
                                        } else if ("Pending".equalsIgnoreCase(appt.getStatus())) {
                                            pillClass = "yellow";
                                        } else if ("Cancelled".equalsIgnoreCase(appt.getStatus())) {
                                            pillClass = "red";
                                        } else if ("Rescheduled".equalsIgnoreCase(appt.getStatus())) {
                                            pillClass = "orange";
                                        } else if ("Completed".equalsIgnoreCase(appt.getStatus())) {
                                            pillClass = "gray";
                                        }
                            %>

                            <tr>
                                <td>
                                    <div class="person">
                                        <span class="avatar a1"></span>
                                        <div>
                                            <strong><%= appt.getPatientName() %></strong>
                                            <small>#PT-<%= appt.getPatientId() %></small>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    <strong><%= appt.getAppointmentTime() %></strong>
                                    <small><%= appt.getAppointmentDate() %></small>
                                </td>

                                <td>
                                    <div class="doctor">
                                        <span class="avatar small a2"></span>
                                        <strong>Staff #<%= appt.getStaffId() %></strong>
                                    </div>
                                </td>

                                <td><%= appt.getReason() %></td>

                                <td>
                                    <span class="pill <%= pillClass %>"><%= appt.getStatus() %></span>
                                </td>

                                <td>
                                    <div class="actions">
                                        <a href="${pageContext.request.contextPath}/admin/edit-appointment?id=<%= appt.getAppointmentId() %>" style="text-decoration: none; display: flex; align-items: center; justify-content: center; width: 36px; height: 36px; border: 1px solid #e5e7eb; border-radius: 6px; background: #ffffff; color: #111827;" title="Reschedule / Edit">✎</a>
                                        <a href="${pageContext.request.contextPath}/admin/delete-appointment?id=<%= appt.getAppointmentId() %>" onclick="return confirm('Are you sure you want to delete this appointment record?');" style="text-decoration: none; display: flex; align-items: center; justify-content: center; width: 36px; height: 36px; border: 1px solid #fee2e2; border-radius: 6px; background: #fee2e2; color: #b91c1c;" title="Delete Appointment">🗑</a>
                                    </div>
                                </td>
                            </tr>

                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="6" style="text-align: center; color: #6b7280; padding: 40px 0;">
                                    No appointments found matching your filters.
                                </td>
                            </tr>
                            <% } %>

                        </tbody>

                    </table>

                    <div class="table-footer">
                        <p>Showing <%= appts != null ? appts.size() : 0 %> entries</p>
                    </div>

                </div>

            </section>

        </section>

    </main>

</body>

</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard - MotionRehab</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminDashboard.css">
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
                <a class="nav-item active" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/appointments">Appointments</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
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

                <h1>Admin Overview</h1>

                <div class="top-actions">

                    <div class="search">
                        Search patients, doctors...
                    </div>

                    <button class="icon">!</button>

                    <div class="profile">
                        <div>
                            <strong>Dr. Suvhom K.C</strong>
                            <span>Clinic Administrator</span>
                        </div>
                        <b class="avatar a2"></b>
                    </div>

                </div>

            </header>

            <!-- Page Content -->
            <div class="content">

                <%
                    Map<String, Integer> overviewCounts = (Map<String, Integer>) request.getAttribute("overviewCounts");
                    int totalPatients = overviewCounts != null ? overviewCounts.getOrDefault("totalPatients", 0) : 0;
                    int totalStaff = overviewCounts != null ? overviewCounts.getOrDefault("totalStaff", 0) : 0;
                    int appointmentsToday = overviewCounts != null ? overviewCounts.getOrDefault("appointmentsToday", 0) : 0;
                    int monthlyRevenue = overviewCounts != null ? overviewCounts.getOrDefault("monthlyRevenue", 0) : 0;
                    int activeDoctors = overviewCounts != null ? overviewCounts.getOrDefault("activeDoctors", 0) : 0;
                %>

                <!-- Statistics Cards -->
                <section class="stats-grid" style="grid-template-columns: repeat(5, 1fr) !important;">

                    <div class="card stat">
                        <span>Total Patients</span>
                        <b><%= String.format("%,d", totalPatients) %></b>
                        <small class="ok">Registered patients</small>
                    </div>

                    <div class="card stat">
                        <span>Total Staff</span>
                        <b><%= totalStaff %></b>
                        <small>All staff members</small>
                    </div>

                    <div class="card stat">
                        <span>Active Staff</span>
                        <b><%= activeDoctors %></b>
                        <small class="ok">Physiotherapists online</small>
                    </div>

                    <div class="card stat">
                        <span>Appointments Today</span>
                        <b><%= appointmentsToday %></b>
                        <small>Active bookings</small>
                    </div>

                    <div class="card stat">
                        <span>Monthly Revenue</span>
                        <b>NRP <%= String.format("%,d", monthlyRevenue) %></b>
                        <small class="ok">Current month</small>
                    </div>

                </section>

                <!-- Dashboard Main Grid -->
                <section class="dashboard-grid">

                    <!-- Today's Appointments -->
                    <article class="card appointments">

                        <div class="card-head">
                            <h2>Today's Appointments</h2>
                            <a class="schedule-btn" href="${pageContext.request.contextPath}/admin/appointments">
                                View All Schedule
                            </a>
                        </div>

                        <table>
                            <tbody>
                            <%
                                java.util.ArrayList<String[]> todayAppts = (java.util.ArrayList<String[]>) request.getAttribute("todayAppointments");
                                if (todayAppts == null || todayAppts.isEmpty()) {
                            %>
                                <tr>
                                    <td colspan="5" style="text-align: center; color: #6b7280; padding: 30px;">
                                        No appointments scheduled for today.
                                    </td>
                                </tr>
                            <%
                                } else {
                                    int avatarIdx = 1;
                                    for (String[] appt : todayAppts) {
                                        String id = appt[0];
                                        String patientName = appt[1];
                                        String staffName = appt[2];
                                        String time = appt[3];
                                        String reason = appt[4];
                                        String status = appt[5];
                                        
                                        // Pick an avatar color dynamically
                                        String avatarClass = "a" + avatarIdx;
                                        avatarIdx = (avatarIdx % 6) + 1;
                                        
                                        // Map status pill color
                                        String pillClass = "yellow";
                                        if ("Completed".equalsIgnoreCase(status) || "Confirmed".equalsIgnoreCase(status)) {
                                            pillClass = "green";
                                        } else if ("In Progress".equalsIgnoreCase(status) || "Rescheduled".equalsIgnoreCase(status)) {
                                            pillClass = "orange";
                                        } else if ("Cancelled".equalsIgnoreCase(status)) {
                                            pillClass = "red";
                                        }
                            %>
                                <tr>
                                    <td><%= time %></td>
                                    <td>
                                        <b class="avatar mini <%= avatarClass %>"></b>
                                        <%= patientName %>
                                        <br>
                                        <small>#PT-<%= id %></small>
                                    </td>
                                    <td><%= staffName %></td>
                                    <td><%= reason %></td>
                                    <td>
                                        <span class="pill <%= pillClass %>"><%= status %></span>
                                    </td>
                                </tr>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>

                    </article>

                    <!-- Right Side Column -->
                    <aside class="right-col">

                        <!-- Available Staff -->
                        <article class="card">
                            <h2>Available Staff</h2>
                            <div style="display: flex; flex-direction: column; gap: 20px; margin-top: 15px;">
                            <%
                                java.util.ArrayList<String[]> availStaff = (java.util.ArrayList<String[]>) request.getAttribute("availableStaff");
                                if (availStaff == null || availStaff.isEmpty()) {
                            %>
                                <p style="color: #6b7280; font-size: 15px;">No active staff found.</p>
                            <%
                                } else {
                                    int avatarIdx = 2;
                                    for (String[] staff : availStaff) {
                                        String name = staff[1];
                                        String spec = staff[2];
                                        String phone = staff[3];
                                        String email = staff[4];
                                        String availability = staff[5];
                                        
                                        String avatarClass = "a" + avatarIdx;
                                        avatarIdx = (avatarIdx % 6) + 1;
                                        
                                        boolean isBusy = "Busy".equalsIgnoreCase(availability);
                            %>
                                <div style="display: flex; align-items: start; gap: 15px; padding-bottom: 15px; border-bottom: 1px solid #f1f5f9;">
                                    <b class="avatar mini <%= avatarClass %>" style="margin-top: 4px;"></b>
                                    <div style="flex-grow: 1;">
                                        <div style="display: flex; align-items: center; justify-content: space-between;">
                                            <strong style="font-size: 16px; color: #1e293b;"><%= name %></strong>
                                            <span class="dot <%= isBusy ? "busy" : "" %>" title="<%= availability %>"></span>
                                        </div>
                                        <div style="font-size: 14px; color: #64748b; margin-top: 3px;"><%= spec %></div>
                                        <div style="font-size: 13px; color: #94a3b8; margin-top: 4px; display: flex; flex-direction: column; gap: 2px;">
                                            <span>📞 <%= phone %></span>
                                            <span>✉️ <%= email %></span>
                                        </div>
                                    </div>
                                </div>
                            <%
                                    }
                                }
                            %>
                            </div>
                        </article>

                        <!-- Recent Activity -->
                        <article class="card activity">
                            <h2>Recent Activity</h2>
                            <div style="display: flex; flex-direction: column; gap: 16px; margin-top: 15px;">
                            <%
                                java.util.ArrayList<String[]> recentActs = (java.util.ArrayList<String[]>) request.getAttribute("recentActivities");
                                if (recentActs == null || recentActs.isEmpty()) {
                            %>
                                <p style="color: #6b7280; font-size: 15px;">No recent activities logged.</p>
                            <%
                                } else {
                                    for (String[] act : recentActs) {
                                        String message = act[0];
                                        String timeDiff = act[1];
                            %>
                                <div style="display: flex; flex-direction: column; gap: 4px; padding-bottom: 12px; border-bottom: 1px dotted #f1f5f9;">
                                    <span style="font-size: 15px; color: #334155; line-height: 1.4;"><%= message %></span>
                                    <small style="color: #94a3b8; font-size: 13px;"><%= timeDiff %></small>
                                </div>
                            <%
                                    }
                                }
                            %>
                            </div>
                        </article>

                    </aside>

                </section>

            </div>

        </section>

    </main>



</body>

</html>
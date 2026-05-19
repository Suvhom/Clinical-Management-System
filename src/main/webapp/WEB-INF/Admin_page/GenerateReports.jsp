<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Generate Report</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/Admin_page/BillingRevenue.css">
</head>

<body>

<main class="screens standalone">
<section class="screen active">

    <!-- Sidebar -->
    <aside class="sidebar admin">

        <a class="brand" href="<%= request.getContextPath() %>/Admin_page/AdminDashboard.jsp">
            <span class="logo">M</span>
            MotionRehab
        </a>

        <nav>
            <a class="nav" href="<%= request.getContextPath() %>/Admin_page/AdminDashboard.jsp">Dashboard</a>
            <a class="nav" href="<%= request.getContextPath() %>/Admin_page/AdminAppointments.jsp">Appointments</a>
            <a class="nav" href="<%= request.getContextPath() %>/Admin_page/PatientProfile.jsp">Patients</a>
            <a class="nav active" href="<%= request.getContextPath() %>/Admin_page/BillingRevenue.jsp">Billing & Revenue</a>
            <a class="nav" href="<%= request.getContextPath() %>/Admin_page/PatientDetail.jsp">Staff Directory</a>
        </nav>

        <div class="side-bottom">
            <a href="#">Settings</a>
            <a href="#">Log out</a>
        </div>

    </aside>

    <!-- Main Page -->
    <div class="page">

        <header class="topbar">
            <h1>Generate Report</h1>

            <div class="top-actions">
                <a href="<%= request.getContextPath() %>/Admin_page/BillingRevenue.jsp" class="primary">
                    Back to Billing
                </a>

               

                <div class="profile">
                    Dr. Emily Chen
                    <span>Clinic Administrator</span>
                    <b class="avatar a2"></b>
                </div>
            </div>
        </header>

        <div class="content table-page">

            <!-- Revenue Card -->
            <div class="stats-row">

                <div class="stat card">
                    <span>Revenue Report</span>
                   <b>NRP <%= request.getAttribute("last30DaysRevenue") %></b>
                    <small>Paid transactions in last 30 days</small>
                </div>

            </div>

            <!-- Report Summary Table -->
            <article class="card table-card">

                <div class="card-head">
                    <h2>30 Days Transaction Summary</h2>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>Report Name</th>
                            <th>Result</th>
                            <th>Description</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>Last 30 Days Revenue</td>
                         <td>NRP <%= request.getAttribute("last30DaysRevenue") %></td>
                            <td>Total amount from paid billing transactions within the last 30 days.</td>
                        </tr>
                    </tbody>
                </table>

            </article>

        </div>

    </div>

</section>
</main>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Generate Report</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/GenerateReport.css">

</head>

<body>

<main class="layout">

<div class="sidebar">
    <div class="brand">
        <img src="${pageContext.request.contextPath}/Images/Logo.png">
        <span>MotionRehab</span>
    </div>

    <nav class="nav-menu">
        <a class="nav-item" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
        <a class="nav-item" href="${pageContext.request.contextPath}/admin/appointments">Appointments</a>
        <a class="nav-item" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
        <a class="nav-item active" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
        <a class="nav-item" href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
    </nav>
</div>

<section class="page">

    </aside>

    <!-- Main Page -->
    <div class="page">

        <header class="topbar">
            <h1>Generate Report</h1>

            <div class="top-actions">
                <a href="${pageContext.request.contextPath}/admin/billing" class="primary">
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
                   <b>NRP ${last30DaysRevenue}</b>	
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
						<td>NRP ${last30DaysRevenue}</td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing & Revenue - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/BillingRevenue.css">
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
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/appointments">Appointments</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
                <a class="nav-item active" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
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

            <!-- Content -->
            <div class="content">

                <!-- Page Title -->
                <div class="title-row">
                    <div>
                        <h2>Billing & Revenue</h2>
                        <p>Track invoices, payments and clinic revenue.</p>
                    </div>

                    <div class="billing-actions">
                        <a class="primary report-btn" href="${pageContext.request.contextPath}/admin/reports">
                            Generate Report
                        </a>
                        <a class="primary" href="${pageContext.request.contextPath}/admin/create-invoice" style="text-decoration: none; font-weight: 700; display: inline-block;">
                            + Create Invoice
                        </a>
                    </div>
                </div>

                <c:if test="${not empty param.success}">
                    <p class="success-message">Invoice generated and committed successfully.</p>
                </c:if>

                <!-- Stat Cards -->
                <div class="stats-row">

                    <div class="stat card">
                        <span>Total Revenue</span>
                        <b>NRP <fmt:formatNumber value="${empty stats.totalRevenue ? 0 : stats.totalRevenue}" type="number" /></b>
                        <small class="ok">Gross cash collections</small>
                    </div>

                    <div class="stat card">
                        <span>Monthly Revenue</span>
                        <b>NRP <fmt:formatNumber value="${empty stats.monthlyRevenue ? 0 : stats.monthlyRevenue}" type="number" /></b>
                        <small class="ok">This calendar month</small>
                    </div>

                    <div class="stat card">
                        <span>Outstanding Balance</span>
                        <b>NRP <fmt:formatNumber value="${empty stats.outstandingBalance ? 0 : stats.outstandingBalance}" type="number" /></b>
                        <small class="bad">Pending dues</small>
                    </div>

                    <div class="stat card">
                        <span>Paid Invoices</span>
                        <b>${empty stats.paidInvoicesCount ? 0 : stats.paidInvoicesCount}</b>
                        <small>Completed treatments</small>
                    </div>

                </div>

                <!-- Transactions -->
                <div class="card table-card">

                    <div class="card-head">
                        <div>
                            <h2>Recent Transactions</h2>
                            <p>Latest billing records and payment updates.</p>
                        </div>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>Invoice ID</th>
                                <th>Patient</th>
                                <th>Service</th>
                                <th>Date</th>
                                <th>Amount</th>
                                <th>Status</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:choose>
                                <c:when test="${empty transactions}">
                                <tr>
                                    <td colspan="6" style="text-align: center; color: #6b7280; padding: 40px; font-size: 15px;">
                                        No billing invoices found. Create appointments to generate clinical transactions dynamically!
                                    </td>
                                </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="t" items="${transactions}" varStatus="status">
                                <tr>
                                    <td><strong>${t[0]}</strong></td>
                                    <td>
                                        <div class="patient-cell" style="display: flex; align-items: center; gap: 10px;">
                                            <span class="avatar mini a${(status.index mod 6) + 1}"></span>
                                            <strong>${t[1]}</strong>
                                        </div>
                                    </td>
                                    <td>${t[2]}</td>
                                    <td>${t[3]}</td>
                                    <td><strong>${t[4]}</strong></td>
                                    <td>
                                        <span class="pill ${t[5] == 'Paid' ? 'green' : t[5] == 'Pending' ? 'yellow' : t[5] == 'Overdue' ? 'red' : 'gray'}">
                                            ${t[5]}
                                        </span>
                                    </td>
                                </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>

                </div>

            </div>

        </section>

    </main>

</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Report - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/GenerateReport.css">
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
                <a class="nav-item active" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/admins">Admin Directory</a>
            </nav>

            <div class="nav-bottom">
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/logout">Log out</a>
            </div>
        </div>

        <section class="page">
            <header class="topbar">
                <h1>Generate Report</h1>

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
                <div class="title-row">
                    <div>
                        <h2>Billing Report</h2>
                        <p>Simple report generated from billing transactions.</p>
                    </div>
                    <a class="secondary-btn" href="${pageContext.request.contextPath}/admin/billing">
                        Back to Billing
                    </a>
                </div>

                <div class="stats-row">
                    <div class="stat card">
                        <span>Total Revenue</span>
                        <b>NRP <fmt:formatNumber value="${totalRevenue}" type="number" minFractionDigits="2" maxFractionDigits="2" /></b>
                        <small>From all bills</small>
                    </div>

                    <div class="stat card">
                        <span>Total Bills</span>
                        <b>${totalBills}</b>
                        <small>All billing records</small>
                    </div>
                </div>

                <div class="card table-card">
                    <div class="card-head">
                        <div>
                            <h2>Monthly Revenue</h2>
                            <p>Total revenue grouped by billing month.</p>
                        </div>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>Month</th>
                                <th>Total Revenue</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty monthlyRevenueList}">
                                    <tr>
                                        <td colspan="2" class="empty-row">
                                            No monthly revenue records found.
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="month" items="${monthlyRevenueList}">
                                        <tr>
                                            <td><strong>${month.monthName}</strong></td>
                                            <td>NRP <fmt:formatNumber value="${month.totalRevenue}" type="number" minFractionDigits="2" maxFractionDigits="2" /></td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>

                <div class="card table-card">
                    <div class="card-head">
                        <div>
                            <h2>Recent 5 Bills</h2>
                            <p>Latest billing transactions with patient and payment details.</p>
                        </div>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>Bill ID</th>
                                <th>Patient</th>
                                <th>Amount</th>
                                <th>Payment Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty recentBills}">
                                    <tr>
                                        <td colspan="5" class="empty-row">
                                            No billing records found.
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="bill" items="${recentBills}">
                                        <tr>
                                            <td><strong>${bill.invoiceNumber}</strong></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty bill.patientName}">
                                                        ${bill.patientName}
                                                    </c:when>
                                                    <c:otherwise>
                                                        Patient ID: ${bill.patientId}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td><strong>NRP <fmt:formatNumber value="${bill.totalAmount}" type="number" minFractionDigits="2" maxFractionDigits="2" /></strong></td>
                                            <td><fmt:formatDate value="${bill.billingDate}" pattern="MMM dd, yyyy" /></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${bill.paymentStatus eq 'Paid'}">
                                                        <span class="pill green">${bill.paymentStatus}</span>
                                                    </c:when>
                                                    <c:when test="${bill.paymentStatus eq 'Pending'}">
                                                        <span class="pill yellow">${bill.paymentStatus}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="pill gray">${bill.paymentStatus}</span>
                                                    </c:otherwise>
                                                </c:choose>
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

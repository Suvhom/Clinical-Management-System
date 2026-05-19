<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing & Revenue - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/BillingRevenue.css">
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
            
            <!-- Content -->
            <div class="content">

                <!-- Page Title -->
                <div class="title-row">
                    <div>
                        <h2>Billing & Revenue</h2>
                        <p>Track invoices, payments and clinic revenue.</p>
                    </div>
				
				                   <div class="title-actions">
				    <a class="primary" href="${pageContext.request.contextPath}/admin/create-invoice">
				        + Create Invoice
				    </a>
				
				    <a class="primary" href="${pageContext.request.contextPath}/AdminReports">
				        Generate Report
				    </a>
				</div>
                </div>

                <% if (request.getParameter("success") != null) { %>
                    <p class="success-message" style="background: #dcfce7; color: #15803d; border-color: #bbf7d0; padding: 12px 18px; border-radius: 10px; font-weight: 600; margin-bottom: 20px;">Invoice generated and committed successfully.</p>
                <% } %>

                <%
                    Map<String, Integer> stats = (Map<String, Integer>) request.getAttribute("stats");
                    int totalRevenue = stats != null ? stats.getOrDefault("totalRevenue", 0) : 0;
                    int monthlyRevenue = stats != null ? stats.getOrDefault("monthlyRevenue", 0) : 0;
                    int outstandingBalance = stats != null ? stats.getOrDefault("outstandingBalance", 0) : 0;
                    int paidInvoicesCount = stats != null ? stats.getOrDefault("paidInvoicesCount", 0) : 0;
                %>
	
                <!-- Stat Cards -->
                <div class="stats-row">

                    <div class="stat card">
                        <span>Total Revenue</span>
                        <b>NRP <%= String.format("%,d", totalRevenue) %></b>
                        <small class="ok">Gross cash collections</small>
                    </div>

                    <div class="stat card">
                        <span>Monthly Revenue</span>
                        <b>NRP <%= String.format("%,d", monthlyRevenue) %></b>
                        <small class="ok">This calendar month</small>
                    </div>

                    <div class="stat card">
                        <span>Outstanding Balance</span>
                        <b>NRP <%= String.format("%,d", outstandingBalance) %></b>
                        <small class="bad">Pending dues</small>
                    </div>

                    <div class="stat card">
                        <span>Paid Invoices</span>
                        <b><%= paidInvoicesCount %></b>
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
                            <%
                                ArrayList<String[]> transactions = (ArrayList<String[]>) request.getAttribute("transactions");
                                if (transactions == null || transactions.isEmpty()) {
                            %>
                                <tr>
                                    <td colspan="6" style="text-align: center; color: #6b7280; padding: 40px; font-size: 15px;">
                                        No billing invoices found. Create appointments to generate clinical transactions dynamically!
                                    </td>
                                </tr>
                            <%
                                } else {
                                    int idx = 1;
                                    for (String[] t : transactions) {
                                        String pillColor = "gray";
                                        if ("Paid".equalsIgnoreCase(t[5])) pillColor = "green";
                                        else if ("Pending".equalsIgnoreCase(t[5])) pillColor = "yellow";
                                        else if ("Overdue".equalsIgnoreCase(t[5])) pillColor = "red";
                                        else if ("Void".equalsIgnoreCase(t[5])) pillColor = "gray";
                                        
                                        String avatarClass = "a" + ((idx % 6) + 1);
                                        idx++;
                            %>
                                <tr>
                                    <td><strong><%= t[0] %></strong></td>
                                    <td>
                                        <div class="patient-cell" style="display: flex; align-items: center; gap: 10px;">
                                            <span class="avatar mini <%= avatarClass %>"></span>
                                            <strong><%= t[1] %></strong>
                                        </div>
                                    </td>
                                    <td><%= t[2] %></td>
                                    <td><%= t[3] %></td>
                                    <td><strong><%= t[4] %></strong></td>
                                    <td><span class="pill <%= pillColor %>"><%= t[5] %></span></td>
                                </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>

                </div>

            </div>

        </section>

    </main>

</body>

</html>
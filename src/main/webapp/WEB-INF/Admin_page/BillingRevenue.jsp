<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
			    <a class="nav-item" href="${pageContext.request.contextPath}/admin/patient-detail">Staff Directory</a>
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

                    <button class="primary">+ Create Invoice</button>
                </div>

                <!-- Stat Cards -->
                <div class="stats-row">

                    <div class="stat card">
                        <span>Total Revenue</span>
                        <b>NRP 4,250,000</b>
                        <small class="ok">+12.5% from last year</small>
                    </div>

                    <div class="stat card">
                        <span>Monthly Revenue</span>
                        <b>NRP 380,500</b>
                        <small class="ok">+4.2% from last month</small>
                    </div>

                    <div class="stat card">
                        <span>Outstanding Balance</span>
                        <b>NRP 125,000</b>
                        <small class="bad">8 pending invoices</small>
                    </div>

                    <div class="stat card">
                        <span>Paid Invoices</span>
                        <b>248</b>
                        <small>This month</small>
                    </div>

                </div>

                <!-- Transactions -->
                <div class="card table-card">

                    <div class="card-head">
                        <div>
                            <h2>Recent Transactions</h2>
                            <p>Latest billing records and payment updates.</p>
                        </div>

                        <div class="table-actions">
                            <input type="text" placeholder="Search by patient or invoice ID...">
                            <button>Filter</button>
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

                            <tr>
                                <td>#INV-2023-1045</td>
                                <td>
                                    <div class="patient-cell">
                                        <span class="avatar mini a4"></span>
                                        <strong>David Miller</strong>
                                    </div>
                                </td>
                                <td>Physiotherapy Session</td>
                                <td>Oct 12, 2023</td>
                                <td>NRP 1,500</td>
                                <td><span class="pill green">Paid</span></td>
                            </tr>

                            <tr>
                                <td>#INV-2023-1046</td>
                                <td>
                                    <div class="patient-cell">
                                        <span class="avatar mini a1"></span>
                                        <strong>Sarah Jones</strong>
                                    </div>
                                </td>
                                <td>Acupuncture Therapy</td>
                                <td>Oct 11, 2023</td>
                                <td>NRP 2,000</td>
                                <td><span class="pill yellow">Pending</span></td>
                            </tr>

                            <tr>
                                <td>#INV-2023-1047</td>
                                <td>
                                    <div class="patient-cell">
                                        <span class="avatar mini a3"></span>
                                        <strong>Michael Smith</strong>
                                    </div>
                                </td>
                                <td>Sports Rehabilitation</td>
                                <td>Oct 10, 2023</td>
                                <td>NRP 2,500</td>
                                <td><span class="pill green">Paid</span></td>
                            </tr>

                            <tr>
                                <td>#INV-2023-1048</td>
                                <td>
                                    <div class="patient-cell">
                                        <span class="avatar mini a6"></span>
                                        <strong>Emma Wilson</strong>
                                    </div>
                                </td>
                                <td>Chiropractic Adjustment</td>
                                <td>Oct 05, 2023</td>
                                <td>NRP 3,000</td>
                                <td><span class="pill red">Overdue</span></td>
                            </tr>

                        </tbody>
                    </table>

                </div>

            </div>

        </section>

    </main>

</body>

</html>
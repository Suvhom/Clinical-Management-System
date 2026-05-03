<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Billing Revenue - MotionRehab</title>

    <link rel="stylesheet" href="BillingRevenue.css">
</head>

<body>

    <main class="screens standalone">

        <section class="screen active" id="billing-revenue">

            <!-- SIDEBAR -->
            <aside class="sidebar admin">

                <a class="brand" href="../index.html#admin-dashboard">
                    <span class="logo">M</span>
                    MotionRehab
                </a>

                <nav>
                    <a class="nav" href="../index.html#admin-dashboard">Dashboard</a>
                    <a class="nav" href="../index.html#admin-appointments">Appointments</a>
                    <a class="nav" href="../index.html#patient-profile">Patients</a>
                    <a class="nav active" href="../index.html#billing-revenue">Billing & Revenue</a>
                    <a class="nav" href="../index.html#patient-detail">Staff Directory</a>
                </nav>

                <div class="side-bottom">
                    <a href="#">Settings</a>
                    <a href="#">Log out</a>
                </div>

            </aside>

            <!-- MAIN PAGE -->
            <div class="page">

                <!-- TOP BAR -->
                <header class="topbar">
                    <h1>Billing & Revenue</h1>

                    <div class="top-actions">
                        <button class="primary">+ Create Invoice</button>
                        <button class="icon">!</button>

                        <div class="profile">
                            Dr. Emily Chen
                            <span>Clinic Administrator</span>
                            <b class="avatar a2"></b>
                        </div>
                    </div>
                </header>

                <!-- CONTENT -->
                <div class="content table-page">

                    <!-- STAT CARDS -->
                    <div class="stats-row">

                        <div class="stat card">
                            <span>Total Revenue (YTD)</span>
                            <b>NRP 4,250,000</b>
                            <small class="ok">12.5% from last year</small>
                        </div>

                        <div class="stat card">
                            <span>Monthly Revenue</span>
                            <b>NRP 380,500</b>
                            <small class="ok">4.2% from last month</small>
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

                    <!-- TRANSACTION TABLE -->
                    <article class="card table-card">

                        <div class="card-head">
                            <h2>Recent Transactions</h2>

                            <input type="text" placeholder="Search by patient or invoice ID...">
                            <button>Filter</button>
                        </div>

                        <table>
                            <tbody>

                                <tr>
                                    <td>#INV-2023-1045</td>
                                    <td>
                                        <b class="avatar mini a4"></b>
                                        David Miller
                                    </td>
                                    <td>Physiotherapy Session</td>
                                    <td>Oct 12, 2023</td>
                                    <td>NRP 1,500</td>
                                    <td><span class="pill green">Paid</span></td>
                                </tr>

                                <tr>
                                    <td>#INV-2023-1046</td>
                                    <td>
                                        <b class="avatar mini a1"></b>
                                        Sarah Jones
                                    </td>
                                    <td>Acupuncture Therapy</td>
                                    <td>Oct 11, 2023</td>
                                    <td>NRP 2,000</td>
                                    <td><span class="pill yellow">Pending</span></td>
                                </tr>

                                <tr>
                                    <td>#INV-2023-1047</td>
                                    <td>
                                        <b class="avatar mini a3"></b>
                                        Michael Smith
                                    </td>
                                    <td>Sports Rehabilitation</td>
                                    <td>Oct 10, 2023</td>
                                    <td>NRP 2,500</td>
                                    <td><span class="pill green">Paid</span></td>
                                </tr>

                                <tr>
                                    <td>#INV-2023-1048</td>
                                    <td>
                                        <b class="avatar mini a6"></b>
                                        Emma Wilson
                                    </td>
                                    <td>Chiropractic Adjustment</td>
                                    <td>Oct 05, 2023</td>
                                    <td>NRP 3,000</td>
                                    <td><span class="pill red">Overdue</span></td>
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
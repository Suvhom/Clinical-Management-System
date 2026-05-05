<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard - MotionRehab</title>

    <link rel="stylesheet" href="AdminDashboard_CSS.css">
</head>

<body>

    <main class="screens standalone">

        <section class="screen active" id="admin-dashboard">

            <!-- ================= SIDEBAR ================= -->
            <aside class="sidebar admin">

                <a class="brand" href="../index.html#admin-dashboard">
                    <span class="logo">M</span> MotionRehab
                </a>

                <nav>
                    <a class="nav active" href="../index.html#admin-dashboard">Dashboard</a>
                    <a class="nav" href="../index.html#admin-appointments">Appointments</a>
                    <a class="nav" href="../index.html#patient-profile">Patients</a>
                    <a class="nav" href="../index.html#billing-revenue">Billing & Revenue</a>
                    <a class="nav" href="../index.html#patient-detail">Staff Directory</a>
                </nav>

                <div class="side-bottom">
                    <a href="#">Settings</a>
                    <a href="#">Log out</a>
                </div>

            </aside>

            <!-- ================= MAIN PAGE ================= -->
            <div class="page">

                <!-- TOPBAR -->
                <header class="topbar">
                    <h1>Admin Overview</h1>

                    <div class="top-actions">

                        <div class="search">
                            Search patients, doctors...
                        </div>

                        <button class="icon">!</button>

                        <div class="profile">
                            Dr. Emily Chen
                            <span>Clinic Administrator</span>
                            <b class="avatar a2"></b>
                        </div>

                    </div>
                </header>

                <!-- ================= CONTENT ================= -->
                <div class="content admin-grid">

                    <!-- STAT CARDS -->
                    <div class="stat card">
                        <span>Total Patients</span>
                        <b>1,842</b>
                        <small class="ok">+12% from last month</small>
                    </div>

                    <div class="stat card">
                        <span>Appointments Today</span>
                        <b>28</b>
                        <small>4 pending requests</small>
                    </div>

                    <div class="stat card">
                        <span>Monthly Revenue</span>
                        <b>NRP 345K</b>
                        <small class="ok">+8% from last month</small>
                    </div>

                    <div class="stat card">
                        <span>Active Doctors</span>
                        <b>12</b>
                        <small>All staff present today</small>
                    </div>

                    <!-- ================= APPOINTMENT TABLE ================= -->
                    <article class="card span-3">

                        <div class="card-head">
                            <h2>Today's Appointments</h2>
                            <button>View All Schedule</button>
                        </div>

                        <table>
                            <tbody>

                                <tr>
                                    <td>09:00 AM</td>
                                    <td>
                                        <b class="avatar mini a3"></b>
                                        John Doe <br>
                                        <small>#PT-8842</small>
                                    </td>
                                    <td>Dr. Smith</td>
                                    <td>Manual Therapy</td>
                                    <td><span class="pill green">Confirmed</span></td>
                                </tr>

                                <tr>
                                    <td>10:30 AM</td>
                                    <td>
                                        <b class="avatar mini a1"></b>
                                        Alice Wong <br>
                                        <small>#PT-9931</small>
                                    </td>
                                    <td>Dr. Evans</td>
                                    <td>Post-op Rehab</td>
                                    <td><span class="pill orange">In Progress</span></td>
                                </tr>

                                <tr>
                                    <td>11:15 AM</td>
                                    <td>
                                        <b class="avatar mini a4"></b>
                                        Robert Fox <br>
                                        <small>#PT-7720</small>
                                    </td>
                                    <td>Dr. Smith</td>
                                    <td>Sports Injury</td>
                                    <td><span class="pill yellow">Pending</span></td>
                                </tr>

                                <tr>
                                    <td>01:00 PM</td>
                                    <td>
                                        <b class="avatar mini a5"></b>
                                        Sarah Jenkins <br>
                                        <small>#PT-8099</small>
                                    </td>
                                    <td>Dr. Clark</td>
                                    <td>Consultation</td>
                                    <td><span class="pill green">Confirmed</span></td>
                                </tr>

                            </tbody>
                        </table>

                    </article>

                    <!-- ================= RIGHT SIDE ================= -->
                    <aside class="right-col">

                        <!-- STAFF -->
                        <article class="card">
                            <h2>Available Staff</h2>

                            <p>
                                <b class="avatar mini a2"></b>
                                Dr. Michael Smith <span class="dot"></span>
                            </p>

                            <p>
                                <b class="avatar mini a6"></b>
                                Dr. Sarah Evans <span class="dot busy"></span>
                            </p>

                            <p>
                                <b class="avatar mini a3"></b>
                                Dr. David Clark <span class="dot"></span>
                            </p>
                        </article>

                        <!-- ACTIVITY -->
                        <article class="card activity">
                            <h2>Recent Activity</h2>

                            <p>
                                David Miller booked a new appointment.
                                <small>10 mins ago</small>
                            </p>

                            <p>
                                Linda Susan cancelled appointment.
                                <small>1 hour ago</small>
                            </p>

                            <p>
                                Payment of NRP 4,500 received.
                                <small>2 hours ago</small>
                            </p>

                            <p>
                                Dr. Smith updated medical records.
                                <small>3 hours ago</small>
                            </p>
                        </article>

                    </aside>

                </div>
            </div>

        </section>

    </main>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

            <!-- Page Content -->
            <div class="content">

                <!-- Statistics Cards -->
                <section class="stats-grid">

                    <div class="card stat">
                        <span>Total Patients</span>
                        <b>1,842</b>
                        <small class="ok">+12% from last month</small>
                    </div>

                    <div class="card stat">
                        <span>Appointments Today</span>
                        <b>28</b>
                        <small>4 pending requests</small>
                    </div>

                    <div class="card stat">
                        <span>Monthly Revenue</span>
                        <b>NRP 345K</b>
                        <small class="ok">+8% from last month</small>
                    </div>

                    <div class="card stat">
                        <span>Active Doctors</span>
                        <b>12</b>
                        <small>All staff present today</small>
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

                                <tr>
                                    <td>09:00 AM</td>
                                    <td>
                                        <b class="avatar mini a3"></b>
                                        John Doe
                                        <br>
                                        <small>#PT-8842</small>
                                    </td>
                                    <td>Dr. Smith</td>
                                    <td>Manual Therapy</td>
                                    <td>
                                        <span class="pill green">Confirmed</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>10:30 AM</td>
                                    <td>
                                        <b class="avatar mini a1"></b>
                                        Alice Wong
                                        <br>
                                        <small>#PT-9931</small>
                                    </td>
                                    <td>Dr. Evans</td>
                                    <td>Post-op Rehab</td>
                                    <td>
                                        <span class="pill orange">In Progress</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>11:15 AM</td>
                                    <td>
                                        <b class="avatar mini a4"></b>
                                        Robert Fox
                                        <br>
                                        <small>#PT-7720</small>
                                    </td>
                                    <td>Dr. Smith</td>
                                    <td>Sports Injury</td>
                                    <td>
                                        <span class="pill yellow">Pending</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>01:00 PM</td>
                                    <td>
                                        <b class="avatar mini a5"></b>
                                        Sarah Jenkins
                                        <br>
                                        <small>#PT-8099</small>
                                    </td>
                                    <td>Dr. Clark</td>
                                    <td>Consultation</td>
                                    <td>
                                        <span class="pill green">Confirmed</span>
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                    </article>

                    <!-- Right Side Column -->
                    <aside class="right-col">

                        <!-- Available Staff -->
                        <article class="card">
                            <h2>Available Staff</h2>

                            <p>
                                <b class="avatar mini a2"></b>
                                Dr. Michael Smith
                                <span class="dot"></span>
                            </p>

                            <p>
                                <b class="avatar mini a6"></b>
                                Dr. Sarah Evans
                                <span class="dot busy"></span>
                            </p>

                            <p>
                                <b class="avatar mini a3"></b>
                                Dr. David Clark
                                <span class="dot"></span>
                            </p>
                        </article>

                        <!-- Recent Activity -->
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

                </section>

            </div>

        </section>

    </main>

</body>

</html>
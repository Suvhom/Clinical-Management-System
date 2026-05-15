<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Appointments - MotionRehab</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminAppointments.css">
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
			    <a class="nav-item active" href="${pageContext.request.contextPath}/admin/appointments">Appointments</a>
			    <a class="nav-item" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
			    <a class="nav-item" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
			    <a class="nav-item" href="${pageContext.request.contextPath}/admin/patient-detail">Staff Directory</a>
			</nav>

            <div class="nav-bottom">
                <a class="nav-item" href="#">Settings</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/logout">Log out</a>
            </div>

        </div>

        <!-- Page -->
        <section class="page">

            <!-- Topbar -->
            <header class="topbar">

                <h1>Appointments</h1>

                <div class="top-actions">

                    <div class="top-search">
                        Search...
                    </div>

                    <button class="bell-btn">⌕</button>

                    <div class="profile">
                        <div>
                            <strong>Dr. Emily Chen</strong>
                            <span>Clinic Administrator</span>
                        </div>
                        <div class="profile-img"></div>
                    </div>

                </div>

            </header>

            <!-- Content -->
            <section class="content">

                <!-- Title -->
                <div class="title-row">
                    <div>
                        <h2>Manage Appointments</h2>
                        <p>View, schedule and manage all patient appointments.</p>
                    </div>

                    <button class="primary-btn">+ New Appointment</button>
                </div>

                <!-- Filters -->
                <div class="filter-card">

                    <div class="tabs">
                        <a class="active" href="#">All Appointments</a>
                        <a href="#">Today</a>
                        <a href="#">Upcoming</a>
                        <a href="#">Pending</a>
                    </div>

                    <div class="filter-search">
                        Search patient or doctor...
                    </div>

                    <button class="date-btn">Oct 24 - Oct 30, 2023</button>

                    <button class="filter-btn">☷</button>

                </div>

                <!-- Table -->
                <div class="table-card">

                    <table>

                        <thead>
                            <tr>
                                <th>Patient</th>
                                <th>Date & Time</th>
                                <th>Doctor</th>
                                <th>Treatment</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>

                        <tbody>

                            <tr>
                                <td>
                                    <div class="person">
                                        <span class="avatar a1"></span>
                                        <div>
                                            <strong>John Doe</strong>
                                            <small>#PT-8842</small>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    <strong>09:00 AM - 10:00 AM</strong>
                                    <small>Today, Oct 26</small>
                                </td>

                                <td>
                                    <div class="doctor">
                                        <span class="avatar small a2"></span>
                                        <strong>Dr. M. Smith</strong>
                                    </div>
                                </td>

                                <td>Manual Therapy</td>

                                <td>
                                    <span class="pill green">Confirmed</span>
                                </td>

                                <td>
                                    <div class="actions">
                                        <button>✎</button>
                                        <button>×</button>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="person">
                                        <span class="avatar a3"></span>
                                        <div>
                                            <strong>Alice Wong</strong>
                                            <small>#PT-9931</small>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    <strong>10:30 AM - 11:30 AM</strong>
                                    <small>Today, Oct 26</small>
                                </td>

                                <td>
                                    <div class="doctor">
                                        <span class="avatar small a4"></span>
                                        <strong>Dr. S. Evans</strong>
                                    </div>
                                </td>

                                <td>Post-op Rehab</td>

                                <td>
                                    <span class="pill orange">In Progress</span>
                                </td>

                                <td>
                                    <div class="actions">
                                        <button>✎</button>
                                        <button>×</button>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="person">
                                        <span class="avatar a5"></span>
                                        <div>
                                            <strong>Robert Fox</strong>
                                            <small>#PT-7720</small>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    <strong>11:15 AM - 12:00 PM</strong>
                                    <small>Today, Oct 26</small>
                                </td>

                                <td>
                                    <div class="doctor">
                                        <span class="avatar small a2"></span>
                                        <strong>Dr. M. Smith</strong>
                                    </div>
                                </td>

                                <td>Sports Injury</td>

                                <td>
                                    <span class="pill yellow">Pending</span>
                                </td>

                                <td>
                                    <div class="actions">
                                        <button>✎</button>
                                        <button>×</button>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="person">
                                        <span class="avatar a6"></span>
                                        <div>
                                            <strong>Sarah Jenkins</strong>
                                            <small>#PT-8099</small>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    <strong>01:00 PM - 02:00 PM</strong>
                                    <small>Today, Oct 26</small>
                                </td>

                                <td>
                                    <div class="doctor">
                                        <span class="avatar small a7"></span>
                                        <strong>Dr. D. Clark</strong>
                                    </div>
                                </td>

                                <td>Consultation</td>

                                <td>
                                    <span class="pill green">Confirmed</span>
                                </td>

                                <td>
                                    <div class="actions">
                                        <button>✎</button>
                                        <button>×</button>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="person">
                                        <span class="avatar a8"></span>
                                        <div>
                                            <strong>Maria Garcia</strong>
                                            <small>#PT-8102</small>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    <strong>02:30 PM - 03:30 PM</strong>
                                    <small>Today, Oct 26</small>
                                </td>

                                <td>
                                    <div class="doctor">
                                        <span class="avatar small a7"></span>
                                        <strong>Dr. D. Clark</strong>
                                    </div>
                                </td>

                                <td>Neurological Rehab</td>

                                <td>
                                    <span class="pill red">Cancelled</span>
                                </td>

                                <td>
                                    <div class="actions">
                                        <button>✎</button>
                                        <button>×</button>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="person">
                                        <span class="avatar a9"></span>
                                        <div>
                                            <strong>David Miller</strong>
                                            <small>#PT-8230</small>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    <strong>04:00 PM - 05:00 PM</strong>
                                    <small>Today, Oct 26</small>
                                </td>

                                <td>
                                    <div class="doctor">
                                        <span class="avatar small a4"></span>
                                        <strong>Dr. S. Evans</strong>
                                    </div>
                                </td>

                                <td>Sports Massage</td>

                                <td>
                                    <span class="pill gray">Completed</span>
                                </td>

                                <td>
                                    <div class="actions">
                                        <button>✎</button>
                                        <button>×</button>
                                    </div>
                                </td>
                            </tr>

                        </tbody>

                    </table>

                    <div class="table-footer">
                        <p>Showing 1 to 6 of 42 entries</p>

                        <div class="pagination">
                            <button>‹</button>
                            <button class="active">1</button>
                            <button>2</button>
                            <button>3</button>
                            <button>...</button>
                            <button>7</button>
                            <button>›</button>
                        </div>
                    </div>

                </div>

            </section>

        </section>

    </main>

</body>

</html>
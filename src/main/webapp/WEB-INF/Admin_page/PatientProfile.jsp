<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Profile - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/PatientProfile.css">
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
			    <a class="nav-item active" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
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
            
            
            <!-- Content -->
            <div class="content">

                <!-- Title -->
                <div class="title-row">
                    <div>
                        <h2>Patient Directory</h2>
                        <p>View and manage all clinic patients.</p>
                    </div>

                    <button class="primary">+ Add New Patient</button>
                </div>

                <!-- Filters -->
                <div class="card filters">

                    <input type="text" placeholder="Search by name or ID">

                    <select>
                        <option>All Statuses</option>
                        <option>Active</option>
                        <option>Discharged</option>
                    </select>

                    <select>
                        <option>Assigned Doctor</option>
                        <option>Dr. S. Evans</option>
                        <option>Dr. Emily Chen</option>
                        <option>Dr. M. Patel</option>
                    </select>

                    <button>Export</button>

                </div>

                <!-- Patient Table -->
                <div class="card table-card">

                    <table>
                        <thead>
                            <tr>
                                <th>Patient Details</th>
                                <th>Condition</th>
                                <th>Doctor</th>
                                <th>Last Visit</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>

                            <tr>
                                <td>
                                    <div class="patient-cell">
                                        <span class="patient-avatar a1"></span>
                                        <div>
                                            <strong>David Miller</strong>
                                            <small>PT-8230 | 24y | Male</small>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    Post-op ACL Reconstruction
                                    <small>Diagnosed Oct 10, 2023</small>
                                </td>

                                <td>Dr. S. Evans</td>

                                <td>Oct 26, 2023</td>

                                <td>
                                    <span class="pill green">Active</span>
                                </td>

                                <td>
                                    <a class="view-btn" href="${pageContext.request.contextPath}/admin/patient-detail">
                                        View Profile
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="patient-cell">
                                        <span class="patient-avatar a2"></span>
                                        <div>
                                            <strong>Sarah Jenkins</strong>
                                            <small>PT-8231 | 31y | Female</small>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    Chronic Lower Back Pain
                                    <small>Diagnosed Sep 15, 2023</small>
                                </td>

                                <td>Dr. Emily Chen</td>

                                <td>Oct 24, 2023</td>

                                <td>
                                    <span class="pill green">Active</span>
                                </td>

                                <td>
                                    <a class="view-btn" href="${pageContext.request.contextPath}/admin/patient-detail">
                                        View Profile
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="patient-cell">
                                        <span class="patient-avatar a3"></span>
                                        <div>
                                            <strong>Michael Chang</strong>
                                            <small>PT-8190 | 45y | Male</small>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    Rotator Cuff Tear
                                    <small>Diagnosed Jul 02, 2023</small>
                                </td>

                                <td>Dr. M. Patel</td>

                                <td>Oct 15, 2023</td>

                                <td>
                                    <span class="pill gray">Discharged</span>
                                </td>

                                <td>
                                    <a class="view-btn" href="${pageContext.request.contextPath}/admin/patient-detail">
                                        View Profile
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="patient-cell">
                                        <span class="patient-avatar a4"></span>
                                        <div>
                                            <strong>Elena Rodriguez</strong>
                                            <small>PT-8245 | 22y | Female</small>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    Ankle Sprain
                                    <small>Diagnosed Oct 20, 2023</small>
                                </td>

                                <td>Dr. S. Evans</td>

                                <td>Oct 25, 2023</td>

                                <td>
                                    <span class="pill green">Active</span>
                                </td>

                                <td>
                                    <a class="view-btn" href="${pageContext.request.contextPath}/admin/patient-detail">
                                        View Profile
                                    </a>
                                </td>
                            </tr>

                        </tbody>
                    </table>

                </div>

            </div>

        </section>

    </main>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Detail - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/PatientDetail.css">
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

                <!-- Back Button -->
                <a class="back" href="${pageContext.request.contextPath}/admin/patients">
                    ← Back to Patients
                </a>

                <!-- Patient Header -->
                <div class="card patient-hero">

                    <div class="patient-info">
                        <div class="patient-avatar large"></div>

                        <div>
                            <h2>David Miller</h2>

                            <p>
                                PT-8230 | 24 Years | Male <br>
                                +1 (555) 123-4567 <br>
                                david.miller@example.com <br>
                                Condition: Post-op ACL Reconstruction
                            </p>

                            <div class="patient-actions">
                                <button>Message</button>
                                <button>Edit Profile</button>
                            </div>
                        </div>
                    </div>

                    <span class="pill green">Active</span>

                </div>

                <!-- Detail Grid -->
                <div class="detail-grid">

                    <!-- Left Side -->
                    <section class="left-column">

                        <!-- Medical History -->
                        <div class="card">
                            <div class="card-head">
                                <h2>Medical History</h2>
                            </div>

                            <div class="history-item">
                                <strong>Oct 10, 2023</strong>
                                <p>Initial physiotherapy assessment.</p>
                            </div>

                            <div class="history-item">
                                <strong>Sep 28, 2023</strong>
                                <p>ACL reconstruction surgery completed.</p>
                            </div>

                            <div class="history-item">
                                <strong>Sep 12, 2023</strong>
                                <p>Injury during sports activity.</p>
                            </div>
                        </div>

                        <!-- Exercise Plan -->
                        <div class="card">
                            <div class="card-head">
                                <h2>Exercise Plan</h2>
                            </div>

                            <div class="exercise-list">
                                <p>Heel Slides <span>3 x 10</span></p>
                                <p>Quad Sets <span>15 reps</span></p>
                                <p>Straight Leg Raises <span>3 x 12</span></p>
                            </div>
                        </div>

                    </section>

                    <!-- Right Side -->
                    <aside class="right-column">

                        <!-- Prescribe Exercise -->
                        <div class="card prescribe-card">
                            <h2>Prescribe Exercise</h2>
                            <p>Add new exercises to patient plan.</p>

                            <a class="primary-btn" href="${pageContext.request.contextPath}/admin/add-exercise">
                                Add Exercise
                            </a>
                        </div>

                        <!-- Vitals -->
                        <div class="card">
                            <h2>Vitals</h2>

                            <div class="vitals">
                                <p><span>Height</span><strong>182 cm</strong></p>
                                <p><span>Weight</span><strong>78 kg</strong></p>
                                <p><span>Blood Type</span><strong>O+</strong></p>
                                <p><span>Allergies</span><strong>Penicillin</strong></p>
                            </div>
                        </div>

                        <!-- Appointment -->
                        <div class="card">
                            <h2>Upcoming Appointment</h2>

                            <div class="appointment-box">
                                <strong>Follow-up Session</strong>
                                <p>Nov 02, 2023 – 10:00 AM</p>
                            </div>

                            <button class="secondary-btn">Reschedule</button>
                        </div>

                    </aside>

                </div>

            </div>

        </section>

    </main>

</body>

</html>
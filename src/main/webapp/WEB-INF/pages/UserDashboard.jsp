<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard - MotionRehab</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/UserDashboard.css">
</head>
<body>
    <main class="screens standalone">
        <section class="screen active" id="user-dashboard">

            <aside class="sidebar">
                <a class="brand" href="${pageContext.request.contextPath}/UserDashboard">
                    <span class="logo">M</span>MotionRehab
                </a>
                <nav>
                    <a class="nav active" href="${pageContext.request.contextPath}/UserDashboard"><span>DB</span>Dashboard</a>
                    <a class="nav" href="${pageContext.request.contextPath}/BookAppointment"><span>BK</span>Book Appointment</a>
                    <a class="nav" href="${pageContext.request.contextPath}/AppointmentHistory"><span>AH</span>Appointment History</a>
                    <a class="nav" href="${pageContext.request.contextPath}/ExercisePlans"><span>EX</span>Exercise Plans</a>
                    <a class="nav" href="${pageContext.request.contextPath}/MedicalRecords"><span>MR</span>Medical Records</a>
                    <a class="nav" href="${pageContext.request.contextPath}/Billing"><span>BL</span>Billing</a>
                </nav>
                <div class="side-bottom">
                    <a href="${pageContext.request.contextPath}/UpdateProfile">Settings</a>
                    <a href="${pageContext.request.contextPath}/logout">Log out</a>
                </div>
            </aside>

            <div class="page">
                <header class="topbar">
                    <h1>${greeting}, ${patient.patientName}!</h1>
                    <div class="top-actions">
                    
                    
                    
                        <form action="${pageContext.request.contextPath}/UserDashboardSearchServlet" method="get" class="search-form">
						    <input type="text" name="keyword" placeholder="Search appointments, exercises..." class="dashboard-search">
						    <button type="submit">Search</button>
						</form>
						
						
						
                        <div class="profile">
                            <div class="profile-text">
                                <span class="profile-name">${patient.patientName}</span>
                                <span class="profile-role">Patient</span>
                            </div>
                            <a href="${pageContext.request.contextPath}/UpdateProfile" class="avatar-link">
                                ${imgTag}
                            </a>
                        </div>
                    </div>
                </header>

                <div class="content grid-2">

                    <article class="card wide appointment-hero">
                        <div class="card-head">
                            <h2>Upcoming Appointment</h2>
                            <a href="${pageContext.request.contextPath}/AppointmentHistory">View all</a>
                        </div>
                        <div class="orange-ticket">
                            <div class="datebox">24</div>
                            <div>
                                <h3>Knee Rehabilitation Session (Phase 2)</h3>
                                <p>10:00 AM - 10:45 AM</p>
                            </div>
                            <p>Dr. Emily Chen</p>
                            <p>Main Clinic, Room 3B</p>

                            <form action="${pageContext.request.contextPath}/BookAppointment" method="post">
                                <input type="hidden" name="action" value="reschedule">
                                <button type="submit">Reschedule</button>
                            </form>

                            <form action="${pageContext.request.contextPath}/AppointmentHistory" method="post">
                                <input type="hidden" name="action" value="checkin">
                                <button type="submit" class="primary">Check In</button>
                            </form>
                        </div>
                    </article>

                    <article class="card quick">
                        <h2>Quick Actions</h2>
                        <form action="${pageContext.request.contextPath}/BookAppointment" method="get">
                            <button type="submit">Book New Appointment</button>
                        </form>
                        <form action="${pageContext.request.contextPath}/MessageTherapist" method="get">
                            <button type="submit">Message Therapist</button>
                        </form>
                        <form action="${pageContext.request.contextPath}/MedicalRecords" method="get">
                            <button type="submit">View Latest Report</button>
                        </form>
                    </article>

                    <article class="card">
                        <div class="card-head">
                            <h2>Today's Exercise Plan</h2>
                            <a href="${pageContext.request.contextPath}/ExercisePlans">View full plan</a>
                        </div>
                        <div class="progress"><span style="width:66%"></span></div>
                        <div class="todo done">Straight Leg Raises <small>3 sets of 10 reps</small></div>
                        <div class="todo done">Heel Slides         <small>3 sets of 15 reps</small></div>
                        <div class="todo play">Wall Squats         <small>2 sets of 10 reps + Hold 5s</small></div>
                    </article>

                    <article class="card">
                        <h2>Recovery Overview</h2>
                        <div class="mini-grid">
                            <div class="metric"><b>12</b><span>/ 20 Sessions Completed</span></div>
                            <div class="metric"><b>3</b> <span>/ 10 Pain Level</span></div>
                        </div>
                        <h3>Current Milestones</h3>
                        <div class="milestone">Achieve 90 Knee Flexion <small>Target: Next week</small></div>
                        <div class="milestone">Walk 1 mile unassisted  <small>Target: Dec 1st</small></div>
                    </article>

                </div>
            </div>
        </section>
    </main>
</body>
</html>
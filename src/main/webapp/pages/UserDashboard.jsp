<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard - MotionRehab</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/User_Navbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/UserDashboard.css">
</head>
<body>
<main class="user-layout">
  <aside class="user-sidebar">
    <a class="user-brand" href="${pageContext.request.contextPath}/UserDashboard">
      <span class="brand-icon">M</span>
      <span>MotionRehab</span>
    </a>

    <nav class="user-menu">
      <a class="user-nav-item active" href="${pageContext.request.contextPath}/UserDashboard"><span>DB</span>Dashboard</a>
      <a class="user-nav-item" href="${pageContext.request.contextPath}/BookingAppointment"><span>BK</span>Book Appointment</a>
      <a class="user-nav-item" href="${pageContext.request.contextPath}/appointment-history"><span>AH</span>Appointment History</a>
      <a class="user-nav-item" href="${pageContext.request.contextPath}/user/exercise-plans"><span>EX</span>Exercise Plans</a>
      <a class="user-nav-item" href="#"><span>BL</span>Billing</a>
    </nav>

    <div class="user-logout">
      <a class="user-nav-item" href="${pageContext.request.contextPath}/logout">Log out</a>
    </div>
  </aside>

  <section class="user-page">
    <header class="user-topbar">
      <div>
        <h1>${greeting}, ${patient.patientName}</h1>
        <p>Welcome back to your MotionRehab patient dashboard.</p>
      </div>

      <div class="user-top-actions">
        <div class="user-search">Search appointments, exercises...</div>
        <div class="user-profile">
          <div>
            <strong>${sessionScope.patientName}</strong>
            <span>Patient</span>
          </div>
          <span class="user-avatar">PT</span>
        </div>
      </div>
    </header>

    <section class="user-content">
      <div class="dashboard-grid">
        <article class="user-card dashboard-wide">
          <div class="user-card-title">
            <div>
              <h2>Upcoming Appointment</h2>
              <p>Your next scheduled physiotherapy session.</p>
            </div>
            <a href="${pageContext.request.contextPath}/appointment-history">View all</a>
          </div>

          <div class="appointment-ticket">
            <div class="datebox">24</div>
            <div>
              <h3>Knee Rehabilitation Session</h3>
              <p>10:00 AM - 10:45 AM</p>
            </div>
            <p>Dr. Asim Bhusal</p>
            <p>Main Clinic, Room 3B</p>
          </div>
        </article>

        <article class="user-card quick-action">
          <div class="user-card-title">
            <div>
              <h2>Quick Actions</h2>
              <p>Schedule your next visit.</p>
            </div>
          </div>
          <form action="${pageContext.request.contextPath}/BookingAppointment" method="get">
            <button type="submit" class="user-primary-button">Book New Appointment</button>
          </form>
        </article>

        <article class="user-card">
          <div class="user-card-title">
            <div>
              <h2>Today's Exercise Plan</h2>
              <p>Your current therapy progress.</p>
            </div>
            <a href="${pageContext.request.contextPath}/user/exercise-plans">View full plan</a>
          </div>
          <div class="progress"><span class="progress-fill-66"></span></div>
          <div class="todo">Straight Leg Raises <small>3 sets of 10 reps</small></div>
          <div class="todo">Heel Slides <small>3 sets of 15 reps</small></div>
          <div class="todo">Wall Squats <small>2 sets of 10 reps with hold</small></div>
        </article>

        <article class="user-card">
          <div class="user-card-title">
            <div>
              <h2>Recovery Overview</h2>
              <p>Your current rehabilitation summary.</p>
            </div>
          </div>
          <div class="mini-grid">
            <div class="metric"><b>12</b><span>Sessions Completed</span></div>
            <div class="metric"><b>3</b><span>Pain Level</span></div>
          </div>
          <div class="milestone">Achieve 90 degree knee flexion <small>Target: Next week</small></div>
          <div class="milestone">Walk 1 mile unassisted <small>Target: Dec 1st</small></div>
        </article>
      </div>
    </section>
  </section>
</main>
</body>
</html>

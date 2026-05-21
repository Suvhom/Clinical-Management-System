<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
      <img class="brand-logo" src="${pageContext.request.contextPath}/Images/Logo.png" alt="MotionRehab logo" width="34" height="34">
      <span>MotionRehab</span>
    </a>

    <nav class="user-menu">
      <a class="user-nav-item active" href="${pageContext.request.contextPath}/UserDashboard">Dashboard</a>
      <a class="user-nav-item" href="${pageContext.request.contextPath}/BookingAppointment">Book Appointment</a>
      <a class="user-nav-item" href="${pageContext.request.contextPath}/appointment-history">Appointment History</a>
      <a class="user-nav-item" href="${pageContext.request.contextPath}/user/exercise-plans">Exercise Plans</a>
    </nav>

    <div class="user-logout">
      <a class="user-nav-item" href="${pageContext.request.contextPath}/logout">Log out</a>
    </div>
  </aside>

  <section class="user-page">
    <header class="user-topbar">
      <div>
        <h1><c:out value="${greeting}" />, <c:out value="${sessionScope.patientName}" /></h1>
        <p>Welcome back to your MotionRehab patient dashboard.</p>
      </div>

      <div class="user-top-actions">
        <div class="user-profile">
          <div>
            <strong><c:out value="${sessionScope.patientName}" /></strong>
            <span>Patient</span>
          </div>
          <c:choose>
            <c:when test="${not empty sessionScope.patient.image}">
              <img class="user-avatar" src="data:image/*;base64,${sessionScope.patient.image}" alt="Patient profile">
            </c:when>
            <c:otherwise>
              <span class="user-avatar">PT</span>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </header>

    <section class="user-content dashboard-content">
      <div class="dashboard-grid">
        <article class="user-card appointment-card">
          <div class="user-card-title">
            <div>
              <h2>Upcoming Appointment</h2>
              <p>Your next scheduled physiotherapy session.</p>
            </div>
            <a href="${pageContext.request.contextPath}/appointment-history">View all</a>
          </div>

          <c:choose>
            <c:when test="${not empty upcomingAppointment}">
              <div class="appointment-box">
                <div class="appointment-date">
                  <span>Date</span>
                  <strong><c:out value="${upcomingAppointment.appointmentDate}" /></strong>
                </div>
                <div class="appointment-info">
                  <h3><c:out value="${upcomingAppointment.reason}" /></h3>
                  <p><c:out value="${upcomingAppointment.appointmentTime}" /></p>
                  <p>
                    Dr. <c:out value="${upcomingAppointment.staffName}" />
                    <c:if test="${not empty upcomingAppointment.specialization}">
                      - <c:out value="${upcomingAppointment.specialization}" />
                    </c:if>
                  </p>
                </div>
                <span class="status-pill upcoming">
                  <c:out value="${upcomingAppointment.status}" />
                </span>
              </div>
            </c:when>
            <c:otherwise>
              <div class="empty-state">
                <p>No upcoming appointment found.</p>
              </div>
            </c:otherwise>
          </c:choose>
        </article>

        <article class="user-card quick-actions-card">
          <div class="user-card-title">
            <div>
              <h2>Quick Actions</h2>
              <p>Common patient tasks.</p>
            </div>
          </div>
          <div class="quick-actions">
            <a class="action-button primary-action" href="${pageContext.request.contextPath}/BookingAppointment">Book New Appointment</a>
            <a class="action-button" href="${pageContext.request.contextPath}/appointment-history">View Appointment History</a>
            <a class="action-button" href="${pageContext.request.contextPath}/user/exercise-plans">View Exercise Plans</a>
          </div>
        </article>

        <article class="user-card overview-card">
          <div class="user-card-title">
            <div>
              <h2>Recovery Overview</h2>
              <p>Simple summary from your records.</p>
            </div>
          </div>
          <div class="overview-grid">
            <div class="summary-box">
              <strong>
                <c:choose>
                  <c:when test="${not empty upcomingCount}"><c:out value="${upcomingCount}" /></c:when>
                  <c:otherwise>0</c:otherwise>
                </c:choose>
              </strong>
              <span>Upcoming Appointments</span>
            </div>
            <div class="summary-box">
              <strong>
                <c:choose>
                  <c:when test="${not empty assignedExerciseCount}"><c:out value="${assignedExerciseCount}" /></c:when>
                  <c:otherwise>0</c:otherwise>
                </c:choose>
              </strong>
              <span>Assigned Exercises</span>
            </div>
          </div>
        </article>

        <article class="user-card exercise-card">
          <div class="user-card-title">
            <div>
              <h2>Today's Exercise Plan</h2>
              <p>Exercises assigned for your recovery.</p>
            </div>
            <a href="${pageContext.request.contextPath}/user/exercise-plans">View full plan</a>
          </div>

          <c:choose>
            <c:when test="${not empty todaysExercises}">
              <div class="exercise-list">
                <c:forEach var="exercise" items="${todaysExercises}">
                  <div class="exercise-row">
                    <div>
                      <h3><c:out value="${exercise.exerciseName}" /></h3>
                      <p><c:out value="${exercise.description}" /></p>
                    </div>
                    <span><c:out value="${exercise.focusArea}" /></span>
                  </div>
                </c:forEach>
              </div>
            </c:when>
            <c:otherwise>
              <div class="empty-state">
                <p>No exercises assigned for today.</p>
              </div>
            </c:otherwise>
          </c:choose>
        </article>
      </div>
    </section>
  </section>
</main>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exercise Plans - MotionRehab</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/User_Navbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/UserExercisePlan.css">
</head>
<body>
<main class="user-layout">
  <aside class="user-sidebar">
    <a class="user-brand" href="${pageContext.request.contextPath}/UserDashboard">
      <img class="brand-logo" src="${pageContext.request.contextPath}/Images/Logo.png" alt="MotionRehab logo" width="34" height="34">
      <span>MotionRehab</span>
    </a>

    <nav class="user-menu">
      <a class="user-nav-item" href="${pageContext.request.contextPath}/UserDashboard">Dashboard</a>
      <a class="user-nav-item" href="${pageContext.request.contextPath}/BookingAppointment">Book Appointment</a>
      <a class="user-nav-item" href="${pageContext.request.contextPath}/appointment-history">Appointment History</a>
      <a class="user-nav-item active" href="${pageContext.request.contextPath}/user/exercise-plans">Exercise Plans</a>
    </nav>

    <div class="user-logout">
      <a class="user-nav-item" href="${pageContext.request.contextPath}/logout">Log out</a>
    </div>
  </aside>

  <section class="user-page">
    <header class="user-topbar">
      <div>
        <h1>Exercise Plans</h1>
        <p>View your assigned rehabilitation exercises and daily therapy plan.</p>
      </div>

      <div class="user-top-actions">
        <div class="user-profile">
          <div>
            <strong>${sessionScope.patientName}</strong>
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

    <section class="user-content exercise-content">
      <article class="user-card plan-section">
        <div class="user-card-title">
          <div>
            <h2>Assigned Exercise Plans</h2>
            <p>Exercises assigned by your therapist for recovery.</p>
          </div>
        </div>

        <c:choose>
          <c:when test="${not empty assignedExercises}">
            <div class="exercise-list">
              <c:forEach var="exercise" items="${assignedExercises}">
                <article class="exercise-item">
                  <div class="exercise-main">
                    <h3><c:out value="${exercise.exerciseName}" /></h3>
                    <c:if test="${not empty exercise.description}">
                      <p><c:out value="${exercise.description}" /></p>
                    </c:if>

                    <div class="exercise-meta">
                      <c:if test="${not empty exercise.focusArea}">
                        <span><c:out value="${exercise.focusArea}" /></span>
                      </c:if>

                      <c:if test="${not empty exercise.assignedDate}">
                        <span>Assigned: <c:out value="${exercise.assignedDate}" /></span>
                      </c:if>

                      <c:if test="${not empty exercise.status}">
                        <span class="status-pill assigned"><c:out value="${exercise.status}" /></span>
                      </c:if>
                    </div>

                    <c:if test="${not empty exercise.notes}">
                      <p class="exercise-notes"><c:out value="${exercise.notes}" /></p>
                    </c:if>
                  </div>

                  <c:if test="${not empty exercise.videoUrl}">
                    <a class="video-button" href="${exercise.videoUrl}" target="_blank" rel="noopener noreferrer">View Video</a>
                  </c:if>
                </article>
              </c:forEach>
            </div>
          </c:when>

          <c:otherwise>
            <div class="empty-state">
              <p>No exercise plans assigned yet.</p>
            </div>
          </c:otherwise>
        </c:choose>
      </article>

      <article class="user-card tips-card">
        <div class="user-card-title">
          <div>
            <h2>Recovery Tips</h2>
            <p>Simple habits that support safer recovery.</p>
          </div>
        </div>

        <div class="tips-grid">
          <div class="tip-card">
            <span>01</span>
            <h3>Follow therapist instructions carefully</h3>
            <p>Use the form, speed, and number of repetitions suggested by your therapist.</p>
          </div>

          <div class="tip-card">
            <span>02</span>
            <h3>Stop exercise if pain increases</h3>
            <p>Pause the exercise and contact your therapist if pain becomes sharp or severe.</p>
          </div>

          <div class="tip-card">
            <span>03</span>
            <h3>Track progress regularly</h3>
            <p>Keep notes about completed exercises and changes in comfort or movement.</p>
          </div>
        </div>
      </article>
    </section>
  </section>
</main>
</body>
</html>

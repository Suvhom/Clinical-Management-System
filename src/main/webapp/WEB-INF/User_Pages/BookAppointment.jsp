<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Appointment - MotionRehab</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/User_Navbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/BookAppointment.css">
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
      <a class="user-nav-item active" href="${pageContext.request.contextPath}/BookingAppointment">Book Appointment</a>
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
        <h1>Book Appointment</h1>
        <p>Schedule your next physiotherapy session.</p>
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

    <section class="user-content">
      <article class="user-card appointment-form-card">
        <div class="user-card-title">
          <div>
            <h2>Appointment Details</h2>
            <p>Please fill in the information below to schedule your next session.</p>
          </div>
        </div>

        <c:if test="${not empty error}">
          <p class="error-message">${error}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/BookingAppointment" method="post">
          <div class="form-grid">
            <div class="input-group">
              <label>Full Name</label>
              <input type="text" name="fullName" placeholder="Enter your name">
            </div>

            <div class="input-group">
              <label>Phone Number</label>
              <input type="text" name="phoneNumber" placeholder="Enter your phone number">
            </div>

            <div class="input-group">
              <label>Preferred Doctor</label>
              <input type="text" name="preferredDoctor" value="${preferredDoctor}" placeholder="Enter doctor's name">
            </div>

            <div class="input-group">
              <label>Preferred Date</label>
              <input type="date" name="appointmentDate" min="${todayDate}" value="${appointmentDate}" required>
            </div>

            <div class="input-group">
              <label>Preferred Time Slot</label>
              <input type="time" name="appointmentTime" value="${appointmentTime}" required>
            </div>

            <div class="input-group full">
              <label>Reason for Visit or Symptoms <span class="optional">(Optional)</span></label>
              <textarea name="reason" placeholder="Enter the problem that you have been facing"></textarea>
            </div>
          </div>

          <div class="form-footer">
            <a href="${pageContext.request.contextPath}/UserDashboard" class="btn cancel-btn">Cancel</a>
            <button type="submit" class="confirm-btn">Confirm Appointment</button>
          </div>
        </form>
      </article>
    </section>
  </section>
</main>
</body>
</html>

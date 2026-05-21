<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Appointment History - MotionRehab</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/User_Navbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AppointmentHistory.css">
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
      <a class="user-nav-item active" href="${pageContext.request.contextPath}/appointment-history">Appointment History</a>
      <a class="user-nav-item" href="${pageContext.request.contextPath}/user/exercise-plans">Exercise Plans</a>
    </nav>

    <div class="user-logout">
      <a class="user-nav-item" href="${pageContext.request.contextPath}/logout">Log out</a>
    </div>
  </aside>

  <section class="user-page">
    <header class="user-topbar">
      <div>
        <h1>Appointment History</h1>
        <p>View your booked appointments and treatment sessions.</p>
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
      <article class="user-card">
        <div class="history-actions">
          <div>
            <h2>Your Sessions</h2>
            <p>Review all appointment records connected to your patient account.</p>
          </div>
          <a href="${pageContext.request.contextPath}/BookingAppointment">
            <button type="button" class="user-primary-button">Book New</button>
          </a>
        </div>

        <div class="history-tabs">
          <a href="${pageContext.request.contextPath}/appointment-history" class="${selectedStatus == 'all' ? 'active' : ''}">All Appointments</a>
          <a href="${pageContext.request.contextPath}/appointment-history?status=upcoming" class="${selectedStatus == 'upcoming' ? 'active' : ''}">Upcoming</a>
          <a href="${pageContext.request.contextPath}/appointment-history?status=completed" class="${selectedStatus == 'completed' ? 'active' : ''}">Completed</a>
          <a href="${pageContext.request.contextPath}/appointment-history?status=cancelled" class="${selectedStatus == 'cancelled' ? 'active' : ''}">Cancelled</a>
        </div>

        <div class="table-card">
          <table class="history-table">
            <thead>
              <tr>
                <th>Date &amp; Time</th>
                <th>Provider</th>
                <th>Treatment</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <c:if test="${empty appointments}">
                <tr>
                  <td colspan="5" class="empty-row">No appointments found.</td>
                </tr>
              </c:if>

              <c:forEach var="appointment" items="${appointments}">
                <tr>
                  <td>
                    <div class="date-cell">
                      <c:out value="${appointment.appointmentDate}" />
                      <span><c:out value="${appointment.appointmentTime}" /></span>
                    </div>
                  </td>
                  <td>
                    <div class="doctor-cell">
                      <c:out value="${appointment.staffName}" />
                    </div>
                  </td>
                  <td><c:out value="${appointment.reason}" /></td>
                  <td>
                    <span class="status-pill ${appointment.statusCssClass}">
                      <c:out value="${appointment.displayStatus}" />
                    </span>
                  </td>
                  <td>
                    <c:choose>
                      <c:when test="${selectedAppointmentId == appointment.appointmentId}">
                        <a class="view-button active" href="${pageContext.request.contextPath}/appointment-history?status=${selectedStatus}">Hide</a>
                      </c:when>
                      <c:otherwise>
                        <a class="view-button" href="${pageContext.request.contextPath}/appointment-history?status=${selectedStatus}&view=${appointment.appointmentId}">View</a>
                      </c:otherwise>
                    </c:choose>
                  </td>
                </tr>

                <c:if test="${selectedAppointmentId == appointment.appointmentId}">
                  <tr class="appointment-details-row">
                    <td colspan="5">
                      <div class="appointment-details">
                        <div>
                          <span>Appointment ID</span>
                          <strong>APT-<c:out value="${appointment.appointmentId}" /></strong>
                        </div>
                        <div>
                          <span>Date and Time</span>
                          <strong><c:out value="${appointment.appointmentDate}" /> at <c:out value="${appointment.appointmentTime}" /></strong>
                        </div>
                        <div>
                          <span>Assigned By</span>
                          <strong><c:out value="${appointment.staffName}" /></strong>
                        </div>
                        <div>
                          <span>Status</span>
                          <strong><c:out value="${appointment.displayStatus}" /></strong>
                        </div>
                        <div class="details-treatment">
                          <span>Treatment / Reason</span>
                          <p><c:out value="${appointment.reason}" /></p>
                        </div>
                      </div>
                    </td>
                  </tr>
                </c:if>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </article>
    </section>
  </section>
</main>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment History</title>
<link href="${pageContext.request.contextPath}/css/AppointmentHistory.css" rel="stylesheet">
</head>
<body>
<div class="dashboard">
      <!-- SIDEBAR -->

      <div class="sidebar">
      <a href="${pageContext.request.contextPath}/UserDashboard">
        <div class="logo">
          <img
            src="${pageContext.request.contextPath}/Images/SarinaRana.png"
            alt="No image available"
          />
          </a>
          <h2>MotionRehab</h2>
        </div>

        <div class="menu">
          <a href="${pageContext.request.contextPath}/UserDashboard">
            Dashboard
          </a>

          <a href="${pageContext.request.contextPath}/BookingAppointment">
            Book Appointment
          </a>

          <a href="${pageContext.request.contextPath}/AppointmentHistory" class="active">
            Appointment History
          </a>

          <a href="${pageContext.request.contextPath}/ExercisePlan">
            Exercise Plans
          </a>

          <a href="#">
            Billing
          </a>
        </div>

        <div class="bottom-menu">
          <a href="${pageContext.request.contextPath}/login">
            Log out
          </a>
        </div>
      </div>

      <!-- CONTENT -->

      <div class="content">
        <!-- TOPBAR -->

        <div class="topbar">
          <h1>Appointment History</h1>

          <div class="top-right">
            <div class="search-box">
              <input type="text" placeholder="Search history..." />
            </div>

            <div class="profile">
              <div class="profile-text">
                <h3>Sarina Rana</h3>
                <p>Patient</p>
              </div>

              <img
                src="${pageContext.request.contextPath}/Images/SarinaRana.png"
                alt="No image available"
              />
            </div>
          </div>
        </div>

        <!-- MAIN -->

        <div class="main">
          <div class="history-header">
            <div class="header-text">
              <h2>Your Sessions</h2>
              <p>View your booked appointments.</p>
            </div>

            <a href="${pageContext.request.contextPath}/BookingAppointment">
              <button class="book-btn">
                Book New
              </button>
            </a>
          </div>

          <!-- TABS -->

          <div class="tabs">
            <a href="${pageContext.request.contextPath}/AppointmentHistory" class="active">All Appointments</a>
            <a href="#">Upcoming</a>
            <a href="#">Completed</a>
            <a href="#">Cancelled</a>
          </div>

          <!-- TABLE -->

          <div class="table-card">
            <table>
              <thead>
                <tr>
                  <th>Date & Time</th>
                  <th>Provider</th>
                  <th>Treatment</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>

              <tbody>
                <c:if test="${empty appointments}">
                  <tr>
                    <td colspan="5">No appointments found.</td>
                  </tr>
                </c:if>

                <c:forEach var="appointment" items="${appointments}">
                  <tr>
                    <td>
                      <div class="date">
                        <c:out value="${appointment.appointmentDate}" />
                        <span>
                          <c:out value="${appointment.appointmentTime}" />
                        </span>
                      </div>
                    </td>

                    <td>
                      <div class="doctor">
                        <img src="${pageContext.request.contextPath}/Images/EmiliaBhandari.png" alt="Provider image">
                        Dr. <c:out value="${appointment.staffName}" />
                      </div>
                    </td>

                    <td>
                      <c:out value="${appointment.reason}" />
                    </td>

                    <td>
                      <span class="status upcoming">
                        <c:out value="${appointment.status}" />
                      </span>
                    </td>

                    <td>
                      <button type="button" class="action-btn">
                        View
                      </button>

                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                           viewBox="0 0 24 24" fill="none" stroke="currentColor"
                           stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                           class="lucide lucide-ellipsis-vertical-icon lucide-ellipsis-vertical">
                        <circle cx="12" cy="12" r="1"/>
                        <circle cx="12" cy="5" r="1"/>
                        <circle cx="12" cy="19" r="1"/>
                      </svg>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
</body>
</html>
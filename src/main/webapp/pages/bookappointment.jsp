<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Your Appointment</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookappointment.css">
</head>
<body>
<main class="appointment-page">
    <section class="booking-card">
      <aside class="booking-info">
        <span class="tag">MotionRehab Care</span>
        <h1>Book your appointment in minutes.</h1>
        <p>
          Fill in your details and choose your preferred date, time, and specialist.
          We will confirm your slot right away.
        </p>

        <ul>
          <li>Same-day and next-day slots</li>
          <li>In-person and telehealth options</li>
          <li>Easy reschedule and reminder alerts</li>
        </ul>
      </aside>

      <section class="booking-form-wrap">
        <h2>Book Appointment</h2>
        <p class="subtitle">Complete all fields below to request your visit.</p>

        <% if (request.getAttribute("successMessage") != null) { %>
          <p class="alert success"><%= request.getAttribute("successMessage") %></p>
        <% } %>

        <form class="booking-form" action="${pageContext.request.contextPath}/appointment" method="post">
          <label>
            Full Name
            <input type="text" name="fullName" placeholder="Enter full name" required>
          </label>

          <label>
            Email Address
            <input type="email" name="email" placeholder="Enter email address" required>
          </label>

          <label>
            Phone Number
            <input type="tel" name="phone" placeholder="Enter phone number" required>
          </label>

          <label>
            Date of Birth
            <input type="date" name="dob">
          </label>

          <label>
            Department
            <select name="department" required>
              <option value="">Select department</option>
              <option value="general">General Physiotherapy</option>
              <option value="sports">Sports Injury Rehab</option>
              <option value="back-neck">Back and Neck Pain</option>
              <option value="post-op">Post-Surgical Rehab</option>
            </select>
          </label>

          <label>
            Preferred Doctor
            <select name="doctor">
              <option value="">Select doctor</option>
              <option value="dr-pokhrel">Dr. Pokhrel</option>
              <option value="dr-kc">Dr. K.C.</option>
              <option value="dr-bhusal">Dr. Bhusal</option>
              <option value="dr-bhattrai">Dr. Bhattrai</option>
              <option value="dr-shrestha">Dr. Shrestha</option>
            </select>
          </label>

          <label>
            Appointment Date
            <input type="date" name="appointmentDate" required>
          </label>

          <label>
            Preferred Time
            <input type="time" name="appointmentTime" required>
          </label>

          <label>
            Visit Type
            <select name="visitType" required>
              <option value="">Select visit type</option>
              <option value="in-person">In-person</option>
              <option value="telehealth">Telehealth</option>
            </select>
          </label>

          <label>
            Emergency Contact
            <input type="text" name="emergencyContact" placeholder="Name and number">
          </label>

          <label>
            Reason for Visit
            <select name="reason" required>
              <option value="">Select reason</option>
              <option value="pain-management">Pain management</option>
              <option value="injury">Injury recovery</option>
              <option value="mobility">Mobility improvement</option>
              <option value="follow-up">Follow-up</option>
            </select>
          </label>

          <label class="full-width">
            Symptoms / Additional Notes
            <textarea name="notes" rows="5" placeholder="Share symptoms, current concerns, and anything your specialist should know."></textarea>
          </label>

          <label class="consent full-width checkbox-label">
            <input type="checkbox" name="consent" required>
            <span>I consent to data processing and agree to appointment terms.</span>
          </label>

          <div class="form-actions full-width">
            <a href="${pageContext.request.contextPath}/pages/login.jsp" class="back-link">Back to login</a>
            <button type="submit">Confirm Appointment</button>
          </div>
        </form>
      </section>
    </section>
  </main>
</body>
</html>

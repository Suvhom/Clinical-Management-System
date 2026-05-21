<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Common_Website_Css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Navbar_website.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/contactus.css">
</head>
<body>
	
  <!-- Nav Bar -->
        <header class="navbar">
  <div class="container nav-wrapper">

    <!-- Logo -->
 <div class="logo">
  <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="Motion Rehab Logo" class="logo-img">
  <span>MotionRehab</span>
</div>

    <!-- Navigation Links -->
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/home" class="nav-button">Home</a></li>
      <li><a href="${pageContext.request.contextPath}/facilities" class="nav-button">Facilities</a></li>
      <li><a href="${pageContext.request.contextPath}/about" class="nav-button">About Us</a></li>
      <li><a href="${pageContext.request.contextPath}/blog" class="nav-button">Blog</a></li>
      <li><a href="${pageContext.request.contextPath}/contact" class="nav-button">Contact Us</a></li>
      <li><a href="${pageContext.request.contextPath}/login" class="login-btn">Login</a></li>
    </ul>

  </div>
</header>

  <!-- Hero -->
  <div class="hero">
    <span class="hero-tag">Contact Us</span>
    <h1>Get in Touch</h1>
    <p>Have questions about our treatments or want to schedule an appointment? Fill in the form and our team will get back to you shortly.</p>
  </div>

  <!-- Main -->
  <div class="contact-wrapper">

    <!-- Form -->
    <div class="form-card">
      <c:if test="${param.success == '1'}">
        <p class="success-message">Your inquiry has been sent successfully.</p>
      </c:if>

      <c:if test="${param.error == '1'}">
        <p class="error-message">Something went wrong. Please try again.</p>
      </c:if>

      <c:if test="${param.error == 'missing'}">
        <p class="error-message">Please fill in all required fields.</p>
      </c:if>

      <c:if test="${param.error == 'description'}">
        <p class="error-message">Please write a description before sending your inquiry.</p>
      </c:if>

      <form id="contactForm" action="${pageContext.request.contextPath}/contact-inquiry" method="post">
        <div class="form-grid-2">
          <div class="form-group">
            <label for="fname">First Name</label>
            <input type="text" id="fname" name="firstName" placeholder="Ram" required />
          </div>
          <div class="form-group">
            <label for="lname">Last Name</label>
            <input type="text" id="lname" name="lastName" placeholder="Bahadur" required />
          </div>
        </div>
        <div class="form-grid-2">
          <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="Ram@example.com" required />
          </div>
          <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone" placeholder="+977 9800000000" />
          </div>
        </div>
        <div class="form-group full">
          <label for="doctor">Doctor Preference</label>
          <input type="text" id="doctor" name="doctorPreference" placeholder="e.g. Dr. Hari Shrestha" />
        </div>
        <div class="form-group full">
          <label for="description">Description</label>
          <textarea id="description" name="description" placeholder="Tell us about your condition or what you need help with..." required></textarea>
        </div>
        <button type="submit" class="btn-submit">
          <span class="btn-text">Send Message</span>
          <span class="spinner"></span>
        </button>
      </form>

    </div>

    <!-- Side panel -->
    <div class="side-panel">
      <!-- Map -->
      <div class="map-card">
        <a href="https://www.google.com/maps/place/Islington+College/@27.7089944,85.325193,17z/data=!3m1!4b1!4m6!3m5!1s0x39eb1908434cb3c5:0x1fdf1a6d41d2512d!8m2!3d27.7089944!4d85.325193!16s%2Fm%2F0wblb79?entry=ttu&g_ep=EgoyMDI2MDUwNi4wIKXMDSoASAFQAw%3D%3D"
           target="_blank"
           rel="noopener noreferrer"
           title="Open in OpenStreetMap">
          <img
            src="${pageContext.request.contextPath}/Images/map_image.png"
            class="map-image"
            onerror="this.onerror=null; this.src='https://staticmap.openstreetmap.de/staticmap.php?center=27.6939,85.3157&zoom=16&size=320x170&markers=27.6939,85.3157,red-pushpin';"
          />
        </a>
        <div class="map-info">
          <h4>Our Clinic</h4>
          <p>123 Physio Avenue, Thapathali,<br/>Kathmandu</p>
        </div>
      </div>

      <!-- Info cards -->
      <div class="info-card">
        <div class="info-icon">
          <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="Phone" width="18" height="18" />
        </div>
        <div class="info-text">
          <span>Phone</span>
          <p>+977 9841446180</p>
        </div>
      </div>

      <div class="info-card">
        <div class="info-icon">
          <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="Email" width="18" height="18" />
        </div>
        <div class="info-text">
          <span>Email</span>
          <p>hello@motionrehab.com</p>
        </div>
      </div>

      <div class="info-card">
        <div class="info-icon">
          <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="Working Hours" width="18" height="18" />
        </div>
        <div class="info-text">
          <span>Working Hours</span>
          <p>Mon – Fri: 8am – 7pm<br/>Sat: 9am – 3pm</p>
        </div>
      </div>
    </div>

  </div><!-- /contact-wrapper -->


  <section class="cta">
  <div class="container cta-wrapper">
    <h2>Ready to start your journey to a pain-free life?</h2>
    <p>
      Schedule your initial assessment today and let our expert team create a
      personalized recovery plan tailored just for you.
    </p>

    <div class="cta-buttons">
      <a href="${pageContext.request.contextPath}/BookAppointment" class="cta-btn-primary">Book Your Appointment</a>
      <a href="#" class="cta-btn-secondary">Call-PHYSIO</a>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="footer">
  <div class="container footer-top">

    <!-- Left Section -->
    <div class="footer-brand">
      <div class="footer-logo">
        <div class="logo">
        <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="Motion Rehab Logo" class="logo-img">
        <span>MotionRehab</span>
</div>
      </div>

      <p>
        Dedicating to providing exceptional physiotherapy care to help you move
        freely and live without limits. Your recovery starts here.
      </p>

      <div class="social-icons">
        <a href="#">f</a>
        <a href="#">◎</a>
        <a href="#">t</a>
      </div>
    </div>

    <!-- Quick Links -->
    <div class="footer-links">
      <h3>Quick Links</h3>
      <ul>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Our Team</a></li>
        <li><a href="#">Testimonials</a></li>
        <li><a href="#">Careers</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </div>

    <!-- Services -->
    <div class="footer-links">
      <h3>Services</h3>
      <ul>
        <li><a href="#">Sports Injuries</a></li>
        <li><a href="#">Back & Neck Pain</a></li>
        <li><a href="#">Post-Surgery Rehab</a></li>
        <li><a href="#">Acupuncture</a></li>
      </ul>
    </div>

    <!-- Contact -->
    <div class="footer-contact">
      <h3>Contact</h3>
      <p>📍 Kirtipur, Pangga</p>
      <p>📞 9749497768</p>
      <p>✉ Motionrehab99@gmail.com</p>
    </div>

  </div>

  <hr>

  <div class="container footer-bottom">
    <p></p>
    <div class="footer-bottom-links">
      <a href="#">Privacy Policy</a>
      <a href="#">Terms of Services</a>
    </div>
  </div>
</footer>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/CSS/contactus.css" rel="stylesheet">
</head>
<body>
	
         <!-- Nav Bar -->
         <!-- Nav Bar -->
        <header class="navbar">
  <div class="container nav-wrapper">

    <!-- Logo -->
 <div class="logo">
  <img src="${pageContext.request.contextPath}../../images/Logo.png" alt="Motion Rehab Logo" class="logo-img">
  <span>MotionRehab</span>
</div>

    <!-- Navigation Links -->
    <ul class="nav-links">
      <li><a href="#" class="nav-button">Home</a></li>
      <li><a href="#" class="nav-button">Facilities</a></li>
      <li><a href="<%= request.getContextPath() %>/Aboutus" class="nav-button">About Us</a></li>
      <li><a href="#" class="nav-button">Blog</a></li>
      <li><a href="<%= request.getContextPath() %>/Contactus" class="nav-button">Contact Us</a></li>
      <li><a href="#" class="book-btn">Book Appointment</a></li>
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
      <form id="contactForm">
        <div class="form-grid-2">
          <div class="form-group">
            <label for="fname">First Name</label>
            <input type="text" id="fname" placeholder="Ram" required />
          </div>
          <div class="form-group">
            <label for="lname">Last Name</label>
            <input type="text" id="lname" placeholder="Bahadur" required />
          </div>
        </div>
        <div class="form-grid-2">
          <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" placeholder="Ram@example.com" required />
          </div>
          <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" placeholder="+977 9800000000" />
          </div>
        </div>
        <div class="form-group full">
          <label for="doctor">Doctor Preference</label>
          <input type="text" id="doctor" placeholder="e.g. Dr. Hari Shrestha" />
        </div>
        <div class="form-group full">
          <label for="description">Description</label>
          <textarea id="description" placeholder="Tell us about your condition or what you need help with…"></textarea>
        </div>
        <button type="submit" class="btn-submit">
          <span class="btn-text">Send Message</span>
          <span class="spinner"></span>
        </button>
      </form>

      <div class="success-msg" id="successMsg">
        <div class="success-icon">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
            <polyline points="20 6 9 17 4 12"></polyline>
          </svg>
        </div>
        <h3>Message Sent!</h3>
        <p>Thank you for reaching out. Our team will get back to you within 24 hours.</p>
        <a class="back-link" id="backLink">← Send another message</a>
      </div>
    </div>

    <!-- Side panel -->
    <div class="side-panel">
      <!-- Map -->
      <div class="map-card">
        <div class="map-visual">
          <svg viewBox="0 0 320 170" xmlns="http://www.w3.org/2000/svg">
            <rect width="320" height="170" fill="#dce8f2"/>
            <!-- grid roads -->
            <line x1="0" y1="42" x2="320" y2="42" stroke="#c4d4e0" stroke-width="1"/>
            <line x1="0" y1="85" x2="320" y2="85" stroke="#c4d4e0" stroke-width="1"/>
            <line x1="0" y1="128" x2="320" y2="128" stroke="#c4d4e0" stroke-width="1"/>
            <line x1="64" y1="0" x2="64" y2="170" stroke="#c4d4e0" stroke-width="1"/>
            <line x1="128" y1="0" x2="128" y2="170" stroke="#c4d4e0" stroke-width="1"/>
            <line x1="192" y1="0" x2="192" y2="170" stroke="#c4d4e0" stroke-width="1"/>
            <line x1="256" y1="0" x2="256" y2="170" stroke="#c4d4e0" stroke-width="1"/>
            <!-- buildings -->
            <rect x="20" y="50" width="36" height="22" rx="2" fill="#b8c9d8"/>
            <rect x="72" y="20" width="44" height="16" rx="2" fill="#c0cdd8"/>
            <rect x="72" y="50" width="44" height="28" rx="2" fill="#b3c4d2"/>
            <rect x="140" y="30" width="38" height="14" rx="2" fill="#bfcbd6"/>
            <rect x="200" y="50" width="48" height="30" rx="2" fill="#b5c3cf"/>
            <rect x="264" y="20" width="40" height="20" rx="2" fill="#c4d2de"/>
            <rect x="20" y="100" width="30" height="20" rx="2" fill="#bfcfdc"/>
            <rect x="72" y="96" width="44" height="24" rx="2" fill="#b8c8d5"/>
            <rect x="140" y="92" width="40" height="28" rx="2" fill="#c2d0db"/>
            <rect x="264" y="96" width="40" height="26" rx="2" fill="#b8c8d5"/>
            <!-- pin -->
            <circle cx="160" cy="85" r="14" fill="#2563eb" opacity="0.15"/>
            <circle cx="160" cy="82" r="8" fill="#2563eb"/>
            <circle cx="160" cy="82" r="3" fill="white"/>
            <polygon points="160,96 155,88 165,88" fill="#2563eb"/>
          </svg>
        </div>
        <div class="map-info">
          <h4>Our Clinic</h4>
          <p>123 Physio Avenue, Thapathali,<br/>Kathmandu </p>
        </div>
      </div>

      <!-- Info cards -->
      <div class="info-card">
        <div class="info-icon">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 12 19.79 19.79 0 0 1 1.62 3.37 2 2 0 0 1 3.56 1.18h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L7.91 8.91a16 16 0 0 0 6.1 6.1l1.27-1.27a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/>
          </svg>
        </div>
        <div class="info-text">
          <span>Phone</span>
          <p>+977 9841446180</p>
        </div>
      </div>

      <div class="info-card">
        <div class="info-icon">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
            <polyline points="22,6 12,13 2,6"/>
          </svg>
        </div>
        <div class="info-text">
          <span>Email</span>
          <p>hello@motionrehab.com</p>
        </div>
      </div>

      <div class="info-card">
        <div class="info-icon">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="12" cy="12" r="10"/>
            <polyline points="12 6 12 12 16 14"/>
          </svg>
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
      <a href="#" class="cta-btn-primary">Book Your Appointment</a>
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
        <img src="${pageContext.request.contextPath}../../images/Logo.png" alt="Motion Rehab Logo" class="logo-img">
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
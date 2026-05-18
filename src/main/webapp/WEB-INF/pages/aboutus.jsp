<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/css/aboutus.css" rel="stylesheet">
</head>
<body>
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
      <li><a href="<%= request.getContextPath() %>/FacilitiesServlet" class="nav-button">Facilities</a></li>
     <li><a href="<%= request.getContextPath() %>/Aboutus" class="nav-button">About Us</a></li>
      <li><a href="#" class="nav-button">Blog</a></li>
      <li><a href="<%= request.getContextPath() %>/Contactus" class="nav-button">Contact Us</a></li>
      <li><a href="#" class="book-btn">Book Appointment</a></li>
    </ul>

  </div>

<!-- Hero -->
<section class="hero">
  <div class="hero-badge">About Our Team</div>
  <h1>Meet Our Expert Team<br><em>of Specialists</em></h1>
  <p>Dedicated physiotherapy professionals committed to advancing rehabilitation and personalised wellness of the individuals.</p>
</section>

<!-- Team Grid -->
<section class="team-section">
  <div class="team-grid">

    <!-- Dr. Suvhom KC -->
    <div class="team-card">
      <div class="card-avatar">
        <img src="${pageContext.request.contextPath}../../images/img4.jpeg" alt="Dr. Suvhom KC" onerror="this.style.display='none';this.parentNode.textContent='AS'">
      </div>
      <div class="card-body">
        <div class="card-name">Dr. Suvhom KC</div>
        <div class="card-role">Lead Physiotherapist</div>
        <p class="card-desc">Specialising in pain management, rehabilitation, and personalised treatment for tissue injury and impaired mobility.</p>
        <div class="card-tags">
          <span class="tag">Pain Management</span>
          <span class="tag">Rehabilitation</span>
          <span class="tag">Sports Injury</span>
        </div>
        <a href="#" class="btn-book">Book with Suvhom</a>
      </div>
    </div>

    <!-- Dr. Suyesh Bhattari -->
    <div class="team-card">
      <div class="card-avatar">
        <img src="${pageContext.request.contextPath}../../images/img2.jpg" alt="Dr. Suyesh Bhattari" onerror="this.style.display='none';this.parentNode.textContent='SP'">
      </div>
      <div class="card-body">
        <div class="card-name">Dr. Suyesh Bhattari</div>
        <div class="card-role">Senior Physiotherapist</div>
        <p class="card-desc">Specialising in pain management, rehabilitation, and personalised treatment for tissue injury and impaired mobility.</p>
        <div class="card-tags">
          <span class="tag">Tissue Injury</span>
          <span class="tag">Mobility</span>
          <span class="tag">Post-Surgery</span>
        </div>
        <a href="#" class="btn-book">Book with Suyesh</a>
      </div>
    </div>

    <!-- Dr. Dibish -->
    <div class="team-card">
      <div class="card-avatar">
        <img src="${pageContext.request.contextPath}../../images/img3.jpeg" alt="Dr. Dibish Pokhrel" onerror="this.style.display='none';this.parentNode.textContent='SS'">
      </div>
      <div class="card-body">
        <div class="card-name">Dr. Dibish Pokhrel</div>
        <div class="card-role">Sports Rehabilitation</div>
        <p class="card-desc">Specialising in sports rehabilitation and personalised treatment for tissue injury and impaired recovery.</p>
        <div class="card-tags">
          <span class="tag">Sports Rehab</span>
          <span class="tag">Injury Recovery</span>
          <span class="tag">Strength</span>
        </div>
        <a href="#" class="btn-book">Book with Dibish</a>
      </div>
    </div>

    <!-- Dr. Aaraj Shrestha -->
    <div class="team-card">
      <div class="card-avatar">
        <img src="${pageContext.request.contextPath}../../images/img.jpeg" alt="Dr. Aaraj Shrestha" onerror="this.style.display='none';this.parentNode.textContent='PM'">
      </div>
      <div class="card-body">
        <div class="card-name">Dr. Aaraj Shrestha</div>
        <div class="card-role">Neurological Physiotherapy</div>
        <p class="card-desc">Specialising in neurological rehabilitation, helping patients recover from strokes with a compassionate evidence-based approach.</p>
        <div class="card-tags">
          <span class="tag">Neurology</span>
          <span class="tag">Stroke Recovery</span>
          <span class="tag">Balance</span>
        </div>
        <a href="#" class="btn-book">Book with Aaraj</a>
      </div>
    </div>

    <!-- Dr. Asim Bhusal -->
    <div class="team-card">
      <div class="card-avatar">
        <img src="${pageContext.request.contextPath}../../images/img5.jpeg" alt="Dr. Asim Bhusal" onerror="this.style.display='none';this.parentNode.textContent='OB'">
      </div>
      <div class="card-body">
        <div class="card-name">Dr. Asim Bhusal</div>
        <div class="card-role">Musculoskeletal Specialist</div>
        <p class="card-desc">Focusing on musculoskeletal conditions, delivering individualised programmes to restore function and eliminate chronic pain.</p>
        <div class="card-tags">
          <span class="tag">Musculoskeletal</span>
          <span class="tag">Chronic Pain</span>
          <span class="tag">Posture</span>
        </div>
        <a href="#" class="btn-book">Book with Asim</a>
      </div>
    </div>

  </div>
</section>

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
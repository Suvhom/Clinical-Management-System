<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Common_Website_Css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Navbar_website.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css?v=2">
<title>Blog</title>
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
<h1>Explore Our Blogs</h1>
<h4>Discover the latest insights and tips on physiotherapy, <br>wellness, and health to keep you moving freely.</h4>
<div class="main">

<div class="card">
<div class="image1">
<img src="${pageContext.request.contextPath}/Images/blog1.png" alt="Gym injury physiotherapy">
</div>
<div class="content">
<p>05/20/2026</p>
</div>
<div class="title">
<h3>Gym Injuries: Common Mistakes and How Physiotherapy Helps</h3>
</div>

<div class="description">
<p>Learn how poor form, heavy lifting, and skipping warm-ups can cause strains, back pain, and joint problems during workouts.</p>
</div>
</div>


<div class="card">
<div class="image2">
<img src="${pageContext.request.contextPath}/Images/blog5.jpeg" alt="Common physiotherapy injuries">
</div>
<div class="content">
<p>05/18/2026</p>
</div>
<div class="title">
<h3>Common Injuries Treated in Physiotherapy Clinics</h3>
</div>
<div class="description">
<p>A simple guide to sprains, muscle pain, stiffness, and posture-related problems that patients commonly bring to physiotherapy.</p>
</div>
</div>



<div class="card">
<div class="image3">
<img src="${pageContext.request.contextPath}/Images/blog3.jpg" alt="Rare injury rehabilitation">
</div>
<div class="content">
<p>05/16/2026</p>
</div>
<div class="title">
<h3>Rare Injuries That Still Need Proper Rehabilitation</h3>
</div>
<div class="description">
<p>Some injuries happen less often but still need careful assessment, guided exercise, and regular follow-up to recover safely.</p>
</div>
</div>


<div class="card">
<div class="image4">
<img src="${pageContext.request.contextPath}/Images/blog 6.jpg" alt="Critical injury recovery">
</div>
<div class="content">
<p>05/14/2026</p>
</div>
<div class="title">
<h3>Critical Injury Recovery: Why Early Care Matters</h3>
</div>
<div class="description">
<p>Serious injuries require timely medical advice, safe movement planning, and gradual rehabilitation to avoid long-term weakness.</p>
</div>
</div>


<div class="card">
<div class="image5">
<img src="${pageContext.request.contextPath}/Images/blog2.png" alt="Women injury prevention">
</div>
<div class="content">
<p>05/12/2026</p>
</div>
<div class="title">
<h3>Women and Injury Prevention During Daily Activities</h3>
</div>
<div class="description">
<p>Simple stretching, posture care, strength training, and rest habits can help reduce pain and support safer daily movement.</p>
</div>
</div>


<div class="card">
<div class="image6">
<img src="${pageContext.request.contextPath}/Images/blog4.jpg" alt="Men injury recovery">
</div>
<div class="content">
<p>05/10/2026</p>
</div>
<div class="title">
<h3>Men's Injury Recovery: Strength, Mobility, and Rest</h3>
</div>
<div class="description">
<p>Recovery is not only about exercise. Proper rest, mobility work, and therapist-guided strengthening help prevent repeat injuries.</p>
</div>
</div>
</div>

<!-- Contact Section -->
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

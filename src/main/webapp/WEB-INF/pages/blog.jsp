<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%= request.getContextPath() %>/css/blog.css" rel="stylesheet">
<title>Blog</title>
</head>
<body>
<header class="navbar">
  <div class="nav-wrapper">
 <div class="logo">
  <img src="../images/Logo.png" alt="Motion Rehab Logo" class="logo-img">
  <span>MotionRehab</span>
</div>
    <ul class="nav-links">
       <li><a href="<%= request.getContextPath() %>/HomeServlet" class="nav-button">Home</a></li>
      <li><a href="<%= request.getContextPath() %>/FacilitiesServlet" class="nav-button">Facilities</a></li>
      <li><a href="<%= request.getContextPath() %>/Aboutus" class="nav-button">About Us</a></li>
      <li><a href="<%= request.getContextPath() %>/BlogServlet" class="nav-button">Blog</a></li>
      <li><a href="<%= request.getContextPath() %>/Contactus" class="nav-button">Contact Us</a></li>
      <li><a href="#" class="book-btn">Book Appointment</a></li>
    </ul>

  </div>
</header>
<h1>Explore Our Blogs</h1>
<h4>Discover the latest insights and tips on physiotherapy, <br>wellness, and health to keep you moving freely.</h4>
<div class="main">

<div class="card">
<div class="image1">
<img src="../images/java_blog.jpg" alt="">
</div>
<div class="content">
<p>05/18/2026</p>
</div>
<div class="title">
<h3>Gym Injuries: Common Mistakes & How Physiotherapy Helps (Complete Guide)</h3>
</div>

<div class="description">
<p>Most first-time and even frequent gym attendees find themselves exercising without really knowing what they are doing 
leading to workout injuries including back pain, muscles strains and joint issues.</p>
</div>
</div>


<div class="card">
<div class="image2">
<img src="../images/java_blog2.jpg" alt="">
</div>
<div class="content">
<p>05/17/2026</p>
</div>
<div class="title">
<h3>Common Injuries: Common Mistakes & How Physiotherapy Helps (Complete Guide)</h3>
</div>
<div class="description">
<p>Most first-time and even frequent gym attendees find themselves exercising without really knowing what they are doing 
leading to workout injuries including back pain, muscles strains and joint issues.</p>
</div>
</div>



<div class="card">
<div class="image3">
<img src="../images/java_blog3.jpg" alt="">
</div>
<div class="content">
<p>05/18/2026</p>
</div>
<div class="title">
<h3>Rare Injuries: Common Mistakes & How Physiotherapy Helps (Complete Guide)</h3>
</div>
<div class="description">
<p>Most first-time and even frequent gym attendees find themselves exercising without really knowing what they are doing 
leading to workout injuries including back pain, muscles strains and joint issues.</p>
</div>
</div>


<div class="card">
<div class="image4">
<img src="../images/java_blog4.jpg" alt="">
</div>
<div class="content">
<p>05/18/2026</p>
</div>
<div class="title">
<h3>Critical Injuries: Common Mistakes & How Physiotherapy Helps (Complete Guide)</h3>
</div>
<div class="description">
<p>Most first-time and even frequent gym attendees find themselves exercising without really knowing what they are doing 
leading to workout injuries including back pain, muscles strains and joint issues.</p>
</div>
</div>


<div class="card">
<div class="image5">
<img src="../images/java_blog5.jpg" alt="">
</div>
<div class="content">
<p>05/16/2026</p>
</div>
<div class="title">
<h3>Women Injuries: Common Mistakes & How Physiotherapy Helps (Complete Guide)</h3>
</div>
<div class="description">
<p>Most first-time and even frequent gym attendees find themselves exercising without really knowing what they are doing 
leading to workout injuries including back pain, muscles strains and joint issues.</p>
</div>
</div>


<div class="card">
<div class="image6">
<img src="../images/java_blog6.jpg" alt="">
</div>
<div class="content">
<p> 05/18/2026 </p>
</div>
<div class="title">
<h3>Mens Injuries: Common Mistakes & How Physiotherapy Helps (Complete Guide)</h3>
</div>
<div class="description">
<p>Most first-time and even frequent gym attendees find themselves exercising without really knowing what they are doing 
leading to workout injuries including back pain, muscles strains and joint issues.</p>
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
        <img src="../Images/Logo.png" alt="Motion Rehab Logo" class="logo-img">
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
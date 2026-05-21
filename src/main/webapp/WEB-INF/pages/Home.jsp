<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MotionRehab</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Common_Website_Css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Navbar_website.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Home_CSS.css?v=2">
</head>
<body>

<header class="navbar">
  <div class="container nav-wrapper">
    <div class="logo">
      <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="MotionRehab Logo" class="logo-img" width="40" height="40">
      <span>MotionRehab</span>
    </div>

    <ul class="nav-links">
      <li><a href="${pageContext.request.contextPath}/home" class="nav-button active">Home</a></li>
      <li><a href="${pageContext.request.contextPath}/facilities" class="nav-button">Facilities</a></li>
      <li><a href="${pageContext.request.contextPath}/about" class="nav-button">About Us</a></li>
      <li><a href="${pageContext.request.contextPath}/blog" class="nav-button">Blog</a></li>
      <li><a href="${pageContext.request.contextPath}/contact" class="nav-button">Contact Us</a></li>
      <li><a href="${pageContext.request.contextPath}/login" class="login-btn">Login</a></li>
    </ul>
  </div>
</header>

<section class="hero">
  <div class="container hero-wrapper">
    <div class="hero-text">
      <span class="section-label">Physiotherapy and recovery care</span>
      <h1>Move Better. Live Pain-Free.</h1>
      <p>
        MotionRehab provides guided physiotherapy, exercise plans, and patient-focused
        care to help you recover mobility and return to daily life with confidence.
      </p>

      <div class="hero-buttons">
        <a href="${pageContext.request.contextPath}/login" class="btn-primary">Start Your Recovery</a>
        <a href="${pageContext.request.contextPath}/facilities" class="btn-secondary">View Facilities</a>
      </div>
    </div>

    <div class="hero-image">
      <img src="${pageContext.request.contextPath}/Images/Hero-Section.png" alt="Physiotherapist helping patient exercise" class="hero-img" width="640" height="360">
    </div>
  </div>
</section>

<section class="features">
  <div class="container feature-row">
    <div class="feature-card">
      <img src="${pageContext.request.contextPath}/Images/Home-Card1.png" alt="Therapist support" class="feature-img" width="52" height="52">
      <div>
        <h3>Expert Therapists</h3>
        <p>Certified care team</p>
      </div>
    </div>

    <div class="feature-card">
      <img src="${pageContext.request.contextPath}/Images/Home-Card2.png" alt="Exercise guidance" class="feature-img" width="52" height="52">
      <div>
        <h3>Exercise Plans</h3>
        <p>Personal recovery routines</p>
      </div>
    </div>

    <div class="feature-card">
      <img src="${pageContext.request.contextPath}/Images/Home-Card3.png" alt="Appointment support" class="feature-img" width="52" height="52">
      <div>
        <h3>Easy Booking</h3>
        <p>Appointments made simple</p>
      </div>
    </div>

    <div class="feature-card">
      <img src="${pageContext.request.contextPath}/Images/Home-Card4.png" alt="Recovery progress" class="feature-img" width="52" height="52">
      <div>
        <h3>Progress Focused</h3>
        <p>Care that follows recovery</p>
      </div>
    </div>
  </div>
</section>

<section class="treatments">
  <div class="container">
    <span class="section-label">Our services</span>
    <h2>Specialized Treatments</h2>
    <p>
      We offer simple, evidence-based physiotherapy services for pain relief,
      movement improvement, and safe rehabilitation.
    </p>
  </div>
</section>

<section class="services">
  <div class="container">
    <div class="service-row">
      <div class="service-card">
        <div class="service-img">
          <img src="${pageContext.request.contextPath}/Images/Service-Card1.png" alt="Sports injury physiotherapy" class="service-image" width="360" height="180">
        </div>
        <div class="service-content">
          <div class="service-icon">
            <img src="${pageContext.request.contextPath}/Images/Service-Minicard1.png" alt="Sports rehab icon" width="28" height="28">
          </div>
          <h3>Sports Injury Rehab</h3>
          <p>
            Support for sprains, strains, and sports-related injuries with a
            focus on safe movement and strength rebuilding.
          </p>
          <a href="${pageContext.request.contextPath}/facilities" class="learn-more">Learn More</a>
        </div>
      </div>

      <div class="service-card">
        <div class="service-img">
          <img src="${pageContext.request.contextPath}/Images/Service-Card2.png" alt="Back and neck physiotherapy" class="service-image" width="360" height="180">
        </div>
        <div class="service-content">
          <div class="service-icon">
            <img src="${pageContext.request.contextPath}/Images/Service-Minicard2.png" alt="Pain treatment icon" width="28" height="28">
          </div>
          <h3>Back and Neck Pain</h3>
          <p>
            Guided treatment for posture, stiffness, and muscle pain using
            practical exercises and therapist support.
          </p>
          <a href="${pageContext.request.contextPath}/facilities" class="learn-more">Learn More</a>
        </div>
      </div>

      <div class="service-card">
        <div class="service-img">
          <img src="${pageContext.request.contextPath}/Images/Service-Card3.png" alt="Post surgical rehabilitation" class="service-image" width="360" height="180">
        </div>
        <div class="service-content">
          <div class="service-icon">
            <img src="${pageContext.request.contextPath}/Images/Service-Minicard3.png" alt="Recovery care icon" width="28" height="28">
          </div>
          <h3>Post-Surgical Rehab</h3>
          <p>
            Recovery care after surgery to improve range of motion, rebuild
            strength, and return to normal activities.
          </p>
          <a href="${pageContext.request.contextPath}/facilities" class="learn-more">Learn More</a>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="home-about">
  <div class="container about-wrapper">
    <div>
      <span class="section-label">Why MotionRehab</span>
      <h2>Care that is clear, organized, and patient-friendly.</h2>
      <p>
        Our system helps patients book appointments, view exercise plans, and
        stay connected with their rehabilitation journey from one simple panel.
      </p>
    </div>
    <img src="${pageContext.request.contextPath}/Images/bigpicture.png" alt="Physiotherapy clinic environment" width="520" height="260">
  </div>
</section>

<section class="cta">
  <div class="container cta-wrapper">
    <h2>Ready to start your journey to a pain-free life?</h2>
    <p>
      Schedule your initial assessment and let our team create a recovery plan
      that fits your condition and daily routine.
    </p>

    <div class="cta-buttons">
      <a href="${pageContext.request.contextPath}/login" class="cta-btn-primary">Book Your Appointment</a>
      <a href="${pageContext.request.contextPath}/contact" class="cta-btn-secondary">Contact Us</a>
    </div>
  </div>
</section>

<footer class="footer">
  <div class="container footer-top">
    <div class="footer-brand">
      <div class="footer-logo">
        <div class="logo">
          <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="MotionRehab Logo" class="logo-img" width="40" height="40">
          <span>MotionRehab</span>
        </div>
      </div>

      <p>
        Dedicated to providing physiotherapy care that helps patients move
        freely and live with less pain.
      </p>
    </div>

    <div class="footer-links">
      <h3>Quick Links</h3>
      <ul>
        <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
        <li><a href="${pageContext.request.contextPath}/facilities">Facilities</a></li>
        <li><a href="${pageContext.request.contextPath}/blog">Blog</a></li>
        <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
      </ul>
    </div>

    <div class="footer-links">
      <h3>Services</h3>
      <ul>
        <li><a href="${pageContext.request.contextPath}/facilities">Sports Injuries</a></li>
        <li><a href="${pageContext.request.contextPath}/facilities">Back and Neck Pain</a></li>
        <li><a href="${pageContext.request.contextPath}/facilities">Post-Surgery Rehab</a></li>
        <li><a href="${pageContext.request.contextPath}/facilities">Exercise Therapy</a></li>
      </ul>
    </div>

    <div class="footer-contact">
      <h3>Contact</h3>
      <p>Kirtipur, Panga</p>
      <p>9749497768</p>
      <p>Motionrehab99@gmail.com</p>
    </div>
  </div>

  <hr>

  <div class="container footer-bottom">
    <p>MotionRehab patient care system</p>
    <div class="footer-bottom-links">
      <a href="#">Privacy Policy</a>
      <a href="#">Terms of Services</a>
    </div>
  </div>
</footer>

</body>
</html>

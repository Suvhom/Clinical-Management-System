<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exercise Plans - MotionRehab</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Common_Website_Css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Navbar_website.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ExercisePlan.css">
</head>
<body>

<header class="navbar">
  <div class="container nav-wrapper">
    <div class="logo">
      <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="Motion Rehab Logo" class="logo-img">
      <span>MotionRehab</span>
    </div>

    <ul class="nav-links">
      <li><a href="${pageContext.request.contextPath}/home" class="nav-button">Home</a></li>
      <li><a href="${pageContext.request.contextPath}/facilities" class="nav-button">Facilities</a></li>
      <li><a href="${pageContext.request.contextPath}/exercise-plans" class="nav-button active">Exercise Plans</a></li>
      <li><a href="${pageContext.request.contextPath}/about" class="nav-button">About Us</a></li>
      <li><a href="${pageContext.request.contextPath}/blog" class="nav-button">Blog</a></li>
      <li><a href="${pageContext.request.contextPath}/contact" class="nav-button">Contact Us</a></li>
      <li><a href="${pageContext.request.contextPath}/login" class="login-btn">Login</a></li>
    </ul>
  </div>
</header>

<main>
  <section class="exercise-hero">
    <div class="container exercise-hero-content">
      <div class="hero-text">
        <span class="section-label">Guided Recovery Programs</span>
        <h1>Exercise Plans for Better Recovery</h1>
        <p>
          Simple guided physiotherapy exercises to support mobility, strength,
          and rehabilitation.
        </p>
        <a href="${pageContext.request.contextPath}/login" class="hero-button">Book an Appointment</a>
      </div>

      <div class="hero-panel">
        <div class="panel-card">
          <span class="panel-number">6</span>
          <p>Focused rehabilitation categories for common movement needs.</p>
        </div>
        <div class="panel-card">
          <span class="panel-number">4</span>
          <p>Simple steps from assessment to progress tracking.</p>
        </div>
      </div>
    </div>
  </section>

  <section class="exercise-section">
    <div class="container">
      <div class="section-heading">
        <span class="section-label">Exercise Categories</span>
        <h2>Plans Designed Around Your Recovery Goal</h2>
        <p>
          Each category focuses on safe movement, gradual strengthening, and
          better control during daily activities.
        </p>
      </div>

      <div class="category-grid">
        <article class="category-card">
          <div class="category-badge">01</div>
          <h3>Knee Rehabilitation</h3>
          <p>Build strength and improve knee movement after pain, weakness, or injury.</p>
          <ul>
            <li>Straight leg raises</li>
            <li>Heel slides</li>
            <li>Wall squats</li>
          </ul>
        </article>

        <article class="category-card">
          <div class="category-badge">02</div>
          <h3>Shoulder Mobility</h3>
          <p>Support shoulder movement, posture, and controlled upper-body strength.</p>
          <ul>
            <li>Pendulum swings</li>
            <li>Shoulder rolls</li>
            <li>Arm raises</li>
          </ul>
        </article>

        <article class="category-card">
          <div class="category-badge">03</div>
          <h3>Back Pain Relief</h3>
          <p>Improve spinal comfort with gentle mobility and core activation.</p>
          <ul>
            <li>Cat camel stretch</li>
            <li>Pelvic tilts</li>
            <li>Glute bridges</li>
          </ul>
        </article>

        <article class="category-card">
          <div class="category-badge">04</div>
          <h3>Balance Training</h3>
          <p>Improve stability, body control, and confidence while standing or walking.</p>
          <ul>
            <li>Single-leg stand</li>
            <li>Heel-to-toe walk</li>
            <li>Side steps</li>
          </ul>
        </article>

        <article class="category-card">
          <div class="category-badge">05</div>
          <h3>Ankle Recovery</h3>
          <p>Restore ankle movement and strength after sprain, stiffness, or weakness.</p>
          <ul>
            <li>Ankle circles</li>
            <li>Calf raises</li>
            <li>Resistance band pulls</li>
          </ul>
        </article>

        <article class="category-card">
          <div class="category-badge">06</div>
          <h3>Flexibility Routine</h3>
          <p>Maintain comfortable movement through guided stretching and mobility work.</p>
          <ul>
            <li>Hamstring stretch</li>
            <li>Calf stretch</li>
            <li>Neck stretch</li>
          </ul>
        </article>
      </div>
    </div>
  </section>

  <section class="process-section">
    <div class="container">
      <div class="section-heading">
        <span class="section-label">How It Works</span>
        <h2>Your Recovery Path at MotionRehab</h2>
      </div>

      <div class="steps-grid">
        <div class="step-card">
          <span>1</span>
          <h3>Book Appointment</h3>
          <p>Choose a suitable time to visit the clinic and begin your care plan.</p>
        </div>
        <div class="step-card">
          <span>2</span>
          <h3>Therapist Assessment</h3>
          <p>A physiotherapist checks your movement, pain level, and recovery needs.</p>
        </div>
        <div class="step-card">
          <span>3</span>
          <h3>Exercise Plan Assigned</h3>
          <p>You receive exercises selected for your condition and ability level.</p>
        </div>
        <div class="step-card">
          <span>4</span>
          <h3>Follow and Track Progress</h3>
          <p>Follow the plan regularly and review progress during follow-up visits.</p>
        </div>
      </div>
    </div>
  </section>

  <section class="safety-section">
    <div class="container">
      <div class="safety-box">
        <h2>Safety Note</h2>
        <p>
          These exercises are for general rehabilitation guidance. Please consult
          a physiotherapist before starting any exercise plan, especially after
          injury, surgery, or severe pain.
        </p>
      </div>
    </div>
  </section>
</main>

<footer class="footer">
  <div class="container footer-top">
    <div class="footer-brand">
      <div class="footer-logo">
        <div class="logo">
          <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="Motion Rehab Logo" class="logo-img">
          <span>MotionRehab</span>
        </div>
      </div>
      <p>
        Dedicated to providing physiotherapy care that helps patients move
        freely, recover safely, and return to daily life with confidence.
      </p>
      <div class="social-icons">
        <a href="#">f</a>
        <a href="#">in</a>
        <a href="#">t</a>
      </div>
    </div>

    <div class="footer-links">
      <h3>Quick Links</h3>
      <ul>
        <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
        <li><a href="${pageContext.request.contextPath}/facilities">Facilities</a></li>
        <li><a href="${pageContext.request.contextPath}/blog">Blog</a></li>
        <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
      </ul>
    </div>

    <div class="footer-links">
      <h3>Services</h3>
      <ul>
        <li><a href="${pageContext.request.contextPath}/exercise-plans">Exercise Plans</a></li>
        <li><a href="${pageContext.request.contextPath}/facilities">Sports Injuries</a></li>
        <li><a href="${pageContext.request.contextPath}/facilities">Back and Neck Pain</a></li>
        <li><a href="${pageContext.request.contextPath}/facilities">Post-Surgery Rehab</a></li>
      </ul>
    </div>

    <div class="footer-contact">
      <h3>Contact</h3>
      <p>Kirtipur, Pangga</p>
      <p>9749497768</p>
      <p>Motionrehab99@gmail.com</p>
    </div>
  </div>

  <hr>

  <div class="container footer-bottom">
    <p>MotionRehab Physiotherapy Clinic</p>
    <div class="footer-bottom-links">
      <a href="#">Privacy Policy</a>
      <a href="#">Terms of Services</a>
    </div>
  </div>
</footer>

</body>
</html>

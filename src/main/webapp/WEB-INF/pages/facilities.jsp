<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facilities</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Common_Website_Css.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Navbar_website.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/facilities.css?v=2">
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

<section class="search-section">
   <form action="${pageContext.request.contextPath}/facilities/search" method="get">
    <input type="text" name="keyword" placeholder="Search facilities..." class="search-bar">
    <button type="submit" class="book-btn">Search</button>
</form>
</section>

    <main class="main-wrapper">
        <section class="facilities-grid">
            <div class="text-content">
                <h2 class="section-title">Facilities</h2>
                <div class="accent-line"></div>
                
                <div id="searchResults" class="search-results">
				    ${searchResults}
				</div>

                <div class="facility-row"  id="facility-1">
                    <div class="icon-circle">
                    <img src="${pageContext.request.contextPath}/Images/man.png" alt="Patient facilities" />
                    </div>
                    <div class="description">
                        <h3>In and Out Patient Facilities</h3>
                        <p>We provide both inpatient and outpatient facilities with doctors and nursing care. For Out patients, the hospital is open from 6:00 am to 7:00 pm.</p>
                    </div>
                </div>

                <div class="facility-row pill-bg reverse" id="facility-2">
                    <div class="icon-circle"><img src="${pageContext.request.contextPath}/Images/bed.png" alt="Room facilities"></div>
                    <div class="description">
                        <h3>Comfortable Room Facilities</h3>
                        <p>We provide clean and comfortable rooms, including general beds, cabins, and deluxe rooms with attached bathrooms for patient care.</p>
                    </div>
                </div>

                <div class="facility-row"  id="facility-3">
                    <div class="icon-circle"><img src="${pageContext.request.contextPath}/Images/doc.png" alt="Medical equipment"></div>
                    <div class="description">
                        <h3>Best Equipment</h3>
                        <p>We have a range of high tech equipment at our disposal for Physiotherapy & Naturopathy along with different Diagnostic equipment like X-ray, Ultrasound, Pathology Lab etc.</p>
                    </div>
                </div>

                <div class="facility-row pill-bg reverse"  id="facility-4">
                    <div class="icon-circle"><img src="${pageContext.request.contextPath}/Images/building.png" alt="Clinic infrastructure"></div>
                    <div class="description">
                        <h3>Best Infrastructure</h3>
                        <p>Our Infrastructure includes spacious yoga, aerobics and exercise hall, ambulance facility, healthy and clean canteens, pharmacy, natural green environment, spacious parking etc.</p>
                    </div>
                </div>

                <div class="facility-row" id="facility-5">
                    <div class="icon-circle"><img src="${pageContext.request.contextPath}/Images/clock.png" alt="Treatment schedule"></div>
                    <div class="description">
                        <h3>IPD and Treatment Facilities</h3>
                        <p>We facilitate deluxe, totally hygienic and clean IPD on an appointment basis. We also provide separate treatment facilities for male and female.</p>
                    </div>
                </div>

                <div class="facility-row pill-bg reverse"  id="facility-6">
                    <div class="icon-circle"><img src="${pageContext.request.contextPath}/Images/house.png" alt="Home treatment"></div>
                    <div class="description">
                        <h3>Home-Based Treatments</h3>
                        <p>We also provide home based physiotherapy and rehabilitation facilities ensuring you and your family members are taken care of within the comfort of your home.</p>
                    </div>
                </div>

                <div class="facility-row"  id="facility-7">
                    <div class="icon-circle"><img src="${pageContext.request.contextPath}/Images/pill.png" alt="Pharmacy"></div>
                    <div class="description">
                        <h3>Pharmacy</h3>
                        <p>At MotionRehab, we have an in-house pharmacy, ensuring convenient access to medications for our patients without having to leave the premises.</p>
                    </div>
                </div>

                <div class="facility-row pill-bg reverse"  id="facility-8">
                    <div class="icon-circle"><img src="${pageContext.request.contextPath}/Images/bag.png" alt="Health packages"></div>
                    <div class="description">
                        <h3>Health Packages</h3>
                        <p>Our health packages are designed for comprehensive care, including necessary tests, consultations, and personalized follow-ups to maintain your health.</p>
                    </div>
                </div>
            </div>

            <div class="image-content">
                <div class="hero-mask">
                    <img src="${pageContext.request.contextPath}/Images/bigpicture.png" alt="MotionRehab facility">
                </div>
            </div>
        </section>
    </main>
    

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

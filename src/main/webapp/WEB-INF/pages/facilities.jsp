<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facilities</title>
 <link href="<%= request.getContextPath() %>/CSS/facilities.css" rel="stylesheet">
</head>
<body>
          
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
</header>

<section class="search-section">
    <form action="<%= request.getContextPath() %>/FacilitiesServlet" method="get">
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

                <div class="facility-row">
                    <div class="icon-circle"><img src="../images/java_blog.jpg" alt=""></div>
                    <div class="description">
                        <h3>In and Out Patient Facilities</h3>
                        <p>We provide both inpatient and outpatient facilities with doctors and nursing care. For Out patients, the hospital is open from 6:00 am to 7:00 pm.</p>
                    </div>
                </div>

                <div class="facility-row pill-bg reverse">
                    <div class="icon-circle"><img src="../images/java_blog2.jpg" alt="icon"></div>
                    <div class="description">
                        <h3>Choices of Rooms</h3>
                        <p>We provide a range of room choices from general bed, cabins to deluxe room with attached bathroom. In total we have over 60 beds.</p>
                    </div>
                </div>

                <div class="facility-row">
                    <div class="icon-circle"><img src="../images/java_blog3.jpg" alt="icon"></div>
                    <div class="description">
                        <h3>Best Equipment</h3>
                        <p>We have a range of high tech equipment at our disposal for Physiotherapy & Naturopathy along with different Diagnostic equipment like X-ray, Ultrasound, Pathology Lab etc.</p>
                    </div>
                </div>

                <div class="facility-row pill-bg reverse">
                    <div class="icon-circle"><img src="../images/java_blog4.jpg" alt="icon"></div>
                    <div class="description">
                        <h3>Best Infrastructure</h3>
                        <p>Our Infrastructure includes spacious yoga, aerobics and exercise hall, ambulance facility, healthy and clean canteens, pharmacy, natural green environment, spacious parking etc.</p>
                    </div>
                </div>

                <div class="facility-row">
                    <div class="icon-circle"><img src="../images/java_blog5.jpg" alt="icon"></div>
                    <div class="description">
                        <h3>IPD and Treatment Facilities</h3>
                        <p>We facilitate deluxe, totally hygienic and clean IPD on an appointment basis. We also provide separate treatment facilities for male and female.</p>
                    </div>
                </div>

                <div class="facility-row pill-bg reverse">
                    <div class="icon-circle"><img src="../images/java_blog6.jpg" alt="icon"></div>
                    <div class="description">
                        <h3>Home-Based Treatments</h3>
                        <p>We also provide home based physiotherapy and rehabilitation facilities ensuring you and your family members are taken care of within the comfort of your home.</p>
                    </div>
                </div>

                <div class="facility-row">
                    <div class="icon-circle"><img src="../images/java_blog2.jpg" alt="icon"></div>
                    <div class="description">
                        <h3>Pharmacy</h3>
                        <p>At MotionRehab, we have an in-house pharmacy, ensuring convenient access to medications for our patients without having to leave the premises.</p>
                    </div>
                </div>

                <div class="facility-row pill-bg reverse">
                    <div class="icon-circle"><img src="../images/java_blog.jpg" alt="icon"></div>
                    <div class="description">
                        <h3>Health Packages</h3>
                        <p>Our health packages are designed for comprehensive care, including necessary tests, consultations, and personalized follow-ups to maintain your health.</p>
                    </div>
                </div>
            </div>

            <div class="image-content">
                <div class="hero-mask">
                    <img src="../images/java_blog.jpg" alt="Building Placeholder">
                </div>
            </div>
        </section>
    </main>
    <footer class="site-footer">
        <div class="footer-inner">
            <div class="f-col">
                <div class="logo"><img src="../images/Logo.png" alt="logo"> MotionRehab</div>
                <p>MotionRehab is the pioneer and the best center for Physiotherapy, Rehabilitation, Ayurvedic, natural and holistic medicine. With integrated and multidisciplinary approach, we have incorporated the best fields of medicine to provide the best health care and rehabilitation without adverse effects.</p>
            </div>
            <div class="f-col">
                <h4>Contact Us</h4>
                <p>hello@motionrehab.com</p>
                <p>+1-800-567-2123<br>+1-800-537-0823</p>
                <p>123 Wellness Avenue, Health City, State, 12345</p>
            </div>
            </div>
    </footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facilities</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/facilities.css">
</head>
<body>
    <header class="navbar">
        <div class="nav-container">
            <div class="logo">
                <img src="../images/Logo.png" alt="logo"> 
                <strong>MotionRehab</strong>
            </div>
            <nav>
                <a href="#">Home</a>
                <a href="#">About Us</a>
                <a href="#" class="active">Facilities</a>
                <a href="#">Contact</a>
            </nav>
            <button class="call-btn">
                <img src="../images/call.png" alt=""> Call Now +1 800 567 2123
            </button>
        </div>
    </header>

    <main class="main-wrapper">
        <section class="facilities-grid">
            <div class="text-content">
                <h2 class="section-title">Facilities</h2>
                <div class="accent-line"></div>

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
  <footer class="footer">
    <div class="footer-container">

        <!-- Brand Section -->
        <div class="footer-brand">
            <div class="footer-logo">
                <img src="../images/Logo.png" alt="MotionRehab Logo">
                <span>MotionRehab</span>
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
                <li><a href="#">Back &amp; Neck Pain</a></li>
                <li><a href="#">Post-Surgery Rehab</a></li>
                <li><a href="#">Acupuncture</a></li>
            </ul>
        </div>

        <!-- Contact -->
        <div class="footer-contact">
            <h3>Contact</h3>

            <p>
                <span class="contact-icon">⌾</span>
                <span>Kirtipur, Panga</span>
            </p>

            <p>
                <span class="contact-icon">☏</span>
                <span>9749497768</span>
            </p>

            <p>
                <span class="contact-icon">M</span>
                <span>Motionrehab99@gmail.com</span>
            </p>
        </div>

    </div>

    <div class="footer-bottom">
        <a href="#">Privacy Policy</a>
        <a href="#">Terms of Services</a>
    </div>
</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Staff Member - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/AddPatient.css">
</head>

<body>

    <main class="layout">

        <!-- Sidebar -->
        <div class="sidebar">

            <div class="brand">
                <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="MotionRehab Logo">
                <span>MotionRehab</span>
            </div>

            <nav class="nav-menu">
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/appointments">Appointments</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
                <a class="nav-item active" href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
            </nav>

            <div class="nav-bottom">
                <a class="nav-item" href="#">Settings</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/logout">Log out</a>
            </div>

        </div>

        <!-- Main Page Area -->
        <section class="page">

            <!-- Topbar -->
            <header class="topbar">

                <h1>Add Staff Member</h1>
                <div class="top-actions">
                    <button class="icon" type="button">!</button>

                    <div class="profile">
                        <div>
                            <strong>Dr. Suvhom K.C</strong>
                            <span>Clinic Administrator</span>
                        </div>
                        <img class="profile-avatar" src="${pageContext.request.contextPath}/Images/Admin_Profile.png" alt="Admin profile" width="48" height="48">
                    </div>

                </div>
            </header>

            <!-- Content -->
            <div class="content">

                <!-- Breadcrumb -->
                <div class="breadcrumb">
                    <a href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
                    <span>›</span>
                    <p>Add Staff Member</p>
                </div>

                <c:if test="${not empty errorMessage}">
                    <p class="error-message">
                        ${errorMessage}
                    </p>
                </c:if>

                <!-- Form Card -->
                <div class="form-card">

                    <form action="${pageContext.request.contextPath}/admin/add-staff" method="post">

                        <section class="form-section">

                            <h2>Professional Profile & Availability</h2>

                            <div class="form-grid">

                                <div class="input-group">
                                    <label for="staffName">Staff / Doctor Name</label>
                                    <input type="text" id="staffName" name="staffName" placeholder="e.g. Dr. Sarah Connor" required>
                                </div>

                                <div class="input-group">
                                    <label for="specialization">Specialization</label>
                                    <select id="specialization" name="specialization" required>
                                        <option value="">Choose Specialization...</option>
                                        <option value="General Physiotherapy">General Physiotherapy</option>
                                        <option value="Sports Injury Rehab">Sports Injury Rehab</option>
                                        <option value="Back and Neck Pain">Back and Neck Pain</option>
                                        <option value="Post-Surgical Rehab">Post-Surgical Rehab</option>
                                        <option value="Manual Therapy">Manual Therapy</option>
                                        <option value="Neurological Rehab">Neurological Rehab</option>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <label for="qualification">Qualifications</label>
                                    <input type="text" id="qualification" name="qualification" placeholder="e.g. BPT, MPT (Sports)" required>
                                </div>

                                <div class="input-group">
                                    <label for="experience">Years of Experience</label>
                                    <input type="number" id="experience" name="experience" placeholder="e.g. 5" min="0" required>
                                </div>

                                <div class="input-group">
                                    <label for="email">Email Address</label>
                                    <input type="email" id="email" name="email" placeholder="e.g. sarah@motionrehab.com" required>
                                </div>

                                <div class="input-group">
                                    <label for="phone">Phone Number</label>
                                    <input type="text" id="phone" name="phone" placeholder="e.g. +1 (555) 0188" required>
                                </div>

                                <div class="input-group">
                                    <label for="gender">Gender</label>
                                    <select id="gender" name="gender" required>
                                        <option value="">Select Gender...</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <label for="status">Initial Working Status</label>
                                    <select id="status" name="status" required>
                                        <option value="Active">Active</option>
                                        <option value="Busy">Busy</option>
                                        <option value="On Leave">On Leave</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>

                                <div class="input-group full">
                                    <label for="address">Residential Address</label>
                                    <input type="text" id="address" name="address" placeholder="e.g. 456 Clinical Way, Boston MA" required>
                                </div>

                            </div>

                        </section>

                        <!-- Buttons -->
                        <div class="form-actions">

                            <a href="${pageContext.request.contextPath}/admin/staff" class="cancel-btn">
                                Cancel
                            </a>

                            <button type="submit" class="save-btn" style="background: #1677d8; border-color: #1677d8;">
                                Save Staff Member
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </section>

    </main>

</body>

</html>

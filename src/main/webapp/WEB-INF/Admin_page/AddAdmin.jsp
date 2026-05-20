<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Admin - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminDirectory.css">
</head>

<body>

    <main class="layout">

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
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
                <a class="nav-item active" href="${pageContext.request.contextPath}/admin/admins">Admin Directory</a>
            </nav>

            <div class="nav-bottom">
                <a class="nav-item" href="#">Settings</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/logout">Log out</a>
            </div>

        </div>

        <section class="page">

            <header class="topbar">
                <h1>Add Admin</h1>

                <div class="top-actions">
                    <div class="profile">
                        <div>
                            <strong>Clinic Administrator</strong>
                        </div>
                        <img class="profile-avatar" src="${pageContext.request.contextPath}/Images/Admin_Profile.png" alt="Admin profile" width="48" height="48">
                    </div>
                </div>
            </header>

            <section class="content">

                <div class="breadcrumb">
                    <a href="${pageContext.request.contextPath}/admin/admins">Admin Directory</a>
                    <span>&gt;</span>
                    <p>Add Admin</p>
                </div>

                <c:if test="${param.error == '1'}">
                    <p class="error-message">Admin could not be saved.</p>
                </c:if>

                <div class="form-card">
                    <form action="${pageContext.request.contextPath}/admin/add-admin" method="post" autocomplete="off">

                        <section class="form-section">
                            <h2>Admin Account Details</h2>

                            <div class="form-grid">
                                <div class="input-group">
                                    <label for="username">Username</label>
                                    <input type="text" id="username" name="username" autocomplete="off" required>
                                </div>

                                <div class="input-group">
                                    <label for="password">Password</label>
                                    <input type="password" id="password" name="password" autocomplete="new-password" required>
                                </div>

                                <div class="input-group">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" id="fullName" name="fullName" autocomplete="off" required>
                                </div>

                                <div class="input-group">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" name="email" autocomplete="off" required>
                                </div>

                                <div class="input-group">
                                    <label for="phone">Phone</label>
                                    <input type="text" id="phone" name="phone" autocomplete="off" required>
                                </div>

                                <div class="input-group full">
                                    <label for="address">Address</label>
                                    <input type="text" id="address" name="address" autocomplete="off" required>
                                </div>
                            </div>
                        </section>

                        <div class="form-actions">
                            <a class="cancel-btn" href="${pageContext.request.contextPath}/admin/admins">Cancel</a>
                            <button class="save-btn" type="submit">Save Admin</button>
                        </div>

                    </form>
                </div>

            </section>

        </section>

    </main>

</body>

</html>

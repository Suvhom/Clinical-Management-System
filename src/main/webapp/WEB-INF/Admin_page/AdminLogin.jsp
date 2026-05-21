<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>Admin Login | MotionRehab</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/AdminLogin.css">
</head>
<body>

<div class="admin-login-page">
    <div class="admin-login-card">
        <div class="admin-login-info">
            <h1>Manage care, support every patient.</h1>
            <p>Sign in as admin to manage patient records, appointments, staff, billing, and reports.</p>
        </div>

        <div class="admin-login-form">
            <div class="form-wrapper">
                <h2>Admin Login</h2>
                <p class="subtitle">Sign in to your MotionRehab admin account.</p>

                <p class="error-message">${errorMessage}</p>

                <form action="${pageContext.request.contextPath}/admin/login" method="post" autocomplete="off">
                    <div class="input-group">
                        <label for="adminAccessInput">Email or Username</label>
                        <input type="text"
                               id="adminAccessInput"
                               name="adminAccessInput"
                               autocomplete="new-password"
                               autocapitalize="none"
                               spellcheck="false"
                               placeholder="Enter your email or username"
                               required>
                    </div>

                    <div class="input-group">
                        <label for="adminSecretInput">Password</label>
                        <input type="password"
                               id="adminSecretInput"
                               name="adminSecretInput"
                               autocomplete="new-password"
                               placeholder="Enter your password"
                               required>
                    </div>

                    <button type="submit" class="submit-btn">Sign in</button>
                </form>

                <p class="footer-text">
                    Not an admin?
                    <a href="${pageContext.request.contextPath}/login">Patient login</a>
                </p>
            </div>
        </div>
    </div>
</div>

<script>
    function clearAdminLoginFields() {
        const usernameField = document.getElementById("adminAccessInput");
        const passwordField = document.getElementById("adminSecretInput");

        if (usernameField) {
            usernameField.value = "";
        }

        if (passwordField) {
            passwordField.value = "";
        }
    }

    window.addEventListener("pageshow", clearAdminLoginFields);
    document.addEventListener("DOMContentLoaded", function () {
        clearAdminLoginFields();
        setTimeout(clearAdminLoginFields, 100);
        setTimeout(clearAdminLoginFields, 500);
    });
</script>
</body>
</html>

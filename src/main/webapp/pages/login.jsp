<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/login.css">
</head>
<body>
<div class="login-container">
    <div class="banner-section">
        <h1>Stay connected with your care team.</h1>
        <p>
            Sign in to book appointments and Many More...
        </p>
    </div>
    <div class="form-section">
        <div class="form-wrapper">
            <h2>Welcome back</h2>
            <p class="subtitle">Sign in to your MotionRehab patient account</p>
            <p class="error-message">${errorMessage}</p>
            <form action="${pageContext.request.contextPath}/login" method="post" autocomplete="off">
                <div class="input-group">
                    <label for="patientAccessInput">Username or email</label>
                    <input type="text" id="patientAccessInput" name="patientAccessInput"
                           autocomplete="off" autocapitalize="none" spellcheck="false"
                           placeholder="Enter your username or email" required>
                </div>
                <div class="input-group">
                    <label for="patientSecretInput">Password</label>
                    <input type="password" id="patientSecretInput" name="patientSecretInput"
                           autocomplete="new-password" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="submit-btn">Sign in</button>
            </form>
            <p class="footer-text">
                New patient?
                <a href="${pageContext.request.contextPath}/register">Create an account</a>
            </p>

            <p class="footer-text admin-login-link">
                Login for admin?
                <a href="${pageContext.request.contextPath}/admin/login">Admin login</a>
            </p>
        </div>
    </div>
</div>
<script>
    function clearLoginFields() {
        const usernameField = document.getElementById("patientAccessInput");
        const passwordField = document.getElementById("patientSecretInput");

        if (usernameField) {
            usernameField.value = "";
        }

        if (passwordField) {
            passwordField.value = "";
        }
    }

    window.addEventListener("pageshow", clearLoginFields);
    document.addEventListener("DOMContentLoaded", function () {
        clearLoginFields();
        setTimeout(clearLoginFields, 100);
        setTimeout(clearLoginFields, 500);
    });
</script>
</body>
</html>

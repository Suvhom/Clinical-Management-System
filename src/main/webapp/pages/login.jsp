<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
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
            <form action="${pageContext.request.contextPath}/login" method="post">
                <input type="hidden" name="role" value="patient">
                <div class="input-group">
                    <label for="email">Email address</label>
                    <input type="email" id="email" name="email"
                           placeholder="Enter your email" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password"
                           placeholder="Enter your password" required>
                </div>
                <button type="submit" class="submit-btn">Sign in</button>
            </form>
            <p class="footer-text">
                New patient?
                <a href="${pageContext.request.contextPath}/pages/register.jsp">Create an account</a>
            </p>
            <p class="footer-text">
                Are you an admin?
                <a href="${pageContext.request.contextPath}/Admin_page/AdminLogin.jsp">Sign in here</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>
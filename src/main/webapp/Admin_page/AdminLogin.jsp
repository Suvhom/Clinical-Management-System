<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

<div class="login-container">

    <div class="banner-section">
        <h1>Manage care, support every patient.</h1>
        <p>
            Sign in as admin to manage patient records, schedule workflows,
            and oversee the MotionRehab portal securely.
        </p>
    </div>

    <div class="form-section">
        <div class="form-wrapper">
            <h2>Admin Login</h2>
            <p class="subtitle">Sign in to MotionRehab admin account</p>

            <form action="${pageContext.request.contextPath}/login" method="post">
                <input type="hidden" name="role" value="admin">

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

                <button type="submit" class="submit-btn">Sign in to portal</button>
            </form>

            <p class="footer-text">
                Not an admin?
                <a href="${pageContext.request.contextPath}/pages/login.jsp">Patient login</a>
            </p>
        </div>
    </div>

</div>

</body>
</html>
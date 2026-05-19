<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/registers.css">
</head>
<body>

<div class="register-container">

    <div class="left-panel">
        <h1>Create your patient account.</h1>
        <p>
            Register to start tracking exercises, monitor therapy progress,
            and stay connected with your clinical care team.
        </p>
    </div>

    <div class="right-panel">
        <div class="form-box">
            <h2>Get started</h2>
            <p class="subtitle">Create your MotionRehab patient account</p>

            <% if (request.getAttribute("errorMessage") != null) { %>
                <p class="alert error"><%= request.getAttribute("errorMessage") %></p>
            <% } %>

            <form id="registerForm"
                  action="${pageContext.request.contextPath}/register"
                  method="post">

                <div class="form-group">
                    <label for="fullName">Full name</label>
                    <input type="text" id="fullName" name="fullName"
                           placeholder="Enter your full name" required>
                </div>

                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" id="email" name="email"
                           placeholder="Enter your email" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password"
                           placeholder="Create a password" required>
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Confirm password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword"
                           placeholder="Confirm your password" required>
                </div>
                <div class="form-group">
                        <label>Profile Picture</label>
                        <input type="file" name="image" accept="image/*" required>
                    </div>

                <button type="submit" class="create-btn">Create account</button>
            </form>

            <div class="divider">
                <span>or continue with</span>
            </div>
            
            <button class="google-btn" type="button">
                <img src="https://www.svgrepo.com/show/355037/google.svg" alt="Google Logo">
                Sign up with Google
            </button>

            <p class="login-text">
                Already have an account?
                <a href="${pageContext.request.contextPath}/pages/login.jsp">Back to login</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>

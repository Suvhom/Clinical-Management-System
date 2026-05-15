<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="login-container">
        <div class="banner-section">
            <h1 id="banner-title">Manage care, support every patient.</h1>
            <p id="banner-description">
                Sign in as admin to manage patient records, schedule workflows, and oversee the MotionRehab portal securely.
            </p>
        </div>

        <div class="form-section">
            <div class="form-wrapper">
                <h2>Welcome back</h2>
                <p class="subtitle" id="form-subtitle">Sign in to your MotionRehab admin account</p>

                <div class="toggle-container">
                    <button type="button" id="patient-btn" onclick="toggleRole('patient')">Patient</button>
                    <button type="button" id="admin-btn" class="active" onclick="toggleRole('admin')">Admin</button>
                </div>

                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p class="alert error"><%= request.getAttribute("errorMessage") %></p>
                <% } %>

                <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
                    <input type="hidden" id="role" name="role" value="admin">
                    <div class="input-group">
                        <label for="email">Email address</label>
                        <input type="email" id="email" name="email" placeholder="Enter your email" required>
                    </div>

                    <div class="input-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter your password" required>
                    </div>

                    <div class="form-options">
                        <label class="remember-me">
                            <input type="checkbox"> Remember me
                        </label>
                        <a href="#" class="forgot-link">Forgot password?</a>
                    </div>

                    <button type="submit" class="submit-btn">Sign in to portal</button>
                </form>

                <div class="divider">
                    <span>or continue with</span>
                </div>

                <button class="google-btn" type="button">
                    <img src="https://www.svgrepo.com/show/355037/google.svg" alt="Google Logo">
                    Sign in with Google
                </button>

                <p class="footer-text">
                    New patient? <a href="${pageContext.request.contextPath}/pages/register.jsp">Create an account</a>
                </p>
            </div>
        </div>
    </div>

    <script>
        function toggleRole(role) {
            var isPatient = role === 'patient';
            document.getElementById('patient-btn').classList.toggle('active', isPatient);
            document.getElementById('admin-btn').classList.toggle('active', !isPatient);
            document.getElementById('banner-title').textContent = isPatient
                ? 'Stay connected with your care team.'
                : 'Manage care, support every patient.';
            document.getElementById('banner-description').textContent = isPatient
                ? 'Sign in to book appointments, track therapy progress, and manage your MotionRehab care securely.'
                : 'Sign in as admin to manage patient records, schedule workflows, and oversee the MotionRehab portal securely.';
            document.getElementById('form-subtitle').textContent = isPatient
                ? 'Sign in to your MotionRehab patient account'
                : 'Sign in to your MotionRehab admin account';
            document.getElementById('role').value = role;
        }
    </script>
</body>
</html>

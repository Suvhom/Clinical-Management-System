<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>

<body>

    <main class="login-container">

        <!-- Left Banner Section -->
        <section class="banner-section">

            <div class="banner-content">
                <h1 id="banner-title">Manage care, support every patient.</h1>

                <p id="banner-description">
                    Sign in as an admin to manage patient records, schedule appointments,
                    and oversee the MotionRehab portal securely.
                </p>
            </div>

        </section>

        <!-- Login Form Section -->
        <section class="form-section">

            <div class="form-wrapper">

                <h2>Welcome back</h2>

                <p class="subtitle" id="form-subtitle">
                    Sign in to your MotionRehab admin account
                </p>

                <!-- Role Toggle -->
                <div class="toggle-container">
                    <button type="button" id="patient-btn" onclick="toggleRole('patient')">
                        Patient
                    </button>

                    <button type="button" id="admin-btn" class="active" onclick="toggleRole('admin')">
                        Admin
                    </button>
                </div>

                <!-- Error Message -->
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p class="alert error">
                        <%= request.getAttribute("errorMessage") %>
                    </p>
                <% } %>

                <!-- Login Form -->
                <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">

                    <input type="hidden" id="role" name="role" value="admin">

                    <div class="input-group">
                        <label for="email">Email Address</label>
                        <input 
                            type="email" 
                            id="email" 
                            name="email" 
                            placeholder="Enter your email address" 
                            autocomplete="email"
                            required>
                    </div>

                    <div class="input-group">
                        <label for="password">Password</label>
                        <input 
                            type="password" 
                            id="password" 
                            name="password" 
                            placeholder="Enter your password" 
                            autocomplete="current-password"
                            required>
                    </div>

                    <div class="form-options">

                        <label class="remember-me">
                            <input type="checkbox" name="rememberMe">
                            Remember me
                        </label>

                        <a href="#" class="forgot-link">Forgot password?</a>

                    </div>

                    <button type="submit" class="submit-btn">
                        Sign in to portal
                    </button>

                </form>

                <!-- Divider -->
                <div class="divider">
                    <span>or continue with</span>
                </div>

                <!-- Google Button -->
                <button class="google-btn" type="button">
                    <img 
                        src="https://www.svgrepo.com/show/355037/google.svg" 
                        alt="Google logo">
                    Sign in with Google
                </button>

                <!-- Register Link -->
                <p class="footer-text">
                    New patient?
                    <a href="${pageContext.request.contextPath}/pages/register.jsp">
                        Create an account
                    </a>
                </p>

            </div>

        </section>

    </main>

    <script>
        function toggleRole(role) {
            var isPatient = role === "patient";

            document.getElementById("patient-btn").classList.toggle("active", isPatient);
            document.getElementById("admin-btn").classList.toggle("active", !isPatient);

            document.getElementById("banner-title").textContent = isPatient
                ? "Stay connected with your care team."
                : "Manage care, support every patient.";

            document.getElementById("banner-description").textContent = isPatient
                ? "Sign in to book appointments, track therapy progress, and manage your MotionRehab care securely."
                : "Sign in as an admin to manage patient records, schedule appointments, and oversee the MotionRehab portal securely.";

            document.getElementById("form-subtitle").textContent = isPatient
                ? "Sign in to your MotionRehab patient account"
                : "Sign in to your MotionRehab admin account";

            document.getElementById("role").value = role;
        }
    </script>

</body>

</html>
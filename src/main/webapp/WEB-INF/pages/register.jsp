<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registers.css">
</head>
<body>

<div class="register-container">

    <div class="left-panel">
        <h1>Create your patient account.</h1>
        <p>
            Register to start tracking exercises, book appointments,
            and stay connected with us.
        </p>
    </div>

    <div class="right-panel">
        <div class="form-box">
            <h2>Get started</h2>
            <p class="subtitle">Create your MotionRehab patient account</p>

            <form action="${pageContext.request.contextPath}/register"
                  method="post"
                  enctype="multipart/form-data">

                <div class="form-row">
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
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="phone">Phone number</label>
                        <input type="tel" id="phone" name="phone"
                               placeholder="Enter your phone number">
                    </div>

                    <div class="form-group">
                        <label for="dateOfBirth">Date of birth</label>
                        <input type="date" id="dateOfBirth" name="dateOfBirth">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <select id="gender" name="gender">
                            <option value="" disabled selected>Select gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" id="address" name="address"
                               placeholder="Enter your address">
                    </div>
                </div>

                <div class="form-row">
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
                </div>

                <div class="form-group">
                    <label for="image">Profile Picture</label>
                    <input type="file" id="image" name="image" accept="image/*">
                </div>

                <button type="submit" class="create-btn">Create account</button>
            </form>

            <p class="login-text">
                Already have an account?
                <a href="${pageContext.request.contextPath}/pages/login.jsp">Back to login</a>
            </p>
        </div>
    </div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ page isELIgnored="false" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/UpdateProfile.css">
</head>
<body>

<div class="profile-container">

    ${imgTag}
    ${nameTag}
    ${usernameTag}
    ${successMsg}
    ${errorMsg}

    <!-- Update Profile Picture Form -->
    <p class="section-title">Update Profile Picture</p>
    <form action="<%= request.getContextPath() %>/UpdateProfile" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="type" value="image">
        <div class="input-group">
            <label for="image">Choose new image</label>
            <input type="file" id="image" name="image" accept="image/*" required>
        </div>
        <button type="submit" class="submit-btn">Update Picture</button>
    </form>

    <!-- Update Password Form -->
    <p class="section-title">Update Password</p>
    <form action="<%= request.getContextPath() %>/UpdateProfile" method="POST">
        <input type="hidden" name="type" value="password">
        <div class="input-group">
            <label for="currentPassword">Current Password</label>
            <input type="password" id="currentPassword" name="currentPassword"
                   placeholder="Enter your current password" required>
        </div>
        <div class="input-group">
            <label for="newPassword">New Password</label>
            <input type="password" id="newPassword" name="newPassword"
                   placeholder="Enter your new password" required>
        </div>
        <div class="input-group">
            <label for="confirmPassword">Confirm New Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword"
                   placeholder="Re-enter your new password" required>
        </div>
        <button type="submit" class="submit-btn">Update Password</button>
    </form>

    <!-- Logout -->
    <a href="<%= request.getContextPath() %>/logout" class="logout-btn">Logout</a>

</div>

</body>
</html>
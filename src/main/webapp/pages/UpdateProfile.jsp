<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.PatientModel" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/UpdateProfile.css">
</head>

<body>

<%
   
    PatientModel patient = (PatientModel) session.getAttribute("patient");
    if (patient == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
%>

<div class="profile-container">
    <% if (patient.getImage() != null && !patient.getImage().isEmpty()) { %>
        <img
            class="profile-img"
            src="data:image/*;base64,<%= patient.getImage() %>"
            alt="Profile Picture"
        >
    <% } else { %>
        <div class="profile-img-placeholder">?</div>
    <% } %>

    <!-- Patient name and username -->
    <h2><%= patient.getPatientName() %></h2>
    <p class="username-label"><%= patient.getUsername() %></p>


    <!-- ===== Success / Error Messages ===== -->
    <% if (request.getAttribute("success") != null) { %>
        <p class="success"><%= request.getAttribute("success") %></p>
    <% } %>

    <% if (request.getAttribute("error") != null) { %>
        <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>


    <!-- ===== Update Profile Picture Form ===== -->
    <p class="section-title">Update Profile Picture</p>

    <form
        action="${pageContext.request.contextPath}/update"
        method="POST"
        enctype="multipart/form-data"
    >
        <input type="hidden" name="type" value="image">

        <div class="input-group">
            <label for="image">Choose new image</label>
            <input
                type="file"
                id="image"
                name="image"
                accept="image/*"
                required
            >
        </div>

        <button type="submit" class="submit-btn">Update Picture</button>
    </form>


    <!-- ===== Update Password Form ===== -->
    <p class="section-title">Update Password</p>

    <form
        action="${pageContext.request.contextPath}/update"
        method="POST"
    >
        <input type="hidden" name="type" value="password">

        <div class="input-group">
            <label for="currentPassword">Current Password</label>
            <input
                type="password"
                id="currentPassword"
                name="currentPassword"
                placeholder="Enter your current password"
                required
            >
        </div>

        <div class="input-group">
            <label for="newPassword">New Password</label>
            <input
                type="password"
                id="newPassword"
                name="newPassword"
                placeholder="Enter your new password"
                required
            >
        </div>

        <div class="input-group">
            <label for="confirmPassword">Confirm New Password</label>
            <input
                type="password"
                id="confirmPassword"
                name="confirmPassword"
                placeholder="Re-enter your new password"
                required
            >
        </div>

        <button type="submit" class="submit-btn">Update Password</button>
    </form>


    <!-- ===== Logout ===== -->
    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">
        Logout
    </a>

</div>

</body>
</html>
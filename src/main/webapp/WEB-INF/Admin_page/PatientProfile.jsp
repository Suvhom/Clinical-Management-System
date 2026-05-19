<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.AddPatientModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Patients - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/PatientProfile.css">
</head>

<body>

<main class="layout">

    <div class="sidebar">

        <div class="brand">
            <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="MotionRehab Logo">
            <span>MotionRehab</span>
        </div>

        <nav class="nav-menu">
            <a class="nav-item" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
            <a class="nav-item" href="${pageContext.request.contextPath}/admin/appointments">Appointments</a>
            <a class="nav-item active" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
            <a class="nav-item" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
            <a class="nav-item" href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
        </nav>

        <div class="nav-bottom">
            <a class="nav-item" href="#">Settings</a>
            <a class="nav-item" href="${pageContext.request.contextPath}/logout">Log out</a>
        </div>

    </div>

    <section class="page">

        <header class="topbar">

            <h1>Patients</h1>

            <div class="top-actions">

                <div class="search">
                    Search patients, doctors...
                </div>

                <button class="icon">!</button>

                <div class="profile">
                    <div>
                        <strong>Dr. Suvhom K.C</strong>
                        <span>Clinic Administrator</span>
                    </div>

                    <b class="avatar a2"></b>
                </div>

            </div>

        </header>

        <div class="content">

            <div class="title-row">
                <div>
                    <h2>Patients Directory</h2>
                    <p>View and manage registered patients</p>
                </div>

                <a class="primary" href="${pageContext.request.contextPath}/admin/add-patient">
                    + Add New Patient
                </a>
            </div>

            <% if (request.getParameter("success") != null) { %>
                <p class="success-message">Patient added successfully.</p>
            <% } %>

            <% if (request.getParameter("updated") != null) { %>
                <p class="success-message">Patient updated successfully.</p>
            <% } %>

            <% if (request.getParameter("deleted") != null) { %>
                <p class="success-message" style="background: #fee2e2; color: #b91c1c; border-color: #fca5a5; padding: 12px 18px; border-radius: 10px; font-weight: 600; margin-bottom: 20px;">Patient record and all their appointments were deleted successfully.</p>
            <% } %>

            <div class="table-card">

                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Patient Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Gender</th>
                            <th>Date of Birth</th>
                            <th>Username</th>
                            <th>Created At</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>

                    <%
                        ArrayList<AddPatientModel> patients =
                            (ArrayList<AddPatientModel>) request.getAttribute("patients");

                        if (patients != null && !patients.isEmpty()) {
                            for (AddPatientModel patient : patients) {
                    %>

                        <tr>
                            <td><%= patient.getPatientId() %></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/patient-detail?id=<%= patient.getPatientId() %>" style="color: #1677d8; font-weight: 700; text-decoration: none; hover: text-decoration: underline;">
                                    <%= patient.getPatientName() %>
                                </a>
                            </td>
                            <td><%= patient.getEmail() %></td>
                            <td><%= patient.getPhone() %></td>
                            <td><%= patient.getGender() %></td>
                            <td><%= patient.getDateOfBirth() %></td>
                            <td><%= patient.getUsername() %></td>
                            <td><%= patient.getCreatedAt() %></td>
                            <td>
                                <a class="edit-btn"
                                   href="${pageContext.request.contextPath}/admin/edit-patient?id=<%= patient.getPatientId() %>">
                                    Edit
                                </a>
                            </td>
                        </tr>

                    <%
                            }
                        } else {
                    %>

                        <tr>
                            <td colspan="9">No patients found.</td>
                        </tr>

                    <%
                        }
                    %>

                    </tbody>
                </table>

            </div>

        </div>

    </section>

</main>

</body>
</html>
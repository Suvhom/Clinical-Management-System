<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Directory - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/AdminDirectory.css">
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
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
                <a class="nav-item active" href="${pageContext.request.contextPath}/admin/admins">Admin Directory</a>
            </nav>

            <div class="nav-bottom">
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/logout">Log out</a>
            </div>

        </div>

        <section class="page">

            <header class="topbar">
                <h1>Admin Management</h1>

                <div class="top-actions">
                    <div class="profile">
                        <div>
                            <strong>Clinic Administrator</strong>
                        </div>
                        <img class="profile-avatar" src="${pageContext.request.contextPath}/Images/Admin_Profile.png" alt="Admin profile" width="48" height="48">
                    </div>
                </div>
            </header>

            <section class="content">

                <div class="title-row">
                    <div>
                        <h2>Admin Directory</h2>
                        <p>View and manage system administrator accounts.</p>
                    </div>

                    <a class="primary-btn" href="${pageContext.request.contextPath}/admin/add-admin">+ Add Admin</a>
                </div>

                <c:if test="${param.success == '1'}">
                    <p class="success-message">Admin added successfully.</p>
                </c:if>

                <c:if test="${param.updated == '1'}">
                    <p class="success-message">Admin updated successfully.</p>
                </c:if>

                <c:if test="${param.deleted == '1'}">
                    <p class="success-message">Admin deleted successfully.</p>
                </c:if>

                <c:if test="${param.error == '1'}">
                    <p class="error-message">Something went wrong. Please try again.</p>
                </c:if>

                <div class="table-card">
                    <table>
                        <thead>
                            <tr>
                                <th>Admin ID</th>
                                <th>Username</th>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Actions</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:choose>
                                <c:when test="${not empty adminList}">
                                    <c:forEach var="admin" items="${adminList}">
                                        <tr>
                                            <td>${admin.adminId}</td>
                                            <td>${admin.username}</td>
                                            <td>${admin.fullName}</td>
                                            <td>${admin.email}</td>
                                            <td>${admin.phone}</td>
                                            <td>${admin.address}</td>
                                            <td>
                                                <div class="action-group">
                                                    <a class="action-btn edit-btn" href="${pageContext.request.contextPath}/admin/edit-admin?id=${admin.adminId}">Edit</a>
                                                    <a class="action-btn delete-btn" href="${pageContext.request.contextPath}/admin/delete-admin?id=${admin.adminId}" onclick="return confirm('Are you sure you want to delete this admin?');">Delete</a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>

                                <c:otherwise>
                                    <tr>
                                        <td class="empty-row" colspan="7">No admin records found.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>

                    <div class="table-footer">
                        <p>Showing ${empty adminList ? 0 : adminList.size()} admins</p>
                    </div>
                </div>

            </section>

        </section>

    </main>

</body>

</html>

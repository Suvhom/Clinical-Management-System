<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Page Not Found</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/ErrorPage.css">
</head>
<body>
    <main class="error-page">
        <section class="error-box">
            <h1>404</h1>
            <p>Oops! The page you&rsquo;re looking for can&rsquo;t be found.</p>
            <c:set var="errorUri" value="${requestScope['jakarta.servlet.error.request_uri']}" />

            <c:choose>
                <c:when test="${fn:contains(errorUri, '/admin')}">
                    <a href="${pageContext.request.contextPath}/admin/dashboard" class="home-btn">
                        Go to Dashboard
                    </a>
                </c:when>

                <c:when test="${not empty sessionScope.patient or sessionScope.role == 'patient'}">
                    <a href="${pageContext.request.contextPath}/UserDashboard" class="home-btn">
                        Go to Dashboard
                    </a>
                </c:when>

                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="home-btn">
                        Go to Login
                    </a>
                </c:otherwise>
            </c:choose>
        </section>
    </main>
</body>
</html>

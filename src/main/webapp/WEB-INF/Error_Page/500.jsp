<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>500 - Server Error</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/ErrorPage.css">
</head>
<body>
    <main class="error-page">
        <section class="error-box">
            <h1>500</h1>
            <p>Something went wrong. Please try again later.</p>
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="home-btn">
                Go to Homepage
            </a>
        </section>
    </main>
</body>
</html>

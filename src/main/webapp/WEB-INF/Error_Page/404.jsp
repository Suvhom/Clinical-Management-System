<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>

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
            <a href="${pageContext.request.contextPath}/login" class="home-btn">
                Go to Homepage
            </a>
        </section>
    </main>
</body>
</html>

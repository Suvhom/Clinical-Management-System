<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Exercise Plans - MotionRehab</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/UserDashboard.css">
</head>

<body>

<main class="screens standalone">
<section class="screen active">

<aside class="sidebar">
    <a class="brand" href="${pageContext.request.contextPath}/UserDashboard">
        <span class="logo">M</span>MotionRehab
    </a>

    <nav>
        <a class="nav" href="${pageContext.request.contextPath}/UserDashboard"><span>DB</span>Dashboard</a>
        <a class="nav" href="${pageContext.request.contextPath}/BookAppointment"><span>BK</span>Book Appointment</a>
        <a class="nav" href="${pageContext.request.contextPath}/AppointmentHistory"><span>AH</span>Appointment History</a>
        <a class="nav active" href="${pageContext.request.contextPath}/ExercisePlans"><span>EX</span>Exercise Plans</a>
        <a class="nav" href="${pageContext.request.contextPath}/MedicalRecords"><span>MR</span>Medical Records</a>
        <a class="nav" href="${pageContext.request.contextPath}/Billing"><span>BL</span>Billing</a>
    </nav>

    <div class="side-bottom">
        <a href="${pageContext.request.contextPath}/UpdateProfile">Settings</a>
        <a href="${pageContext.request.contextPath}/logout">Log out</a>
    </div>
</aside>

<div class="page">

<header class="topbar">
    <h1>Exercise Plans</h1>

    <div class="top-actions">
        <form action="${pageContext.request.contextPath}/ExercisePlans" method="get" class="search-form">
    <input type="text" 
           name="keyword" 
           value="${param.keyword}" 
           placeholder="Search exercises..." 
           class="dashboard-search">

    <button type="submit">Search</button>
</form>
        
						      

        <div class="profile">
            <div class="profile-text">
                <span class="profile-name">${patient.patientName}</span>
                <span class="profile-role">Patient</span>
            </div>
            <a href="${pageContext.request.contextPath}/UpdateProfile" class="avatar-link">
                ${imgTag}
            </a>
        </div>
    </div>
</header>

<div class="content table-page">

    <article class="card" style="${exerciseName == null ? 'display:none;' : ''}">
        <h2>Search Result</h2>

        <div class="todo ">
            ${exerciseName}
            <small>Focus Area: ${focusArea} | ${description}</small>
        </div>

        <a href="${videoUrl}" target="_blank">Watch Video</a>
        <p>${message}</p>
    </article>

    <article class="card" style="${exerciseName != null ? 'display:none;' : ''}">
        <div class="card-head">
        
            <h2>Physiotherapy Exercise Plan</h2>
            
            <a href="${pageContext.request.contextPath}/UserDashboard">Back to Dashboard</a>
        </div>

        <div class="progress">
            <span style="width:66%"></span>
        </div>

        <div class="todo " id="exercise-1">
            Straight Leg Raises
            <small>Focus Area: Leg | Strengthens thigh muscles </small>
        </div>

        <div class="todo " id="exercise-2">
            Heel Slides
            <small>Focus Area: Heels | Improves knee flexibility </small>
        </div>

        <div class="todo " id="exercise-3">
            Wall Squats
            <small>Focus Area: Leg | Builds leg strength and stability </small>
        </div>

        <div class="todo" id="exercise-4">
            Ankle Pumps
            <small>Focus Area: Ankle | Improves blood circulation and reduces stiffness</small>
        </div>

        <div class="todo" id="exercise-5">
            Hamstring Stretch
            <small>Focus Area: Leg | Improves flexibility of back thigh muscles</small>
        </div>

        <div class="todo" id="exercise-6">
            Quadriceps Sets
            <small>Focus Area: Leg | Strengthens front thigh muscles</small>
        </div>

        <div class="todo" id="exercise-7">
            Shoulder Rolls
            <small>Focus Area: Shoulder | Improves shoulder mobility</small>
        </div>

        <div class="todo" id="exercise-8">
            Arm Raises
            <small>Focus Area: Shoulder | Improves shoulder strength and flexibility</small>
        </div>

        <div class="todo" id="exercise-9">
            Glute Bridges
            <small>Focus Area: Back | Strengthens lower back and hips</small>
        </div>

        <div class="todo" id="exercise-10">
            Neck Stretch
            <small>Focus Area: Neck | Reduces neck stiffness and tension</small>
        </div>

    </article>

</div>

</div>

</section>
</main>

</body>
</html>
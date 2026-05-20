<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> <!-- Enable Expression Language (EL) -->

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Exercise Plans - MotionRehab</title>

<!-- Linking external CSS file -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/UserDashboard.css">
</head>

<body>

<!-- Main container -->
<main class="screens standalone">
<section class="screen active">

<!-- Sidebar section -->
<aside class="sidebar">

    <!-- Logo / Brand -->
    <a class="brand" href="${pageContext.request.contextPath}/UserDashboard">
        <span class="logo">M</span>MotionRehab
    </a>

    <!-- Navigation menu -->
    <nav>
        <a class="nav" href="${pageContext.request.contextPath}/UserDashboard"><span>DB</span>Dashboard</a>
        <a class="nav" href="${pageContext.request.contextPath}/BookAppointment"><span>BK</span>Book Appointment</a>
        <a class="nav" href="${pageContext.request.contextPath}/AppointmentHistory"><span>AH</span>Appointment History</a>
        
        <!-- Active page -->
        <a class="nav active" href="${pageContext.request.contextPath}/ExercisePlans"><span>EX</span>Exercise Plans</a>
        
        <a class="nav" href="${pageContext.request.contextPath}/MedicalRecords"><span>MR</span>Medical Records</a>
        <a class="nav" href="${pageContext.request.contextPath}/Billing"><span>BL</span>Billing</a>
    </nav>

    <!-- Bottom links -->
    <div class="side-bottom">
        <a href="${pageContext.request.contextPath}/UpdateProfile">Settings</a>
        <a href="${pageContext.request.contextPath}/logout">Log out</a>
    </div>
</aside>

<!-- Main page content -->
<div class="page">

<!-- Top header -->
<header class="topbar">
    <h1>Exercise Plans</h1>

    <div class="top-actions">

        <!-- Search form -->
        <form action="${pageContext.request.contextPath}/ExercisePlans" method="get" class="search-form">
            
            <!-- Input field for search -->
            <input type="text" 
                   name="keyword" 
                   value="${param.keyword}" 
                   placeholder="Search exercises..." 
                   class="dashboard-search">

            <!-- Search button -->
            <button type="submit">Search</button>
        </form>

        <!-- User profile section -->
        <div class="profile">
            <div class="profile-text">
                
                <!-- Display patient name dynamically -->
                <span class="profile-name">${patient.patientName}</span>
                <span class="profile-role">Patient</span>
            </div>

            <!-- Profile image -->
            <a href="${pageContext.request.contextPath}/UpdateProfile" class="avatar-link">
                ${imgTag}
            </a>
        </div>
    </div>
</header>

<!-- Content area -->
<div class="content table-page">

    <!-- SEARCH RESULT CARD -->
    <!-- Show this only when search result exists -->
    <article class="card" style="${exerciseName == null ? 'display:none;' : ''}">
        <h2>Search Result</h2>

        <!-- Exercise details -->
        <div class="todo ">
            ${exerciseName}
            <small>Focus Area: ${focusArea} | ${description}</small>
        </div>

        <!-- Video link -->
        <a href="${videoUrl}" target="_blank">Watch Video</a>

        <!-- Message (success/error) -->
        <p>${message}</p>
    </article>

    <!-- DEFAULT EXERCISE LIST -->
    <!-- Show this when no search is performed -->
    <article class="card" style="${exerciseName != null ? 'display:none;' : ''}">
        
        <!-- Card header -->
        <div class="card-head">
            <h2>Physiotherapy Exercise Plan</h2>
            
            <!-- Back button -->
            <a href="${pageContext.request.contextPath}/UserDashboard">Back to Dashboard</a>
        </div>

        <!-- Progress bar -->
        <div class="progress">
            <span style="width:66%"></span>
        </div>

        <!-- Static exercise list -->
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
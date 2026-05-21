<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Exercise Form - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/AddExerciseForm.css">
</head>

<body>

    <main class="screens standalone">

        <section class="screen active" id="add-exercise-form">

            <!-- SIDEBAR -->
            <aside class="sidebar admin">

                <a class="brand" href="${pageContext.request.contextPath}/admin/dashboard">
                    <span class="logo">M</span> MotionRehab
                </a>

                <nav>
                    <a class="nav" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                    <a class="nav" href= "${pageContext.request.contextPath}/admin/appointments">Appointments</a>
                    <a class="nav active" href = "${pageContext.request.contextPath}/admin/patients">Patients</a>
                    <a class="nav" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
                    <a class="nav" href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
                    <a class="nav" href="${pageContext.request.contextPath}/admin/admins">Admin Directory</a>
                </nav>

                <div class="side-bottom">
                    <a href="${pageContext.request.contextPath}/admin/logout">Log out</a>
                </div>

            </aside>

            <!-- MAIN PAGE -->
            <div class="page">

                <!-- TOPBAR -->
                <header class="topbar">
                <h1>Prescribe Exercise</h1>

                <div class="top-actions">
                    <div class="profile">
                        <div>
                            <strong>Clinic Administrator</strong>
                        </div>
                        <img class="profile-avatar" src="${pageContext.request.contextPath}/Images/Admin_Profile.png" alt="Admin profile" width="48" height="48">
                    </div>
                </div>
            </header>

                <!-- CONTENT -->
                <div class="content narrow">

                    <a class="back" href="${pageContext.request.contextPath}/admin/patient-detail">
                        Back to Patient Detail
                    </a>

                    <c:if test="${not empty success}">
                        <p class="success-message">
                            ${success}
                        </p>
                    </c:if>

                    <c:if test="${not empty error}">
                        <p class="error-message">
                            ${error}
                        </p>
                    </c:if>

                    <!-- FORM -->
                    <form class="card form-card"
                          action="${pageContext.request.contextPath}/admin/add-exercise"
                          method="post">

                        <!-- FORM HEADER -->
                        <div class="form-title">
                            <span class="file peach">EX</span>

                            <div>
                                <h2>Add Exercise to Routine</h2>
                                <p>Create a new exercise prescription for the patient recovery plan.</p>
                            </div>
                        </div>

                        <!-- EXERCISE NAME -->
                        <label>
                            Exercise Name
                            <input type="text"
                                   name="exerciseName"
                                   placeholder="Enter exercise name"
                                   required>
                        </label>

                        <!-- GRID INPUTS -->
                        <div class="form-grid">

                            <label>
                                Focus Area
                                <select name="focusArea" required>
                                    <option value="">Select focus area</option>
                                    <option value="Knee">Knee</option>
                                    <option value="Back">Back</option>
                                    <option value="Neck">Neck</option>
                                    <option value="Shoulder">Shoulder</option>
                                    <option value="Leg">Leg</option>
                                    <option value="Arm">Arm</option>
                                </select>
                            </label>

                            <label>
                                Frequency
                                <select name="frequency">
                                    <option value="">Select frequency</option>
                                    <option value="Daily">Daily</option>
                                    <option value="3 times a week">3 times a week</option>
                                    <option value="Weekly">Weekly</option>
                                </select>
                            </label>

                            <label>
                                Sets
                                <input type="text"
                                       name="sets"
                                       placeholder="e.g. 3">
                            </label>

                            <label>
                                Repetitions
                                <input type="text"
                                       name="repetitions"
                                       placeholder="e.g. 10-12">
                            </label>

                            <label>
                                Hold Time (Seconds)
                                <input type="text"
                                       name="holdTime"
                                       placeholder="e.g. 5 seconds">
                            </label>

                            <label>
                                Rest Period (Seconds)
                                <input type="text"
                                       name="restPeriod"
                                       placeholder="e.g. 30 seconds">
                            </label>

                        </div>

                        <!-- DESCRIPTION -->
                        <label>
                            Special Instructions
                            <textarea name="description"
                                      placeholder="Add specific form cues, precautions, or breathing instructions..."></textarea>
                        </label>

                        <!-- VIDEO URL -->
                        <label>
                            Reference Video / Image URL
                            <input type="text"
                                   name="videoUrl"
                                   placeholder="https://">
                        </label>

                        <!-- TEMPORARY HIDDEN IDS -->
                        <input type="hidden" name="patientId" value="1">
                        <input type="hidden" name="staffId" value="1">

                        <!-- BUTTONS -->
                        <div class="actions">
                            <button type="reset">Cancel</button>
                            <button class="primary" type="submit">Save Exercise</button>
                        </div>

                    </form>

                </div>
            </div>

        </section>

    </main>

</body>
</html>

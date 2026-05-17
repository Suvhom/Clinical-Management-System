 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Exercise Form - MotionRehab</title>

    <link rel="stylesheet" href="AddExerciseForm.css">
</head>

<body>

    <main class="screens standalone">

        <section class="screen active" id="add-exercise-form">

            <!-- ================= SIDEBAR ================= -->
            <aside class="sidebar admin">

                <a class="brand" href="../index.html#admin-dashboard">
                    <span class="logo">M</span> MotionRehab
                </a>

                <nav>
                   <a class="nav" href="<%= request.getContextPath() %>/Admin_page/AdminDashboard.jsp">Dashboard</a>

					<a class="nav" href="<%= request.getContextPath() %>/Admin_page/AdminAppointments.jsp">Appointments</a>
					
					<a class="nav" href="<%= request.getContextPath() %>/Admin_page/PatientProfile.jsp">Patients</a>
					
					<a class="nav" href="<%= request.getContextPath() %>/Admin_page/BillingRevenue.jsp">Billing & Revenue</a>
					
					<a class="nav" href="<%= request.getContextPath() %>/Admin_page/PatientDetail.jsp">Staff Directory</a>
                </nav>

                <div class="side-bottom">
                    <a href="#">Settings</a>
                    <a href="#">Log out</a>
                </div>

            </aside>

            <!-- ================= MAIN PAGE ================= -->
            <div class="page">

                <!-- TOPBAR -->
                <header class="topbar">
                    <h1>Prescribe Exercise</h1>

                    <div class="top-actions">
                        <button class="icon">!</button>

                        <div class="profile">
                            Dr. Emily Chen
                            <span>Clinic Administrator</span>
                            <b class="avatar a2"></b>
                        </div>
                    </div>
                </header>

                <!-- ================= CONTENT ================= -->
                <div class="content narrow">

                    <!-- BACK LINK -->
                    <a class="back" href="../index.html#patient-detail">
                        Back to David Miller
                    </a>

                    <!-- FORM -->
                    <form class="card form-card">

                        <!-- FORM HEADER -->
                        <div class="form-title">
                            <span class="file peach">EX</span>

                            <div>
                                <h2>Add Exercise to Routine</h2>
                                <p>
                                    Create a new exercise prescription for David Miller's recovery plan.
                                </p>
                            </div>
                        </div>

                        <!-- EXERCISE NAME -->
                        <label>
                            Exercise Name
                            <input type="text" placeholder="Search or type exercise name...">
                        </label>

                        <!-- GRID INPUTS -->
                        <div class="form-grid">

                            <label>
                                Focus Area
                                <select>
                                    <option>Select focus area</option>
                                </select>
                            </label>

                            <label>
                                Frequency
                                <select>
                                    <option>Select frequency</option>
                                </select>
                            </label>

                            <label>
                                Sets
                                <input type="text" placeholder="e.g. 3">
                            </label>

                            <label>
                                Repetitions
                                <input type="text" placeholder="e.g. 10-12">
                            </label>

                            <label>
                                Hold Time (Seconds)
                                <input type="text" placeholder="Optional hold time per rep">
                            </label>

                            <label>
                                Rest Period (Seconds)
                                <input type="text" placeholder="Optional rest between sets">
                            </label>

                        </div>

                        <!-- TEXTAREA -->
                        <label>
                            Special Instructions
                            <textarea placeholder="Add specific form cues, precautions, or breathing instructions..."></textarea>
                        </label>

                        <!-- URL -->
                        <label>
                            Reference Video / Image URL
                            <input type="text" placeholder="https://">
                        </label>

                        <!-- BUTTONS -->
                        <div class="actions">
                            <button type="button">Cancel</button>
                            <button class="primary" type="button">Save Exercise</button>
                        </div>

                    </form>

                </div>
            </div>

        </section>

    </main>

</body>
</html>
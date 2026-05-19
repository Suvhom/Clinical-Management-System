<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Detail - MotionRehab</title>

    <link rel="stylesheet" href="/css/PatientDetail.css">
</head>

<body>

    <main class="screens">

        <!-- ================= PAGE ================= -->
        <section class="screen active">

            <!-- ================= SIDEBAR ================= -->
            <aside class="sidebar">

                <div class="brand">
                    <span class="logo">M</span>
                    MotionRehab
                </div>

                <nav>
                    <a href="#">Dashboard</a>
                    <a href="#">Appointments</a>
                    <a class="active" href="#">Patients</a>
                    <a href="#">Billing</a>
                    <a href="#">Staff</a>
                </nav>

                <div class="side-bottom">
                    <a href="#">Settings</a>
                    <a href="#">Logout</a>
                </div>

            </aside>

            <!-- ================= MAIN CONTENT ================= -->
            <div class="page">

                <!-- TOP BAR -->
                <header class="topbar">
                    <h1>Patient Profile</h1>

                    <div class="top-actions">
                        <div class="search">Search...</div>
                        <button>🔔</button>

                        <div class="profile">
                            Dr. Emily Chen
                            <span>Admin</span>
                        </div>
                    </div>
                </header>

                <!-- CONTENT -->
                <div class="content">

                    <!-- BACK BUTTON -->
                    <a class="back" href="#">← Back to Patients</a>

                    <!-- PATIENT HEADER -->
                    <div class="card patient-hero">

                        <div>
                            <h2>David Miller</h2>

                            <p>
                                PT-8230 | 24 Years | Male <br>
                                +1 (555) 123-4567 <br>
                                david.miller@example.com <br>
                                Condition: Post-op ACL Reconstruction
                            </p>

                            <button>Message</button>
                            <button>Edit Profile</button>
                        </div>

                        <span class="pill green">Active</span>

                    </div>

                    <!-- ================= GRID ================= -->
                    <div class="detail-grid">

                        <!-- LEFT SIDE -->
                        <section>

                            <!-- MEDICAL HISTORY -->
                            <div class="card">
                                <h2>Medical History</h2>

                                <p><b>Oct 10, 2023</b><br>
                                    Initial physiotherapy assessment.
                                </p>

                                <p><b>Sep 28, 2023</b><br>
                                    ACL reconstruction surgery completed.
                                </p>

                                <p><b>Sep 12, 2023</b><br>
                                    Injury during sports activity.
                                </p>

                            </div>

                            <!-- EXERCISE PLAN -->
                            <div class="card">
                                <h2>Exercise Plan</h2>

                                <p>Heel Slides – 3 x 10</p>
                                <p>Quad Sets – 15 reps</p>
                                <p>Straight Leg Raises – 3 x 12</p>

                            </div>

                        </section>

                        <!-- RIGHT SIDE -->
                        <aside>

                            <!-- ADD EXERCISE -->
                            <div class="card">
                                <h2>Prescribe Exercise</h2>
                                <p>Add new exercises to patient plan</p>

                                <button>Add Exercise</button>
                            </div>

                            <!-- VITALS -->
                            <div class="card">
                                <h2>Vitals</h2>

                                <p>Height: 182 cm</p>
                                <p>Weight: 78 kg</p>
                                <p>Blood Type: O+</p>
                                <p>Allergies: Penicillin</p>

                            </div>

                            <!-- APPOINTMENTS -->
                            <div class="card">
                                <h2>Upcoming Appointment</h2>

                                <p>
                                    Follow-up Session <br>
                                    Nov 02, 2023 – 10:00 AM
                                </p>

                                <button>Reschedule</button>

                            </div>

                        </aside>

                    </div>

                </div>

            </div>

        </section>

    </main>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Profile - MotionRehab</title>

    <link rel="stylesheet" href="PatientProfile.css">
</head>

<body>

    <main class="screens">

        <section class="screen active">

            <!-- SIDEBAR -->
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

            <!-- MAIN PAGE -->
            <div class="page">

                <!-- TOP BAR -->
                <header class="topbar">
                    <h1>Patients</h1>

                    <div class="top-actions">
                        <div class="search">Search patients...</div>
                        <button>🔔</button>

                        <div class="profile">
                            Dr. Emily Chen
                            <span>Admin</span>
                        </div>
                    </div>
                </header>

                <!-- CONTENT -->
                <div class="content">

                    <!-- TITLE -->
                    <div class="title-row">
                        <h2>Patient Directory</h2>
                        <button class="primary">+ Add New Patient</button>
                    </div>

                    <!-- FILTERS -->
                    <div class="card filters">
                        <input type="text" placeholder="Search by name or ID">

                        <select>
                            <option>All Statuses</option>
                            <option>Active</option>
                            <option>Discharged</option>
                        </select>

                        <select>
                            <option>Assigned Doctor</option>
                            <option>Dr. S. Evans</option>
                            <option>Dr. Emily Chen</option>
                            <option>Dr. M. Patel</option>
                        </select>

                        <button>Export</button>
                    </div>

                    <!-- PATIENT TABLE -->
                    <div class="card table-card">

                        <table>
                            <thead>
                                <tr>
                                    <th>Patient Details</th>
                                    <th>Condition</th>
                                    <th>Doctor</th>
                                    <th>Last Visit</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody>

                                <tr>
                                    <td>
                                        David Miller
                                        <small>PT-8230 | 24y | Male</small>
                                    </td>
                                    <td>
                                        Post-op ACL Reconstruction
                                        <small>Diagnosed Oct 10, 2023</small>
                                    </td>
                                    <td>Dr. S. Evans</td>
                                    <td>Oct 26, 2023</td>
                                    <td><span class="pill green">Active</span></td>
                                    <td>
                                        <button>View Profile</button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        Sarah Jenkins
                                        <small>PT-8231 | 31y | Female</small>
                                    </td>
                                    <td>
                                        Chronic Lower Back Pain
                                        <small>Diagnosed Sep 15, 2023</small>
                                    </td>
                                    <td>Dr. Emily Chen</td>
                                    <td>Oct 24, 2023</td>
                                    <td><span class="pill green">Active</span></td>
                                    <td>
                                        <button>View Profile</button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        Michael Chang
                                        <small>PT-8190 | 45y | Male</small>
                                    </td>
                                    <td>
                                        Rotator Cuff Tear
                                        <small>Diagnosed Jul 02, 2023</small>
                                    </td>
                                    <td>Dr. M. Patel</td>
                                    <td>Oct 15, 2023</td>
                                    <td><span class="pill gray">Discharged</span></td>
                                    <td>
                                        <button>View Profile</button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        Elena Rodriguez
                                        <small>PT-8245 | 22y | Female</small>
                                    </td>
                                    <td>
                                        Ankle Sprain
                                        <small>Diagnosed Oct 20, 2023</small>
                                    </td>
                                    <td>Dr. S. Evans</td>
                                    <td>Oct 25, 2023</td>
                                    <td><span class="pill green">Active</span></td>
                                    <td>
                                        <button>View Profile</button>
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                    </div>

                </div>

            </div>

        </section>

    </main>

</body>
</html>
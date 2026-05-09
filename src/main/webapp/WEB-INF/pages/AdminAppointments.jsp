<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminAppointments - MotionRehab</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}../../CSS/AdminAppointments.css">
</head>
<body>
  <main class="screens standalone">
    <section class="screen active" id="admin-appointments">
      <aside class="sidebar admin">
      <a class="brand" href="../index.html#admin-dashboard">
      <span class="logo">M</span>MotionRehab</a><nav>
      <a class="nav" href="../index.html#admin-dashboard">Dashboard</a>
      <a class="nav active" href="../index.html#admin-appointments">Appointments</a>
      <a class="nav" href="../index.html#patient-profile">Patients</a>
      <a class="nav" href="../index.html#billing-revenue">Billing & Revenue</a>
      <a class="nav" href="../index.html#patient-detail">Staff Directory</a>
      </nav><div class="side-bottom"><a>Settings</a><a>Log out</a></div></aside>
      <div class="page"><header class="topbar"><h1>Appointments</h1><div class="top-actions"><div class="search">Search...</div><button class="icon">!</button><div class="profile">Dr. Emily Chen<span>Clinic Administrator</span><b class="avatar a2"></b></div></div></header>
        <div class="content table-page">
        <div class="title-row"><div>
        <h2>Manage Appointments</h2>
        <p>View, schedule and manage all patient appointments.</p>
        </div><button class="primary">+ New Appointment</button>
        </div><div class="card filters"><div class="tabs"><a class="active">All Appointments</a><a>Today</a><a>Upcoming</a><a>Pending</a></div><input placeholder="Search patient or doctor..."><button>Oct 24 - Oct 30, 2023</button></div><div class="card table-card"><table><thead><tr><th>Patient</th><th>Date & Time</th><th>Doctor</th><th>Treatment</th><th>Status</th><th>Actions</th></tr></thead><tbody><tr><td><b class="avatar mini a3"></b>John Doe<small>#PT-8842</small></td><td><b>09:00 AM - 10:00 AM</b><small>Today, Oct 26</small></td><td>Dr. M. Smith</td><td>Manual Therapy</td><td><span class="pill green">Confirmed</span></td><td><button>Edit</button></td></tr><tr><td><b class="avatar mini a1"></b>Alice Wong<small>#PT-9931</small></td><td><b>10:30 AM - 11:30 AM</b><small>Today, Oct 26</small></td><td>Dr. S. Evans</td><td>Post-op Rehab</td><td><span class="pill orange">In Progress</span></td><td><button>Edit</button></td></tr><tr><td><b class="avatar mini a4"></b>Robert Fox<small>#PT-7720</small></td><td><b>11:15 AM - 12:00 PM</b><small>Today, Oct 26</small></td><td>Dr. M. Smith</td><td>Sports Injury</td><td><span class="pill yellow">Pending</span></td><td><button>Edit</button></td></tr><tr><td><b class="avatar mini a5"></b>Sarah Jenkins<small>#PT-8099</small></td><td><b>01:00 PM - 02:00 PM</b><small>Today, Oct 26</small></td><td>Dr. D. Clark</td><td>Consultation</td><td><span class="pill green">Confirmed</span></td><td><button>Edit</button></td></tr><tr><td><b class="avatar mini a6"></b>Maria Garcia<small>#PT-8102</small></td><td><b>02:30 PM - 03:30 PM</b><small>Today, Oct 26</small></td><td>Dr. D. Clark</td><td>Neurological Rehab</td><td><span class="pill red">Cancelled</span></td><td><button>Edit</button></td></tr></tbody></table></div></div>
      </div>
    </section>
  </main>
</body>
</html>
    
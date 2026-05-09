<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AddExerciseForm - MotionRehab</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}../../CSS/AddExerciseForm.css">
</head>
<body>
  <main class="screens standalone">
    <section class="screen active" id="add-exercise-form">
      <aside class="sidebar admin"><a class="brand" href="../index.html#admin-dashboard"><span class="logo">M</span>MotionRehab</a><nav><a class="nav" href="../index.html#admin-dashboard">Dashboard</a><a class="nav" href="../index.html#admin-appointments">Appointments</a><a class="nav active" href="../index.html#patient-profile">Patients</a><a class="nav" href="../index.html#billing-revenue">Billing & Revenue</a><a class="nav" href="../index.html#patient-detail">Staff Directory</a></nav><div class="side-bottom"><a>Settings</a><a>Log out</a></div></aside>
      <div class="page"><header class="topbar"><h1>Prescribe Exercise</h1><div class="top-actions"><button class="icon">!</button><div class="profile">Dr. Emily Chen<span>Clinic Administrator</span><b class="avatar a2"></b></div></div></header>
        <div class="content narrow"><a class="back" href="../index.html#patient-detail">Back to David Miller</a><form class="card form-card"><div class="form-title"><span class="file peach">EX</span><div><h2>Add Exercise to Routine</h2><p>Create a new exercise prescription for David Miller's recovery plan.</p></div></div><label>Exercise Name<input placeholder="Search or type exercise name..."></label><div class="form-grid"><label>Focus Area<select><option>Select focus area</option></select></label><label>Frequency<select><option>Select frequency</option></select></label><label>Sets<input placeholder="e.g. 3"></label><label>Repetitions<input placeholder="e.g. 10-12"></label><label>Hold Time (Seconds)<input placeholder="Optional hold time per rep"></label><label>Rest Period (Seconds)<input placeholder="Optional rest between sets"></label></div><label>Special Instructions<textarea placeholder="Add specific form cues, precautions, or breathing instructions for the patient..."></textarea></label><label>Reference Video / Image URL<input placeholder="https://"></label><div class="actions"><button type="button">Cancel</button><button class="primary" type="button">Save Exercise</button></div></form></div>
      </div>
    </section>
  </main>
</body>
</html>
    
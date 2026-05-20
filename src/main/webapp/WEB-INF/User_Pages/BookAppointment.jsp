<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Appointment</title>
<link href="<%= request.getContextPath() %>/css/BookAppointment.css" rel="stylesheet">
</head>
<body>
<div class="dashboard">
      <!-- SIDEBAR -->

      <div class="sidebar">
      <a href="UserDashboard">
        <div class="logo">
          <img src="<%= request.getContextPath() %>/Images/Logo.png" alt="Logo image" class="img">
          </a>
          <h2>MotionRehab</h2>
        </div>

        <div class="menu">
          <a href="UserDashboard">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#203843"><path d="M518.09-603.35v-251h336.26v251H518.09ZM105.65-433.78v-420.57h336.26v420.57H105.65Zm412.44 327.41v-420.56h336.26v420.56H518.09Zm-412.44 0v-251h336.26v251H105.65Zm91-418.41h154.26v-238.57H196.65v238.57Zm412.44 327.41h154.26v-238.56H609.09v238.56Zm0-496.98h154.26v-69H609.09v69ZM196.65-197.37h154.26v-69H196.65v69Zm154.26-327.41Zm258.18-169.57Zm0 258.42ZM350.91-266.37Z"/></svg>
            Dashboard
          </a>

          <a href="BookingAppointment"class="active">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#F3F3F3"><path d="M680-80v-120H560v-80h120v-120h80v120h120v80H760v120h-80Zm-480-80q-33 0-56.5-23.5T120-240v-480q0-33 23.5-56.5T200-800h40v-80h80v80h240v-80h80v80h40q33 0 56.5 23.5T760-720v244q-20-3-40-3t-40 3v-84H200v320h280q0 20 3 40t11 40H200Zm0-480h480v-80H200v80Zm0 0v-80 80Z"/></svg>
            Book Appointment
          </a>

          <a href="AppointmentHistory">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#203843"><path d="M479.52-111.87q-141.35 0-246.24-93.77Q128.39-299.41 113.63-440h92.76q14.24 102.8 91.78 169.97 77.55 67.16 181.35 67.16 115.81 0 196.47-80.66Q756.65-364.2 756.65-480t-80.66-196.47q-80.66-80.66-196.47-80.66-66.13 0-124.22 29.97-58.08 29.96-98.37 83.09h103.31V-560H113.78v-245.98h83.59v90.41q52.2-63.52 125.93-98.04 73.74-34.52 156.22-34.52 76.44 0 143.49 29.1 67.06 29.1 116.75 78.79 49.7 49.7 78.79 116.75 29.1 67.06 29.1 143.49t-29.1 143.49q-29.09 67.05-78.79 116.75-49.69 49.69-116.75 78.79-67.05 29.1-143.49 29.1Zm110.81-198.22-152-152V-680h83.58v184L649.2-368.96l-58.87 58.87Z"/></svg>
            Appointment History
          </a>

          <a href="ExercisePlan">
             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#203843" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clipboard-list-icon lucide-clipboard-list"><rect width="8" height="4" x="8" y="2" rx="1" ry="1"/><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/><path d="M12 11h4"/><path d="M12 16h4"/><path d="M8 11h.01"/><path d="M8 16h.01"/></svg>
           
            Exercise Plans
          </a>

          <a href="#">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#203843"><path d="M880-733.33v506.66q0 27-19.83 46.84Q840.33-160 813.33-160H146.67q-27 0-46.84-19.83Q80-199.67 80-226.67v-506.66q0-27 19.83-46.84Q119.67-800 146.67-800h666.66q27 0 46.84 19.83Q880-760.33 880-733.33ZM146.67-634h666.66v-99.33H146.67V-634Zm0 139.33v268h666.66v-268H146.67Zm0 268v-506.66 506.66Z"/></svg>
            Billing
          </a>
        </div>

        <div class="bottom-menu">
          

          <a href="Login">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none" /><path fill="#203843" d="M5 21q-.825 0-1.412-.587T3 19V5q0-.825.588-1.412T5 3h6q.425 0 .713.288T12 4t-.288.713T11 5H5v14h6q.425 0 .713.288T12 20t-.288.713T11 21zm12.175-8H10q-.425 0-.712-.288T9 12t.288-.712T10 11h7.175L15.3 9.125q-.275-.275-.275-.675t.275-.7t.7-.313t.725.288L20.3 11.3q.3.3.3.7t-.3.7l-3.575 3.575q-.3.3-.712.288t-.713-.313q-.275-.3-.262-.712t.287-.688z" /></svg>
            Log out
          </a>
        </div>
      </div>


      <!-- CONTENT -->

      <div class="content">
        <!-- TOPBAR -->

        <div class="topbar">
          <h1>Book New Appointment</h1>

          <div class="top-right">
            <div class="search-box">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none" /><g fill="none" fill-rule="evenodd"><path d="m12.593 23.258l-.011.002l-.071.035l-.02.004l-.014-.004l-.071-.035q-.016-.005-.024.005l-.004.01l-.017.428l.005.02l.01.013l.104.074l.015.004l.012-.004l.104-.074l.012-.016l.004-.017l-.017-.427q-.004-.016-.017-.018m.265-.113l-.013.002l-.185.093l-.01.01l-.003.011l.018.43l.005.012l.008.007l.201.093q.019.005.029-.008l.004-.014l-.034-.614q-.005-.018-.02-.022m-.715.002a.02.02 0 0 0-.027.006l-.006.014l-.034.614q.001.018.017.024l.015-.002l.201-.093l.01-.008l.004-.011l.017-.43l-.003-.012l-.01-.01z" /><path fill="#58636d" d="M10.5 2a8.5 8.5 0 1 0 5.262 15.176l3.652 3.652a1 1 0 0 0 1.414-1.414l-3.652-3.652A8.5 8.5 0 0 0 10.5 2M4 10.5a6.5 6.5 0 1 1 13 0a6.5 6.5 0 0 1-13 0" /></g></svg>
              <input type="text" placeholder="Search..." />
            </div>

            <div class="bell">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none" /><path fill="#58636d" d="M12 22c1.1 0 2-.9 2-2h-4c0 1.1.9 2 2 2m6-6v-5c0-3.07-1.63-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.64 5.36 6 7.92 6 11v5l-2 2v1h16v-1zm-2 1H8v-6c0-2.48 1.51-4.5 4-4.5s4 2.02 4 4.5z" /></svg>
            </div>

            <div class="profile">
              <div class="profile-text">
                <h3>Sarina Rana</h3>
                <p>Patient</p>
              </div>

              <img
                src="<%= request.getContextPath() %>/Images/SarinaRana.png"
                alt="SarinaRana Image"
              />
            </div>
          </div>
        </div>

        <!-- MAIN -->

        <div class="main">
          <div class="form-card">
            <div class="form-title">
              <h2>Appointment Details</h2>
              <p>
                Please fill in the information below to schedule your next
                session.
              </p>
            </div>
          <p class="error-message">${error}</p>
            
            <form action="<%= request.getContextPath() %>/BookingAppointment" method="post">
            <div class="form-grid">
              <div class="input-group">
                <label>Full Name</label>
                <input type="text" name="fullName" placeholder="Enter your name">
              </div>

              <div class="input-group">
                <label>Phone Number</label>
                <input type="text" name="phoneNumber" placeholder="Enter your phone number">
              </div>

              <div class="input-group">
                <label>Treatment / Service</label>

                <select name="treatmentService">
                  <option>Knee Rehabilitation</option>
                  <option>Shoulder Rehabilitation</option>
                  <option>Back Pain Management</option>
                </select>
              </div>

              <div class="input-group">
                <label>Preferred Doctor</label>

                <select name="staff_Id">
                  <option value="1">Dr. Emilia Bhandari</option>
                    <option value="2">Dr. Ram Prasad Poudel</option>
                    <option value="3">Dr. Gopal Chapagain</option>
                </select>
              </div>

              <div class="input-group">
                <label>Preferred Date</label>
                <input type="date" name="appointmentDate">
              </div>

              <div class="input-group">
                <label>Preferred Time Slot</label>
                <input type="time" name="appointmentTime">
              </div>

              <div class="input-group full">
                <label>
                  Reason for Visit or Symptoms
                  <span class="optional">(Optional)</span>
                </label>
<textarea name="reason" placeholder="Enter the problem that you have been facing"></textarea>
                           
              </div>

              <div class="input-group full">

    <label>
        Upload Doctor's Review / Prescription
        <span class="optional">(Last visit photo)</span>
    </label>

    <div class="upload-box">

        <div style="background:#e99a73; padding:15px; display:inline-block; border-radius:50%;">

            <svg width="40" height="40" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">

                <path d="M20 62C11 50 13 31 26 21C39 11 58 15 67 29C72 28 78 29 83 33C92 40 94 53 88 62"
                stroke="white"
                stroke-width="9"
                stroke-linecap="round"/>

                <path d="M50 78V50"
                stroke="white"
                stroke-width="9"
                stroke-linecap="round"/>

                <path d="M34 62L50 46L66 62"
                stroke="white"
                stroke-width="9"
                stroke-linecap="round"
                stroke-linejoin="round"/>

            </svg>

        </div>

        <h4>Click to upload or drag and drop</h4>

        <p>SVG, PNG, JPG or PDF (max. 10MB)</p>

    </div>

</div>

            <div class="form-footer">
      <a href="<%= request.getContextPath() %>/UserDashboard" class="btn cancel-btn">
    Cancel
</a>

              <button type="submit" class="btn confirm-btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar-check-icon lucide-calendar-check"><path d="M8 2v4"/><path d="M16 2v4"/><rect width="18" height="18" x="3" y="4" rx="2"/><path d="M3 10h18"/><path d="m9 16 2 2 4-4"/></svg>
                Confirm Appointment
              </button>
            </div>
            </form>
          </div>
        </div>
      </div>
    </div>
</body>
</html>
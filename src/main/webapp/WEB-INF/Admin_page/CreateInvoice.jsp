<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.AddPatientModel" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Invoice - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AddPatient.css">
</head>

<body>

    <main class="layout">

        <!-- Sidebar -->
        <div class="sidebar">

            <div class="brand">
                <img src="${pageContext.request.contextPath}/Images/Logo.png" alt="MotionRehab Logo">
                <span>MotionRehab</span>
            </div>

            <nav class="nav-menu">
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/appointments">Appointments</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/patients">Patients</a>
                <a class="nav-item active" href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/staff">Staff Directory</a>
            </nav>

            <div class="nav-bottom">
                <a class="nav-item" href="#">Settings</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/logout">Log out</a>
            </div>

        </div>

        <!-- Main Page Area -->
        <section class="page">

            <!-- Topbar -->
            <header class="topbar">

                <h1>Create Invoice</h1>

                <div class="top-actions">

                    <div class="search">
                        Search...
                    </div>

                    <button class="icon">!</button>

                    <div class="profile">
                        <div>
                            <strong>Dr. Suvhom K.C</strong>
                            <span>Clinic Administrator</span>
                        </div>
                        <b class="avatar a2"></b>
                    </div>

                </div>

            </header>

            <!-- Content -->
            <div class="content">

                <!-- Breadcrumb -->
                <div class="breadcrumb" style="display: flex; gap: 8px; margin-bottom: 24px; color: #6b7280; font-size: 14px;">
                    <a href="${pageContext.request.contextPath}/admin/billing" style="text-decoration: none; color: #1677d8;">Billing & Revenue</a>
                    <span>›</span>
                    <p style="margin:0; font-weight: 600; color: #111827;">Create Invoice</p>
                </div>

                <!-- Error Messages -->
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p class="error-message" style="background: #fee2e2; color: #b91c1c; padding: 12px 18px; border-radius: 8px; font-weight: 600; margin-bottom: 20px; border-left: 4px solid #b91c1c;">
                        <%= request.getAttribute("errorMessage") %>
                    </p>
                <% } %>

                <!-- Form Card -->
                <div class="form-card" style="background: #ffffff; border-radius: 20px; padding: 28px; box-shadow: 0 10px 30px rgba(15, 23, 42, 0.06);">

                    <form action="${pageContext.request.contextPath}/admin/create-invoice" method="post">

                        <section class="form-section">

                            <h2 style="font-size: 20px; color: #111827; margin-bottom: 24px;">New Invoice Details</h2>

                            <div class="form-grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 24px;">

                                <div class="input-group" style="display: flex; flex-direction: column; gap: 8px;">
                                    <label for="patientId" style="font-weight: 600; color: #374151;">Select Patient</label>
                                    <select id="patientId" name="patientId" required style="height: 48px; border: 1px solid #d1d5db; border-radius: 8px; padding: 0 12px; outline: none; background: #ffffff;">
                                        <option value="">Choose patient...</option>
                                        <%
                                            ArrayList<AddPatientModel> patients = (ArrayList<AddPatientModel>) request.getAttribute("patientsList");
                                            if (patients != null) {
                                                for (AddPatientModel patient : patients) {
                                        %>
                                            <option value="<%= patient.getPatientId() %>">
                                                <%= patient.getPatientName() %> (#PT-<%= patient.getPatientId() %>)
                                            </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="input-group" style="display: flex; flex-direction: column; gap: 8px;">
                                    <label for="staffId" style="font-weight: 600; color: #374151;">Assigned Therapist</label>
                                    <select id="staffId" name="staffId" required style="height: 48px; border: 1px solid #d1d5db; border-radius: 8px; padding: 0 12px; outline: none; background: #ffffff;">
                                        <option value="">Choose staff...</option>
                                        <%
                                            ArrayList<String[]> staffList = (ArrayList<String[]>) request.getAttribute("staffList");
                                            if (staffList != null) {
                                                for (String[] staff : staffList) {
                                        %>
                                            <option value="<%= staff[0] %>">
                                                <%= staff[1] %> (#<%= staff[0] %>)
                                            </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="input-group" style="display: flex; flex-direction: column; gap: 8px;">
                                    <label for="invoiceDate" style="font-weight: 600; color: #374151;">Invoice Date</label>
                                    <input 
                                        type="date" 
                                        id="invoiceDate"
                                        name="invoiceDate" 
                                        required 
                                        style="height: 48px; border: 1px solid #d1d5db; border-radius: 8px; padding: 0 12px; outline: none; background: #ffffff;">
                                </div>

                                <div class="input-group" style="display: flex; flex-direction: column; gap: 8px;">
                                    <label for="invoiceTime" style="font-weight: 600; color: #374151;">Invoice Time</label>
                                    <input 
                                        type="time" 
                                        id="invoiceTime"
                                        name="invoiceTime" 
                                        value="10:00"
                                        required 
                                        style="height: 48px; border: 1px solid #d1d5db; border-radius: 8px; padding: 0 12px; outline: none; background: #ffffff;">
                                </div>

                                <div class="input-group" style="display: flex; flex-direction: column; gap: 8px;">
                                    <label for="reason" style="font-weight: 600; color: #374151;">Service / Treatment Type</label>
                                    <select id="reason" name="reason" required style="height: 48px; border: 1px solid #d1d5db; border-radius: 8px; padding: 0 12px; outline: none; background: #ffffff;">
                                        <option value="">Select treatment type...</option>
                                        <option value="General Physiotherapy">General Physiotherapy (NRP 1,500 - 2,500)</option>
                                        <option value="Sports Injury Rehab">Sports Injury Rehab (NRP 1,500 - 2,500)</option>
                                        <option value="Back and Neck Pain">Back and Neck Pain (NRP 1,500 - 2,500)</option>
                                        <option value="Post-Surgical Rehab">Post-Surgical Rehab (NRP 1,500 - 2,500)</option>
                                        <option value="Manual Therapy">Manual Therapy (NRP 1,500 - 2,500)</option>
                                        <option value="Neurological Rehab">Neurological Rehab (NRP 1,500 - 2,500)</option>
                                    </select>
                                </div>

                                <div class="input-group" style="display: flex; flex-direction: column; gap: 8px;">
                                    <label for="status" style="font-weight: 600; color: #374151;">Invoice Payment Status</label>
                                    <select id="status" name="status" required style="height: 48px; border: 1px solid #d1d5db; border-radius: 8px; padding: 0 12px; outline: none; background: #ffffff;">
                                        <option value="">Select status...</option>
                                        <option value="Paid">Paid (NRP 2,500 - Settled)</option>
                                        <option value="Pending">Pending (NRP 2,000 - Awaiting)</option>
                                        <option value="Overdue">Overdue (NRP 1,500 - Unpaid)</option>
                                    </select>
                                </div>

                            </div>

                        </section>

                        <!-- Buttons -->
                        <div class="form-actions" style="display: flex; justify-content: flex-end; gap: 14px; margin-top: 36px; padding-top: 24px; border-top: 1px solid #e5e7eb;">

                            <a href="${pageContext.request.contextPath}/admin/billing" class="cancel-btn" style="display: inline-block; padding: 12px 24px; border-radius: 8px; border: 1px solid #d1d5db; background: #ffffff; color: #374151; font-weight: 600; text-decoration: none; text-align: center;">
                                Cancel
                            </a>

                            <button type="submit" class="save-btn" style="padding: 12px 24px; border-radius: 8px; border: 1px solid #1677d8; background: #1677d8; color: #ffffff; font-weight: 700; cursor: pointer;">
                                Generate Invoice
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </section>

    </main>

</body>

</html>

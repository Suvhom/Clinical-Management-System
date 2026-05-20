<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Invoice - MotionRehab</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/Admin_Navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin_CSS/AddPatient.css">
</head>

<body>

    <main class="layout">

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
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/admins">Admin Directory</a>
            </nav>

            <div class="nav-bottom">
                <a class="nav-item" href="#">Settings</a>
                <a class="nav-item" href="${pageContext.request.contextPath}/logout">Log out</a>
            </div>

        </div>

        <section class="page">

            <header class="topbar">
                <h1>Create Invoice</h1>

                <div class="top-actions">
                    <div class="profile">
                        <div>
                            <strong>Clinic Administrator</strong>
                        </div>
                        <img class="profile-avatar" src="${pageContext.request.contextPath}/Images/Admin_Profile.png" alt="Admin profile" width="48" height="48">
                    </div>
                </div>
            </header>

            <div class="content">

                <div class="breadcrumb" style="display: flex; gap: 8px; margin-bottom: 24px; color: #6b7280; font-size: 14px;">
                    <a href="${pageContext.request.contextPath}/admin/billing" style="text-decoration: none; color: #1677d8;">Billing & Revenue</a>
                    <span>&gt;</span>
                    <p style="margin:0; font-weight: 600; color: #111827;">Create Invoice</p>
                </div>

                <c:if test="${not empty errorMessage}">
                    <p class="error-message">
                        ${errorMessage}
                    </p>
                </c:if>

                <div class="form-card" style="background: #ffffff; border-radius: 20px; padding: 28px; box-shadow: 0 10px 30px rgba(15, 23, 42, 0.06);">

                    <form action="${pageContext.request.contextPath}/admin/create-invoice" method="post">

                        <section class="form-section">

                            <h2 style="font-size: 20px; color: #111827; margin-bottom: 24px;">New Invoice Details</h2>

                            <div class="form-grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 24px;">

                                <div class="input-group" style="display: flex; flex-direction: column; gap: 8px;">
                                    <label for="appointmentId" style="font-weight: 600; color: #374151;">Appointment ID</label>
                                    <select id="appointmentId" name="appointmentId" required style="height: 48px; border: 1px solid #d1d5db; border-radius: 8px; padding: 0 12px; outline: none; background: #ffffff;">
                                        <option value="">Choose appointment...</option>
                                        <c:forEach var="appointment" items="${appointmentsList}">
                                            <option value="${appointment[0]}" data-patient-id="${appointment[1]}">
                                                #${appointment[0]} - ${appointment[2]} (${appointment[3]}, ${appointment[4]})
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="input-group" style="display: flex; flex-direction: column; gap: 8px;">
                                    <label for="patientId" style="font-weight: 600; color: #374151;">Patient ID</label>
                                    <input
                                        type="number"
                                        id="patientId"
                                        name="patientId"
                                        min="1"
                                        step="1"
                                        required
                                        readonly
                                        style="height: 48px; border: 1px solid #d1d5db; border-radius: 8px; padding: 0 12px; outline: none; background: #f9fafb;">
                                </div>

                                <div class="input-group" style="display: flex; flex-direction: column; gap: 8px;">
                                    <label for="totalAmount" style="font-weight: 600; color: #374151;">Total Amount</label>
                                    <input
                                        type="number"
                                        id="totalAmount"
                                        name="totalAmount"
                                        min="0"
                                        step="0.01"
                                        placeholder="Enter amount"
                                        required
                                        style="height: 48px; border: 1px solid #d1d5db; border-radius: 8px; padding: 0 12px; outline: none; background: #ffffff;">
                                </div>

                                <div class="input-group" style="display: flex; flex-direction: column; gap: 8px;">
                                    <label for="paymentStatus" style="font-weight: 600; color: #374151;">Payment Status</label>
                                    <select id="paymentStatus" name="paymentStatus" required style="height: 48px; border: 1px solid #d1d5db; border-radius: 8px; padding: 0 12px; outline: none; background: #ffffff;">
                                        <option value="">Select status...</option>
                                        <option value="Paid">Paid</option>
                                        <option value="Pending">Pending</option>
                                        <option value="Overdue">Overdue</option>
                                    </select>
                                </div>

                                <div class="input-group" style="display: flex; flex-direction: column; gap: 8px;">
                                    <label for="paymentMethod" style="font-weight: 600; color: #374151;">Payment Method</label>
                                    <select id="paymentMethod" name="paymentMethod" required style="height: 48px; border: 1px solid #d1d5db; border-radius: 8px; padding: 0 12px; outline: none; background: #ffffff;">
                                        <option value="">Select method...</option>
                                        <option value="Cash">Cash</option>
                                        <option value="Card">Card</option>
                                        <option value="Online">Online</option>
                                        <option value="Esewa">Esewa</option>
                                        <option value="Khalti">Khalti</option>
                                        <option value="Bank Transfer">Bank Transfer</option>
                                    </select>
                                </div>

                                <div class="input-group" style="display: flex; flex-direction: column; gap: 8px;">
                                    <label for="billingDate" style="font-weight: 600; color: #374151;">Billing Date</label>
                                    <input
                                        type="date"
                                        id="billingDate"
                                        name="billingDate"
                                        required
                                        style="height: 48px; border: 1px solid #d1d5db; border-radius: 8px; padding: 0 12px; outline: none; background: #ffffff;">
                                </div>

                            </div>

                        </section>

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

    <script>
        const appointmentSelect = document.getElementById("appointmentId");
        const patientInput = document.getElementById("patientId");

        appointmentSelect.addEventListener("change", function () {
            const selectedOption = appointmentSelect.options[appointmentSelect.selectedIndex];
            patientInput.value = selectedOption ? selectedOption.dataset.patientId || "" : "";
        });
    </script>

</body>

</html>

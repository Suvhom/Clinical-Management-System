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
                <a class="nav-item" href="${pageContext.request.contextPath}/admin/logout">Log out</a>
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

                <div class="breadcrumb invoice-breadcrumb">
                    <a href="${pageContext.request.contextPath}/admin/billing">Billing & Revenue</a>
                    <span>&gt;</span>
                    <p>Create Invoice</p>
                </div>

                <c:if test="${not empty errorMessage}">
                    <p class="error-message">
                        ${errorMessage}
                    </p>
                </c:if>

                <div class="form-card invoice-card">

                    <form action="${pageContext.request.contextPath}/admin/create-invoice" method="post">

                        <section class="form-section">

                            <h2 class="invoice-title">New Invoice Details</h2>

                            <div class="form-grid invoice-grid">

                                <div class="input-group invoice-input-group">
                                    <label for="appointmentId">Appointment ID</label>
                                    <select id="appointmentId" name="appointmentId" required>
                                        <option value="">Choose appointment...</option>
                                        <c:forEach var="appointment" items="${appointmentsList}">
                                            <option value="${appointment[0]}" data-patient-id="${appointment[1]}">
                                                APT-${appointment[0]} - ${appointment[2]} (${appointment[3]}, ${appointment[4]})
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="input-group invoice-input-group">
                                    <label for="patientId">Patient ID</label>
                                    <input
                                        type="number"
                                        id="patientId"
                                        name="patientId"
                                        min="1"
                                        step="1"
                                        required
                                        readonly
                                </div>

                                <div class="input-group invoice-input-group">
                                    <label for="totalAmount">Total Amount</label>
                                    <input
                                        type="number"
                                        id="totalAmount"
                                        name="totalAmount"
                                        min="0"
                                        step="0.01"
                                        placeholder="Enter amount"
                                        required
                                </div>

                                <div class="input-group invoice-input-group">
                                    <label for="paymentStatus">Payment Status</label>
                                    <select id="paymentStatus" name="paymentStatus" required>
                                        <option value="">Select status...</option>
                                        <option value="Paid">Paid</option>
                                        <option value="Pending">Pending</option>
                                        <option value="Overdue">Overdue</option>
                                    </select>
                                </div>

                                <div class="input-group invoice-input-group">
                                    <label for="paymentMethod">Payment Method</label>
                                    <select id="paymentMethod" name="paymentMethod" required>
                                        <option value="">Select method...</option>
                                        <option value="Cash">Cash</option>
                                        <option value="Card">Card</option>
                                        <option value="Online">Online</option>
                                        <option value="Esewa">Esewa</option>
                                        <option value="Khalti">Khalti</option>
                                        <option value="Bank Transfer">Bank Transfer</option>
                                    </select>
                                </div>

                                <div class="input-group invoice-input-group">
                                    <label for="billingDate">Billing Date</label>
                                    <input
                                        type="date"
                                        id="billingDate"
                                        name="billingDate"
                                        required
                                </div>

                            </div>

                        </section>

                        <div class="form-actions invoice-actions">

                            <a href="${pageContext.request.contextPath}/admin/billing" class="cancel-btn invoice-cancel-btn">
                                Cancel
                            </a>

                            <button type="submit" class="save-btn invoice-save-btn">
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

package com.controller.admin;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;

import com.dao.BillingDao;
import com.dao.DashboardDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/create-invoice", asyncSupported = true)
public class CreateInvoiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private BillingDao billingDao = new BillingDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<String[]> appointmentsList = billingDao.getPatientAppointments();
        request.setAttribute("appointmentsList", appointmentsList);

        request.getRequestDispatcher("/WEB-INF/Admin_page/CreateInvoice.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String patientIdStr = request.getParameter("patientId");
        String appointmentIdStr = request.getParameter("appointmentId");
        String totalAmountStr = request.getParameter("totalAmount");
        String paymentStatus = request.getParameter("paymentStatus");
        String paymentMethod = request.getParameter("paymentMethod");
        String billingDateStr = request.getParameter("billingDate");

        if (patientIdStr == null || patientIdStr.trim().isEmpty()
                || appointmentIdStr == null || appointmentIdStr.trim().isEmpty()
                || totalAmountStr == null || totalAmountStr.trim().isEmpty()
                || paymentStatus == null || paymentStatus.trim().isEmpty()
                || paymentMethod == null || paymentMethod.trim().isEmpty()
                || billingDateStr == null || billingDateStr.trim().isEmpty()) {

            request.setAttribute("errorMessage", "All required billing fields must be completed!");
            doGet(request, response);
            return;
        }

        try {
            int patientId = Integer.parseInt(patientIdStr);
            int appointmentId = Integer.parseInt(appointmentIdStr);
            BigDecimal totalAmount = new BigDecimal(totalAmountStr);
            Date billingDate = Date.valueOf(billingDateStr);

            if (totalAmount.compareTo(BigDecimal.ZERO) < 0) {
                request.setAttribute("errorMessage", "Total amount cannot be negative.");
                doGet(request, response);
                return;
            }

            boolean success = billingDao.addBilling(
                    patientId,
                    appointmentId,
                    totalAmount,
                    paymentStatus.trim(),
                    paymentMethod.trim(),
                    billingDate);

            if (success) {
                DashboardDao dashDao = new DashboardDao();
                dashDao.insertActivity("Invoice created for appointment APT-" + appointmentId);
                response.sendRedirect(request.getContextPath() + "/admin/billing?success=1");
            } else {
                request.setAttribute("errorMessage", "Failed to save invoice to database.");
                doGet(request, response);
            }

        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error creating invoice: " + e.getMessage());
            doGet(request, response);
        }
    }
}

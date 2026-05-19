package com.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.MonthlyRevenueModel;
import com.model.ReportBillModel;
import com.utils.DBconfig;

public class ReportDao {

    public ReportDao() {
        new BillingDao();
    }

    public BigDecimal getTotalRevenue() {
        // Project table name is billing. If your database uses bill, replace billing with bill.
        String sql = "SELECT COALESCE(SUM(total_amount), 0) FROM billing";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getBigDecimal(1);
            }
        } catch (Exception e) {
            System.out.println("ERROR FETCHING TOTAL REVENUE:");
            e.printStackTrace();
        }

        return BigDecimal.ZERO;
    }

    public int getTotalBills() {
        // Counts all records in the billing table.
        String sql = "SELECT COUNT(*) FROM billing";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("ERROR FETCHING TOTAL BILLS:");
            e.printStackTrace();
        }

        return 0;
    }

    public ArrayList<MonthlyRevenueModel> getMonthlyRevenue() {
        ArrayList<MonthlyRevenueModel> monthlyRevenueList = new ArrayList<>();

        // Groups revenue by the month from billing_date.
        String sql = "SELECT DATE_FORMAT(billing_date, '%M %Y') AS month_name, "
                + "COALESCE(SUM(total_amount), 0) AS monthly_total "
                + "FROM billing "
                + "GROUP BY YEAR(billing_date), MONTH(billing_date), DATE_FORMAT(billing_date, '%M %Y') "
                + "ORDER BY YEAR(billing_date) DESC, MONTH(billing_date) DESC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                MonthlyRevenueModel monthlyRevenue = new MonthlyRevenueModel();
                monthlyRevenue.setMonthName(rs.getString("month_name"));
                monthlyRevenue.setTotalRevenue(rs.getBigDecimal("monthly_total"));
                monthlyRevenueList.add(monthlyRevenue);
            }
        } catch (Exception e) {
            System.out.println("ERROR FETCHING MONTHLY REVENUE:");
            e.printStackTrace();
        }

        return monthlyRevenueList;
    }

    public ArrayList<ReportBillModel> getRecentBills() {
        ArrayList<ReportBillModel> bills = new ArrayList<>();

        try (Connection conn = DBconfig.getConnection()) {
            boolean statusAvailable = columnExists(conn, "billing", "payment_status");
            String statusColumn = statusAvailable ? "b.payment_status" : "'N/A' AS payment_status";

            // LEFT JOIN lets the bill still appear even if a patient record is missing.
            String sql = "SELECT b.billing_id, b.patient_id, p.patient_name, b.billing_date, "
                    + "b.total_amount, " + statusColumn + ", b.payment_method "
                    + "FROM billing b "
                    + "LEFT JOIN patient p ON b.patient_id = p.patient_id "
                    + "ORDER BY b.billing_date DESC, b.billing_id DESC "
                    + "LIMIT 5";

            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    ReportBillModel bill = new ReportBillModel();
                    bill.setBillingId(rs.getInt("billing_id"));
                    bill.setPatientId(rs.getInt("patient_id"));
                    bill.setPatientName(rs.getString("patient_name"));
                    bill.setBillingDate(rs.getDate("billing_date"));
                    bill.setTotalAmount(rs.getBigDecimal("total_amount"));
                    bill.setPaymentStatus(rs.getString("payment_status"));
                    bill.setPaymentMethod(rs.getString("payment_method"));
                    bills.add(bill);
                }
            }
        } catch (Exception e) {
            System.out.println("ERROR FETCHING RECENT BILLS:");
            e.printStackTrace();
        }

        return bills;
    }

    private boolean columnExists(Connection conn, String tableName, String columnName) throws Exception {
        DatabaseMetaData metaData = conn.getMetaData();

        try (ResultSet rs = metaData.getColumns(conn.getCatalog(), null, tableName, columnName)) {
            return rs.next();
        }
    }
}

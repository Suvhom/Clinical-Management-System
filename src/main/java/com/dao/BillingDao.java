package com.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.utils.DBconfig;

public class BillingDao {

    public BillingDao() {
        createTableIfNotExists();
    }

    private void createTableIfNotExists() {
        String sql = "CREATE TABLE IF NOT EXISTS billing ("
                + "billing_id INT AUTO_INCREMENT PRIMARY KEY, "
                + "patient_id INT NOT NULL, "
                + "appointment_id INT NOT NULL, "
                + "total_amount DECIMAL(10,2) NOT NULL, "
                + "payment_status VARCHAR(50) NOT NULL, "
                + "payment_method VARCHAR(50) NOT NULL, "
                + "billing_date DATE NOT NULL, "
                + "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, "
                + "FOREIGN KEY (patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE, "
                + "FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id) ON DELETE CASCADE"
                + ")";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            if (conn != null) {
                ps.executeUpdate();
                System.out.println("Billing table verified/created successfully.");
            }
        } catch (Exception e) {
            System.out.println("ERROR CREATING BILLING TABLE:");
            e.printStackTrace();
        }
    }

    public boolean addBilling(int patientId, int appointmentId, BigDecimal totalAmount,
            String paymentStatus, String paymentMethod, Date billingDate) {
        String sql = "INSERT INTO billing "
                + "(patient_id, appointment_id, total_amount, payment_status, payment_method, billing_date) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            if (conn == null) {
                return false;
            }

            ps.setInt(1, patientId);
            ps.setInt(2, appointmentId);
            ps.setBigDecimal(3, totalAmount);
            ps.setString(4, paymentStatus);
            ps.setString(5, paymentMethod);
            ps.setDate(6, billingDate);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("ERROR ADDING BILLING RECORD:");
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<String[]> getPatientAppointments() {
        ArrayList<String[]> appointments = new ArrayList<>();
        String sql = "SELECT a.appointment_id, a.patient_id, p.patient_name, a.reason, a.appointment_date "
                + "FROM appointment a "
                + "JOIN patient p ON a.patient_id = p.patient_id "
                + "ORDER BY a.appointment_date DESC, a.appointment_time DESC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                appointments.add(new String[] {
                        String.valueOf(rs.getInt("appointment_id")),
                        String.valueOf(rs.getInt("patient_id")),
                        rs.getString("patient_name"),
                        rs.getString("reason"),
                        String.valueOf(rs.getDate("appointment_date"))
                });
            }
        } catch (Exception e) {
            System.out.println("ERROR FETCHING BILLING APPOINTMENTS:");
            e.printStackTrace();
        }

        return appointments;
    }
}

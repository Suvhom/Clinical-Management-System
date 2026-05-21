package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.BookAppointmentmodel;
import com.utils.DBconfig;

public class BookAppointmentdao {

    public boolean insertAppointment(BookAppointmentmodel appointment) {

        boolean isInserted = false;

        String sql = "INSERT INTO appointment "
                   + "(patient_id, staff_id, appointment_date, appointment_time, reason, status) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (
            Connection con = DBconfig.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, appointment.getPatientId());
            ps.setInt(2, appointment.getStaffId());
            ps.setString(3, appointment.getAppointmentDate());
            ps.setString(4, appointment.getAppointmentTime());
            ps.setString(5, appointment.getReason());
            ps.setString(6, "booked");

            int row = ps.executeUpdate();

            if (row > 0) {
                isInserted = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isInserted;
    }

    public int getAvailableStaffId() {
        String sql = "SELECT staff_id FROM staff ORDER BY staff_id ASC LIMIT 1";

        try (
            Connection con = DBconfig.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            if (rs.next()) {
                return rs.getInt("staff_id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return createDefaultStaff();
    }

    private int createDefaultStaff() {
        String sql = "INSERT INTO staff (staff_name, specialization, status) VALUES (?, ?, ?)";

        try (
            Connection con = DBconfig.getConnection();
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
        ) {
            ps.setString(1, "General Physiotherapist");
            ps.setString(2, "Physiotherapy");
            ps.setString(3, "Active");

            int rows = ps.executeUpdate();
            if (rows > 0) {
                try (ResultSet keys = ps.getGeneratedKeys()) {
                    if (keys.next()) {
                        return keys.getInt(1);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 1;
    }

    public List<BookAppointmentmodel> getAppointmentsByPatientId(int patientId) {

        List<BookAppointmentmodel> appointments = new ArrayList<>();

        String sql = "SELECT "
                + "a.appointment_id, "
                + "a.patient_id, "
                + "a.staff_id, "
                + "a.appointment_date, "
                + "a.appointment_time, "
                + "a.reason, "
                + "a.status, "
                + "a.created_at, "
                + "s.staff_name, "
                + "s.specialization "
                + "FROM appointment a "
                + "LEFT JOIN staff s ON a.staff_id = s.staff_id "
                + "WHERE a.patient_id = ? "
                + "ORDER BY a.appointment_date DESC, a.appointment_time DESC";

        try (
            Connection con = DBconfig.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, patientId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BookAppointmentmodel appointment = new BookAppointmentmodel(
                            rs.getInt("appointment_id"),
                            rs.getInt("patient_id"),
                            rs.getInt("staff_id"),
                            rs.getString("appointment_date"),
                            rs.getString("appointment_time"),
                            rs.getString("reason"),
                            rs.getString("status"),
                            rs.getString("staff_name"),
                            rs.getString("specialization"),
                            rs.getString("created_at")
                    );

                    appointments.add(appointment);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return appointments;
    }

    public BookAppointmentmodel getUpcomingAppointmentByPatientId(int patientId) {

        String sql = "SELECT "
                + "a.appointment_id, "
                + "a.patient_id, "
                + "a.staff_id, "
                + "a.appointment_date, "
                + "a.appointment_time, "
                + "a.reason, "
                + "a.status, "
                + "a.created_at, "
                + "s.staff_name, "
                + "s.specialization "
                + "FROM appointment a "
                + "LEFT JOIN staff s ON a.staff_id = s.staff_id "
                + "WHERE a.patient_id = ? "
                + "AND a.appointment_date >= CURDATE() "
                + "AND (a.status IS NULL OR LOWER(a.status) <> 'cancelled') "
                + "ORDER BY a.appointment_date ASC, a.appointment_time ASC "
                + "LIMIT 1";

        try (
            Connection con = DBconfig.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, patientId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new BookAppointmentmodel(
                            rs.getInt("appointment_id"),
                            rs.getInt("patient_id"),
                            rs.getInt("staff_id"),
                            rs.getString("appointment_date"),
                            rs.getString("appointment_time"),
                            rs.getString("reason"),
                            rs.getString("status"),
                            rs.getString("staff_name"),
                            rs.getString("specialization"),
                            rs.getString("created_at")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public int countUpcomingAppointments(int patientId) {
        String sql = "SELECT COUNT(*) FROM appointment "
                + "WHERE patient_id = ? "
                + "AND appointment_date >= CURDATE() "
                + "AND (status IS NULL OR LOWER(status) <> 'cancelled')";

        return countAppointments(sql, patientId);
    }

    public int countCompletedAppointments(int patientId) {
        String sql = "SELECT COUNT(*) FROM appointment "
                + "WHERE patient_id = ? "
                + "AND LOWER(status) = 'completed'";

        return countAppointments(sql, patientId);
    }

    private int countAppointments(String sql, int patientId) {
        try (
            Connection con = DBconfig.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, patientId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}

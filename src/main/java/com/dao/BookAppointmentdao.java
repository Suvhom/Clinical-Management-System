package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.BookAppointmentmodel;
import com.util.DBconfig;

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
}

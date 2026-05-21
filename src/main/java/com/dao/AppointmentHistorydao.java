package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.AppointmentHistorymodel;
import com.utils.DBconfig;

public class AppointmentHistorydao {

    public List<AppointmentHistorymodel> getAppointmentsByPatientId(int patientId) {
        return getAppointmentsByPatientId(patientId, null);
    }

    public List<AppointmentHistorymodel> getAppointmentsByPatientId(int patientId, String status) {

        List<AppointmentHistorymodel> list = new ArrayList<>();

        String sql = "SELECT a.appointment_id, a.appointment_date, a.appointment_time, "
                   + "a.reason, a.status, s.staff_name "
                   + "FROM appointment a "
                   + "JOIN staff s ON a.staff_id = s.staff_id "
                   + "WHERE a.patient_id = ? ";

        String filter = normalizeStatus(status);

        if (filter.equals("upcoming")) {
            sql += "AND a.appointment_date >= CURDATE() "
                + "AND (a.status IS NULL OR LOWER(a.status) NOT IN ('completed', 'cancelled')) ";
        } else if (filter.equals("completed") || filter.equals("cancelled")) {
            sql += "AND LOWER(a.status) = ? ";
        }

        sql += "ORDER BY a.appointment_date DESC, a.appointment_time DESC";

        try (Connection con = DBconfig.getConnection()) {
            if (con == null) {
                return list;
            }

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, patientId);
                if (filter.equals("completed") || filter.equals("cancelled")) {
                    ps.setString(2, filter);
                }

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        AppointmentHistorymodel appointment = new AppointmentHistorymodel(
                                rs.getInt("appointment_id"),
                                rs.getString("appointment_date"),
                                rs.getString("appointment_time"),
                                rs.getString("reason"),
                                rs.getString("status"),
                                rs.getString("staff_name")
                        );

                        list.add(appointment);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    private String normalizeStatus(String status) {
        if (status == null) {
            return "all";
        }

        String value = status.toLowerCase();
        if (value.equals("upcoming") || value.equals("completed") || value.equals("cancelled")) {
            return value;
        }

        return "all";
    }
}

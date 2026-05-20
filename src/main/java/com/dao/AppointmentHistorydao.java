package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.AppointmentHistorymodel;
import com.util.DBconfig;

public class AppointmentHistorydao {

    public List<AppointmentHistorymodel> getAppointmentsByPatientId(int patientId) {

        List<AppointmentHistorymodel> list = new ArrayList<>();

        String sql = "SELECT a.appointment_id, a.appointment_date, a.appointment_time, "
                   + "a.reason, a.status, s.staff_name "
                   + "FROM appointment a "
                   + "JOIN staff s ON a.staff_id = s.staff_id "
                   + "WHERE a.patient_id = ? "
                   + "ORDER BY a.appointment_date DESC";

        try {
            Connection con = DBconfig.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, patientId);

            ResultSet rs = ps.executeQuery();

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

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
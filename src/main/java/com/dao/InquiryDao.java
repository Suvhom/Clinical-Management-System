package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.model.InquiryModel;
import com.utils.DBconfig;

public class InquiryDao {

    public boolean saveInquiry(InquiryModel inquiry) {
        String sql = "INSERT INTO inquery "
                + "(first_name, last_name, email, phone, doctor_preference, description) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) {
                return false;
            }

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, inquiry.getFirstName());
                ps.setString(2, inquiry.getLastName());
                ps.setString(3, inquiry.getEmail());
                ps.setString(4, inquiry.getPhone());
                ps.setString(5, inquiry.getDoctorPreference());
                ps.setString(6, inquiry.getDescription());

                int rows = ps.executeUpdate();
                return rows > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

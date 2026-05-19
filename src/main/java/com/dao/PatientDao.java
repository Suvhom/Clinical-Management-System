package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.PatientModel;
import com.utils.DBconfig;

public class PatientDao {

    public void insertPatient(int patient_id, int admin_id, int staff_id, String patient_name, String username, String dob ,
            String gender, String email, String number, String password,
            int programId, String imagePath) throws Exception {

        Connection con = DBconfig.getConnection();
        String sql = "INSERT INTO patient (patient_id, patient_name, email, phone, gender, address, date_of_birth, username, password, created_at  image) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, patient_id);
        pst.setInt(2, admin_id);
        pst.setString(3, username);
        pst.setString(4, dob);
        pst.setString(5, gender);
        pst.setString(6, email);
        pst.setString(7, number);
        pst.setString(8, password);
        pst.setInt(9, programId);
        pst.setString(10, imagePath);
        pst.executeUpdate();
        pst.close();
        con.close();
    }

    public PatientModel getPatientByUsername(String username) throws Exception {

        Connection con = DBconfig.getConnection();
        String sql = "SELECT * FROM patient WHERE username = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, username);
        ResultSet rs = pst.executeQuery();

        PatientModel s = null;
        if (rs.next()) {
            s = new PatientModel();
            s.setFirstName(rs.getString("first_name"));
            s.setLastName(rs.getString("last_name"));
            s.setUserName(rs.getString("username"));
            s.setDob(rs.getDate("dob"));
            s.setGender(rs.getString("gender"));
            s.setEmail(rs.getString("email"));
            s.setNumber(rs.getString("number"));
            s.setPassword(rs.getString("password"));
            s.setProgram(rs.getInt("program_id"));
            s.setImage(rs.getString("image"));
        }

        rs.close();
        pst.close();
        con.close();
        return s;
    }

    public void updateImage(String username, String imageBase64) throws Exception {
        Connection con = DBconfig.getConnection();
        String sql = "UPDATE patient SET image = ? WHERE username = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, imageBase64);
        pst.setString(2, username);
        pst.executeUpdate();
        pst.close();
        con.close();
    }

    public void updatePassword(String username, String newPassword) throws Exception {
        Connection con = DBconfig.getConnection();
        String sql = "UPDATE patient SET password = ? WHERE username = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, newPassword);
        pst.setString(2, username);
        pst.executeUpdate();
        pst.close();
        con.close();
    }
}

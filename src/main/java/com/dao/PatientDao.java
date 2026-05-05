package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.model.PatientModel;
import com.utils.DBconfig;

public class PatientDao {

	public void insertPatient(String patientName, String email, String phone,
	        String gender, String address, String dateOfBirth,
	        String username, String password, String image) throws Exception {

	    Connection con = DBconfig.getConnection();
	    String sql = "INSERT INTO patient (patient_name, email, phone, gender, address, date_of_birth, username, password, image) "
	               + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    PreparedStatement pst = con.prepareStatement(sql);
	    pst.setString(1, patientName);
	    pst.setString(2, email);
	    pst.setString(3, phone);
	    pst.setString(4, gender);
	    pst.setString(5, address);

	    if (dateOfBirth != null && !dateOfBirth.isEmpty()) {
	        pst.setString(6, dateOfBirth);
	    } else {
	        pst.setNull(6, java.sql.Types.DATE);
	    }

	    pst.setString(7, username);
	    pst.setString(8, password);
	    pst.setString(9, image);
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

        PatientModel patient = null;
        if (rs.next()) {
            patient = new PatientModel();
            patient.setPatientId(rs.getInt("patient_id"));
            patient.setPatientName(rs.getString("patient_name"));
            patient.setEmail(rs.getString("email"));
            patient.setPhone(rs.getString("phone"));
            patient.setGender(rs.getString("gender"));
            patient.setAddress(rs.getString("address"));
            patient.setDateOfBirth(rs.getDate("date_of_birth"));
            patient.setUsername(rs.getString("username"));
            patient.setPassword(rs.getString("password"));
            patient.setCreatedAt(rs.getTimestamp("created_at"));
            patient.setImage(rs.getString("image"));
        }

        rs.close();
        pst.close();
        con.close();
        return patient;
    }

    public PatientModel getPatientById(int patientId) throws Exception {

        Connection con = DBconfig.getConnection();
        String sql = "SELECT * FROM patient WHERE patient_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, patientId);
        ResultSet rs = pst.executeQuery();

        PatientModel patient = null;
        if (rs.next()) {
            patient = new PatientModel();
            patient.setPatientId(rs.getInt("patient_id"));
            patient.setPatientName(rs.getString("patient_name"));
            patient.setEmail(rs.getString("email"));
            patient.setPhone(rs.getString("phone"));
            patient.setGender(rs.getString("gender"));
            patient.setAddress(rs.getString("address"));
            patient.setDateOfBirth(rs.getDate("date_of_birth"));
            patient.setUsername(rs.getString("username"));
            patient.setPassword(rs.getString("password"));
            patient.setCreatedAt(rs.getTimestamp("created_at"));
            patient.setImage(rs.getString("image"));
        }

        rs.close();
        pst.close();
        con.close();
        return patient;
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
package com.dao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.PatientModel;
import com.utils.DBconfig;

public class PatientDao {

    public void insertPatient(String patientName, String email, String phone,
            String gender, String address, String dateOfBirth,
            String username, String password, String image) throws Exception {

        Connection con = DBconfig.getConnection();
        if (con == null) {
            throw new Exception("Database connection failed.");
        }

        boolean hasImageColumn = columnExists(con, "patient", "image");
        String sql;
        if (hasImageColumn) {
            sql = "INSERT INTO patient (patient_name, email, phone, gender, address, date_of_birth, username, password, image) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        } else {
            sql = "INSERT INTO patient (patient_name, email, phone, gender, address, date_of_birth, username, password) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        }

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
        if (hasImageColumn) {
            pst.setString(9, image);
        }
        pst.executeUpdate();
        pst.close();
        con.close();
    }

    public PatientModel getPatientByUsername(String username) throws Exception {
        Connection con = DBconfig.getConnection();
        if (con == null) {
            throw new Exception("Database connection failed.");
        }
        String sql = "SELECT * FROM patient WHERE username = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, username);
        ResultSet rs = pst.executeQuery();

        PatientModel patient = null;
        if (rs.next()) {
            patient = mapPatient(rs);
        }

        rs.close();
        pst.close();
        con.close();
        return patient;
    }

    public PatientModel getPatientByUsernameOrEmail(String loginId) throws Exception {
        Connection con = DBconfig.getConnection();
        if (con == null) {
            throw new Exception("Database connection failed.");
        }
        String sql = "SELECT * FROM patient WHERE username = ? OR email = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, loginId);
        pst.setString(2, loginId);
        ResultSet rs = pst.executeQuery();

        PatientModel patient = null;
        if (rs.next()) {
            patient = mapPatient(rs);
        }

        rs.close();
        pst.close();
        con.close();
        return patient;
    }

    public PatientModel getPatientById(int patientId) throws Exception {
        Connection con = DBconfig.getConnection();
        if (con == null) {
            throw new Exception("Database connection failed.");
        }
        String sql = "SELECT * FROM patient WHERE patient_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, patientId);
        ResultSet rs = pst.executeQuery();

        PatientModel patient = null;
        if (rs.next()) {
            patient = mapPatient(rs);
        }

        rs.close();
        pst.close();
        con.close();
        return patient;
    }

    public void updateImage(String username, String imageBase64) throws Exception {
        Connection con = DBconfig.getConnection();
        if (con == null) {
            throw new Exception("Database connection failed.");
        }
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
        if (con == null) {
            throw new Exception("Database connection failed.");
        }
        String sql = "UPDATE patient SET password = ? WHERE username = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, newPassword);
        pst.setString(2, username);
        pst.executeUpdate();
        pst.close();
        con.close();
    }

    private PatientModel mapPatient(ResultSet rs) throws Exception {
        PatientModel patient = new PatientModel();
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
        patient.setImage(getOptionalString(rs, "image"));
        return patient;
    }

    private String getOptionalString(ResultSet rs, String columnName) {
        try {
            return rs.getString(columnName);
        } catch (Exception e) {
            return null;
        }
    }

    private boolean columnExists(Connection con, String tableName, String columnName) throws Exception {
        DatabaseMetaData metaData = con.getMetaData();
        try (ResultSet rs = metaData.getColumns(con.getCatalog(), null, tableName, columnName)) {
            if (rs.next()) {
                return true;
            }
        }

        try (PreparedStatement pst = con.prepareStatement("SELECT * FROM " + tableName + " LIMIT 1");
             ResultSet rs = pst.executeQuery()) {
            java.sql.ResultSetMetaData rowMetaData = rs.getMetaData();
            for (int i = 1; i <= rowMetaData.getColumnCount(); i++) {
                if (columnName.equalsIgnoreCase(rowMetaData.getColumnName(i))) {
                    return true;
                }
            }
        }

        return false;
    }
}

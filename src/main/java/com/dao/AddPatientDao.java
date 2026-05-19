package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;

import com.model.AddPatientModel;
import com.utils.DBconfig;

public class AddPatientDao {

    public boolean addPatient(AddPatientModel patient) {

        String sql = "INSERT INTO patient "
                + "(admin_id, staff_id, patient_name, email, phone, gender, address, date_of_birth, username, password) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection conn = DBconfig.getConnection();

            if (conn == null) {
                System.out.println("DATABASE CONNECTION IS NULL");
                return false;
            }

            PreparedStatement ps = conn.prepareStatement(sql);

            setNullableInt(ps, 1, patient.getAdminId());
            setNullableInt(ps, 2, patient.getStaffId());

            ps.setString(3, patient.getPatientName());
            ps.setString(4, patient.getEmail());
            ps.setString(5, patient.getPhone());
            ps.setString(6, patient.getGender());
            ps.setString(7, patient.getAddress());

            if (patient.getDateOfBirth() == null) {
                ps.setNull(8, Types.DATE);
            } else {
                ps.setDate(8, patient.getDateOfBirth());
            }

            ps.setString(9, patient.getUsername());
            ps.setString(10, patient.getPassword());

            int rows = ps.executeUpdate();

            ps.close();
            conn.close();

            return rows > 0;

        } catch (Exception e) {
            System.out.println("ERROR WHILE INSERTING PATIENT:");
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<AddPatientModel> getAllPatients() {

        ArrayList<AddPatientModel> patients = new ArrayList<>();

        String sql = "SELECT * FROM patient ORDER BY patient_id DESC";

        try {
            Connection conn = DBconfig.getConnection();

            if (conn == null) {
                System.out.println("DATABASE CONNECTION IS NULL");
                return patients;
            }

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AddPatientModel patient = new AddPatientModel();

                patient.setPatientId(rs.getInt("patient_id"));

                int adminId = rs.getInt("admin_id");
                if (rs.wasNull()) {
                    patient.setAdminId(null);
                } else {
                    patient.setAdminId(adminId);
                }

                int staffId = rs.getInt("staff_id");
                if (rs.wasNull()) {
                    patient.setStaffId(null);
                } else {
                    patient.setStaffId(staffId);
                }

                patient.setPatientName(rs.getString("patient_name"));
                patient.setEmail(rs.getString("email"));
                patient.setPhone(rs.getString("phone"));
                patient.setGender(rs.getString("gender"));
                patient.setAddress(rs.getString("address"));
                patient.setDateOfBirth(rs.getDate("date_of_birth"));
                patient.setUsername(rs.getString("username"));
                patient.setPassword(rs.getString("password"));
                patient.setCreatedAt(rs.getTimestamp("created_at"));

                patients.add(patient);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            System.out.println("ERROR WHILE FETCHING PATIENTS:");
            e.printStackTrace();
        }

        return patients;
    }

    public AddPatientModel getPatientById(int patientId) {

        AddPatientModel patient = null;

        String sql = "SELECT * FROM patient WHERE patient_id = ?";

        try {
            Connection conn = DBconfig.getConnection();

            if (conn == null) {
                System.out.println("DATABASE CONNECTION IS NULL");
                return null;
            }

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, patientId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                patient = new AddPatientModel();

                patient.setPatientId(rs.getInt("patient_id"));

                int adminId = rs.getInt("admin_id");
                if (rs.wasNull()) {
                    patient.setAdminId(null);
                } else {
                    patient.setAdminId(adminId);
                }

                int staffId = rs.getInt("staff_id");
                if (rs.wasNull()) {
                    patient.setStaffId(null);
                } else {
                    patient.setStaffId(staffId);
                }

                patient.setPatientName(rs.getString("patient_name"));
                patient.setEmail(rs.getString("email"));
                patient.setPhone(rs.getString("phone"));
                patient.setGender(rs.getString("gender"));
                patient.setAddress(rs.getString("address"));
                patient.setDateOfBirth(rs.getDate("date_of_birth"));
                patient.setUsername(rs.getString("username"));
                patient.setPassword(rs.getString("password"));
                patient.setCreatedAt(rs.getTimestamp("created_at"));
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            System.out.println("ERROR WHILE FETCHING PATIENT BY ID:");
            e.printStackTrace();
        }

        return patient;
    }

    public boolean updatePatient(AddPatientModel patient) {

        String sql = "UPDATE patient SET "
                + "admin_id = ?, "
                + "staff_id = ?, "
                + "patient_name = ?, "
                + "email = ?, "
                + "phone = ?, "
                + "gender = ?, "
                + "address = ?, "
                + "date_of_birth = ?, "
                + "username = ?, "
                + "password = ? "
                + "WHERE patient_id = ?";

        try {
            Connection conn = DBconfig.getConnection();

            if (conn == null) {
                System.out.println("DATABASE CONNECTION IS NULL");
                return false;
            }

            PreparedStatement ps = conn.prepareStatement(sql);

            setNullableInt(ps, 1, patient.getAdminId());
            setNullableInt(ps, 2, patient.getStaffId());

            ps.setString(3, patient.getPatientName());
            ps.setString(4, patient.getEmail());
            ps.setString(5, patient.getPhone());
            ps.setString(6, patient.getGender());
            ps.setString(7, patient.getAddress());

            if (patient.getDateOfBirth() == null) {
                ps.setNull(8, Types.DATE);
            } else {
                ps.setDate(8, patient.getDateOfBirth());
            }

            ps.setString(9, patient.getUsername());
            ps.setString(10, patient.getPassword());
            ps.setInt(11, patient.getPatientId());

            int rows = ps.executeUpdate();

            ps.close();
            conn.close();

            return rows > 0;

        } catch (Exception e) {
            System.out.println("ERROR WHILE UPDATING PATIENT:");
            e.printStackTrace();
            return false;
        }
    }

    public boolean deletePatient(int patientId) {
        String sql = "DELETE FROM patient WHERE patient_id = ?";
        try {
            Connection conn = DBconfig.getConnection();
            if (conn == null) {
                System.out.println("DATABASE CONNECTION IS NULL");
                return false;
            }
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, patientId);
            int rows = ps.executeUpdate();
            ps.close();
            conn.close();
            return rows > 0;
        } catch (Exception e) {
            System.out.println("ERROR WHILE DELETING PATIENT:");
            e.printStackTrace();
            return false;
        }
    }

    private void setNullableInt(PreparedStatement ps, int index, Integer value) throws Exception {
        if (value == null) {
            ps.setNull(index, Types.INTEGER);
        } else {
            ps.setInt(index, value);
        }
    }
}
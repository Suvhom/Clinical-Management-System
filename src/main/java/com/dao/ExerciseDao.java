package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;

import com.model.ExerciseModel;
import com.utils.DBconfig;

public class ExerciseDao {

    public ExerciseDao() {
        verifyAndMigrateExerciseTable();
    }

    private void verifyAndMigrateExerciseTable() {
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return;

            // 1. Check if exercise table exists
            boolean tableExists = false;
            try (ResultSet tables = conn.getMetaData().getTables(null, null, "exercise", null)) {
                if (tables.next()) {
                    tableExists = true;
                }
            }

            if (!tableExists) {
                String createSql = "CREATE TABLE exercise ("
                        + "exercise_id INT AUTO_INCREMENT PRIMARY KEY, "
                        + "patient_id INT DEFAULT NULL, "
                        + "exercise_name VARCHAR(150) NOT NULL, "
                        + "focus_area VARCHAR(150), "
                        + "description TEXT, "
                        + "video_url VARCHAR(255), "
                        + "FOREIGN KEY (patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE"
                        + ")";
                try (PreparedStatement ps = conn.prepareStatement(createSql)) {
                    ps.executeUpdate();
                    System.out.println("Exercise table created successfully with patient_id.");
                }
                return;
            }

            // 2. Check if patient_id column exists
            boolean hasPatientId = false;
            try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM exercise LIMIT 1");
                 ResultSet rs = ps.executeQuery()) {
                java.sql.ResultSetMetaData md = rs.getMetaData();
                int count = md.getColumnCount();
                for (int i = 1; i <= count; i++) {
                    if ("patient_id".equalsIgnoreCase(md.getColumnName(i))) {
                        hasPatientId = true;
                        break;
                    }
                }
            }

            // 3. Alter table if patient_id column is missing
            if (!hasPatientId) {
                String alterColSql = "ALTER TABLE exercise ADD COLUMN patient_id INT DEFAULT NULL";
                String alterFkSql = "ALTER TABLE exercise ADD CONSTRAINT fk_exercise_patient "
                        + "FOREIGN KEY (patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE";
                try (PreparedStatement ps1 = conn.prepareStatement(alterColSql)) {
                    ps1.executeUpdate();
                    System.out.println("Added patient_id column to exercise table.");
                }
                try (PreparedStatement ps2 = conn.prepareStatement(alterFkSql)) {
                    ps2.executeUpdate();
                    System.out.println("Added foreign key constraint to exercise table.");
                }
            }

        } catch (Exception e) {
            System.out.println("ERROR VERIFYING/MIGRATING EXERCISE TABLE:");
            e.printStackTrace();
        }
    }

    public boolean insertExercise(ExerciseModel exercise) {
        String sql = "INSERT INTO exercise (patient_id, exercise_name, focus_area, description, video_url) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) {
                System.out.println("DATABASE CONNECTION IS NULL");
                return false;
            }

            if (exercise.getPatientId() == null) {
                ps.setNull(1, Types.INTEGER);
            } else {
                ps.setInt(1, exercise.getPatientId());
            }

            ps.setString(2, exercise.getExerciseName());
            ps.setString(3, exercise.getFocusArea());
            ps.setString(4, exercise.getDescription());
            ps.setString(5, exercise.getVideoUrl());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            System.out.println("ERROR WHILE INSERTING EXERCISE:");
            e.printStackTrace();
            return false;
        }
    }

    public ExerciseModel searchExercise(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return null;
        }

        String sql = "SELECT exercise_id, patient_id, exercise_name, focus_area, description, video_url "
                   + "FROM exercise "
                   + "WHERE exercise_name LIKE ? OR focus_area LIKE ? OR description LIKE ? "
                   + "ORDER BY exercise_id DESC LIMIT 1";

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) {
                System.out.println("DATABASE CONNECTION IS NULL");
                return null;
            }

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                String pattern = "%" + keyword.trim() + "%";
                ps.setString(1, pattern);
                ps.setString(2, pattern);
                ps.setString(3, pattern);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        ExerciseModel exercise = new ExerciseModel();
                        exercise.setExerciseId(rs.getInt("exercise_id"));

                        int patientId = rs.getInt("patient_id");
                        exercise.setPatientId(rs.wasNull() ? null : patientId);

                        exercise.setExerciseName(rs.getString("exercise_name"));
                        exercise.setFocusArea(rs.getString("focus_area"));
                        exercise.setDescription(rs.getString("description"));
                        exercise.setVideoUrl(rs.getString("video_url"));
                        return exercise;
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("ERROR WHILE SEARCHING EXERCISE:");
            e.printStackTrace();
        }

        return null;
    }
}

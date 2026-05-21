package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Types;
import java.util.ArrayList;

import com.model.ExerciseModel;
import com.utils.DBconfig;

public class ExerciseDao {

    public ExerciseDao() {
        verifyAndMigrateExerciseTable();
    }

    private void verifyAndMigrateExerciseTable() {
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return;

            boolean tableExists = false;
            try (ResultSet tables = conn.getMetaData().getTables(null, null, "exercise", null)) {
                if (tables.next()) tableExists = true;
            }

            if (!tableExists) {
                String createSql = "CREATE TABLE exercise ("
                        + "exercise_id INT AUTO_INCREMENT PRIMARY KEY, "
                        + "patient_id INT DEFAULT NULL, "
                        + "exercise_name VARCHAR(150) NOT NULL, "
                        + "focus_area VARCHAR(150), "
                        + "description TEXT, "
                        + "video_url VARCHAR(255)"
                        + ")";
                try (PreparedStatement ps = conn.prepareStatement(createSql)) {
                    ps.executeUpdate();
                }
                return;
            }

            if (!hasColumn(conn, "exercise", "patient_id")) {
                try (PreparedStatement ps = conn.prepareStatement(
                        "ALTER TABLE exercise ADD COLUMN patient_id INT DEFAULT NULL")) {
                    ps.executeUpdate();
                }
            }

        } catch (Exception e) {
            System.out.println("ERROR VERIFYING EXERCISE TABLE:");
            e.printStackTrace();
        }
    }

    public boolean insertExercise(ExerciseModel exercise) {
        String sql = "INSERT INTO exercise (patient_id, exercise_name, focus_area, description, video_url) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) {
                System.out.println("DB CONNECTION IS NULL");
                return false;
            }

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                if (exercise.getPatientId() == null) {
                    ps.setNull(1, Types.INTEGER);
                } else {
                    ps.setInt(1, exercise.getPatientId());
                }

                ps.setString(2, exercise.getExerciseName());
                ps.setString(3, getSafeText(exercise.getFocusArea()));
                ps.setString(4, getSafeText(exercise.getDescription()));
                ps.setString(5, getSafeText(exercise.getVideoUrl()));

                int rows = ps.executeUpdate();
                System.out.println("ROWS INSERTED: " + rows);
                return rows > 0;
            }

        } catch (Exception e) {
            System.out.println("ERROR WHILE INSERTING EXERCISE:");
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<ExerciseModel> getExercisesByPatientId(int patientId) {
        ArrayList<ExerciseModel> exercises = new ArrayList<>();

        String sql = "SELECT exercise_id, patient_id, exercise_name, focus_area, description, video_url "
                   + "FROM exercise WHERE patient_id = ? ORDER BY exercise_id DESC";

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return exercises;

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, patientId);

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        ExerciseModel exercise = new ExerciseModel();
                        exercise.setExerciseId(rs.getInt("exercise_id"));
                        exercise.setPatientId(rs.getInt("patient_id"));
                        exercise.setExerciseName(rs.getString("exercise_name"));
                        exercise.setFocusArea(rs.getString("focus_area"));
                        exercise.setDescription(rs.getString("description"));
                        exercise.setVideoUrl(rs.getString("video_url"));
                        exercise.setStatus("Assigned");
                        exercises.add(exercise);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("ERROR WHILE GETTING PATIENT EXERCISES:");
            e.printStackTrace();
        }

        return exercises;
    }

    public int countExercisesByPatientId(int patientId) {
        String sql = "SELECT COUNT(*) FROM exercise WHERE patient_id = ?";

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return 0;

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, patientId);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            System.out.println("ERROR WHILE COUNTING PATIENT EXERCISES:");
            e.printStackTrace();
        }

        return 0;
    }

    public ExerciseModel searchExercise(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) return null;

        String sql = "SELECT exercise_id, patient_id, exercise_name, focus_area, description, video_url "
                   + "FROM exercise "
                   + "WHERE exercise_name LIKE ? OR focus_area LIKE ? OR description LIKE ? "
                   + "ORDER BY exercise_id DESC LIMIT 1";

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return null;

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                String pattern = "%" + keyword.trim() + "%";
                ps.setString(1, pattern);
                ps.setString(2, pattern);
                ps.setString(3, pattern);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        ExerciseModel exercise = new ExerciseModel();
                        exercise.setExerciseId(rs.getInt("exercise_id"));
                        int pid = rs.getInt("patient_id");
                        exercise.setPatientId(rs.wasNull() ? null : pid);
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

    private boolean hasColumn(Connection conn, String tableName, String columnName) {
        try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM " + tableName + " LIMIT 0")) {
            ResultSetMetaData md = ps.getMetaData();
            for (int i = 1; i <= md.getColumnCount(); i++) {
                if (columnName.equalsIgnoreCase(md.getColumnName(i))) return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private String getSafeText(String value) {
        return value == null ? "" : value;
    }
}
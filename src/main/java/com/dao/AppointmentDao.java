package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

import com.model.AppointmentModel;
import com.utils.DBconfig;

public class AppointmentDao {

    public AppointmentDao() {
        createTableIfNotExists();
        checkAndSeedStaffTable();
    }

    private void createTableIfNotExists() {
        String sql = "CREATE TABLE IF NOT EXISTS appointment ("
                + "appointment_id INT AUTO_INCREMENT PRIMARY KEY, "
                + "patient_id INT NOT NULL, "
                + "staff_id INT NOT NULL, "
                + "appointment_date DATE NOT NULL, "
                + "appointment_time TIME NOT NULL, "
                + "reason VARCHAR(255) NOT NULL, "
                + "status VARCHAR(50) DEFAULT 'Pending', "
                + "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, "
                + "FOREIGN KEY (patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE"
                + ")";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            if (conn != null) {
                ps.executeUpdate();
                System.out.println("Appointment table verified/created successfully.");
            }
        } catch (Exception e) {
            System.out.println("ERROR CREATING APPOINTMENT TABLE:");
            e.printStackTrace();
        }
    }

    private void checkAndSeedStaffTable() {
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return;
            
            // 1. Check if staff table exists and is empty
            boolean hasRows = false;
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM staff");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    hasRows = true;
                }
            } catch (SQLException e) {
                System.out.println("Staff table count check failed: " + e.getMessage());
                return;
            }

            if (!hasRows) {
                System.out.println("Staff table is empty! Seeding default staff member...");
                
                // 2. Query column names dynamically from metadata
                ArrayList<String> cols = new ArrayList<>();
                ArrayList<String> types = new ArrayList<>();
                try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM staff LIMIT 1");
                     ResultSet rs = ps.executeQuery()) {
                    java.sql.ResultSetMetaData md = rs.getMetaData();
                    int count = md.getColumnCount();
                    for (int i = 1; i <= count; i++) {
                        cols.add(md.getColumnName(i));
                        types.add(md.getColumnTypeName(i));
                        System.out.println("Staff Column: " + md.getColumnName(i) + " (" + md.getColumnTypeName(i) + ")");
                    }
                }

                // 3. Construct insert SQL
                if (!cols.isEmpty()) {
                    StringBuilder sqlInsert = new StringBuilder("INSERT INTO staff (");
                    StringBuilder valuesPlaceholders = new StringBuilder("VALUES (");
                    for (int i = 0; i < cols.size(); i++) {
                        sqlInsert.append("`").append(cols.get(i)).append("`");
                        valuesPlaceholders.append("?");
                        if (i < cols.size() - 1) {
                            sqlInsert.append(", ");
                            valuesPlaceholders.append(", ");
                        }
                    }
                    sqlInsert.append(") ").append(valuesPlaceholders).append(")");

                    try (PreparedStatement psInsert = conn.prepareStatement(sqlInsert.toString())) {
                        for (int i = 0; i < cols.size(); i++) {
                            String colName = cols.get(i).toLowerCase();
                            String colType = types.get(i).toUpperCase();
                            int paramIdx = i + 1;

                            if (colName.contains("id")) {
                                psInsert.setInt(paramIdx, 1);
                            } else if (colType.contains("INT")) {
                                psInsert.setInt(paramIdx, 1);
                            } else if (colType.contains("VARCHAR") || colType.contains("TEXT") || colType.contains("CHAR")) {
                                if (colName.contains("name")) {
                                    psInsert.setString(paramIdx, "Dr. Emily Chen");
                                } else if (colName.contains("email")) {
                                    psInsert.setString(paramIdx, "emily.chen@motionrehab.com");
                                } else if (colName.contains("phone")) {
                                    psInsert.setString(paramIdx, "+1 (555) 0199");
                                } else if (colName.contains("pass") || colName.contains("word")) {
                                    psInsert.setString(paramIdx, "staff123");
                                } else if (colName.contains("user")) {
                                    psInsert.setString(paramIdx, "emily123");
                                } else {
                                    psInsert.setString(paramIdx, "Default");
                                }
                            } else if (colType.contains("DATE")) {
                                psInsert.setDate(paramIdx, new Date(System.currentTimeMillis()));
                            } else if (colType.contains("TIMESTAMP")) {
                                psInsert.setTimestamp(paramIdx, new java.sql.Timestamp(System.currentTimeMillis()));
                            } else {
                                psInsert.setNull(paramIdx, java.sql.Types.VARCHAR);
                            }
                        }
                        int rowsInserted = psInsert.executeUpdate();
                        System.out.println("Auto-seeded default staff member (ID: 1). Rows affected: " + rowsInserted);
                    } catch (SQLException ex) {
                        System.out.println("Failed to auto-seed staff table: " + ex.getMessage());
                    }
                }
            } else {
                System.out.println("Staff table already has records. Skipping seed.");
            }
        } catch (Exception e) {
            System.out.println("Error during staff check/seed: " + e.getMessage());
        }
    }

    public ArrayList<String[]> getAvailableStaff() {
        ArrayList<String[]> staffList = new ArrayList<>();
        String sql = "SELECT * FROM staff";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            java.sql.ResultSetMetaData md = rs.getMetaData();
            int colCount = md.getColumnCount();
            
            // Find name and id columns
            int idColIndex = 1;
            int nameColIndex = -1;
            
            // First look for exact match for primary staff ID column
            for (int i = 1; i <= colCount; i++) {
                String colName = md.getColumnName(i).toLowerCase();
                if (colName.equals("staff_id")) {
                    idColIndex = i;
                    break;
                }
            }
            
            // If not found, fall back to general ID search (excluding admin_id)
            if (idColIndex == 1) {
                for (int i = 1; i <= colCount; i++) {
                    String colName = md.getColumnName(i).toLowerCase();
                    if (colName.contains("id") && !colName.equals("admin_id")) {
                        idColIndex = i;
                        break;
                    }
                }
            }
            
            // Look for exact name column matches
            for (int i = 1; i <= colCount; i++) {
                String colName = md.getColumnName(i).toLowerCase();
                if (colName.equals("staff_name") || colName.equals("name")) {
                    nameColIndex = i;
                    break;
                }
            }
            
            // Fallback name search
            if (nameColIndex == -1) {
                for (int i = 1; i <= colCount; i++) {
                    String colName = md.getColumnName(i).toLowerCase();
                    if (colName.contains("name")) {
                        nameColIndex = i;
                        break;
                    }
                }
            }

            while (rs.next()) {
                String id = String.valueOf(rs.getInt(idColIndex));
                String name = nameColIndex != -1 ? rs.getString(nameColIndex) : "Staff Member #" + id;
                staffList.add(new String[]{id, name});
            }
        } catch (Exception e) {
            System.out.println("Error fetching available staff members: " + e.getMessage());
        }
        
        // If query failed or table is still empty, return a fallback so form doesn't break
        if (staffList.isEmpty()) {
            staffList.add(new String[]{"1", "Dr. Emily Chen"});
        }
        return staffList;
    }

    public boolean addAppointment(AppointmentModel appt) throws SQLException {
        String sql = "INSERT INTO appointment (patient_id, staff_id, appointment_date, appointment_time, reason, status) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) throw new SQLException("Database connection is null.");

            ps.setInt(1, appt.getPatientId());
            ps.setInt(2, appt.getStaffId());
            ps.setDate(3, appt.getAppointmentDate());
            ps.setTime(4, appt.getAppointmentTime());
            ps.setString(5, appt.getReason());
            ps.setString(6, appt.getStatus());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            System.out.println("ERROR ADDING APPOINTMENT:");
            e.printStackTrace();
            throw e;
        }
    }

    public ArrayList<AppointmentModel> getAllAppointments() {
        ArrayList<AppointmentModel> list = new ArrayList<>();
        String sql = "SELECT a.*, p.patient_name FROM appointment a "
                + "JOIN patient p ON a.patient_id = p.patient_id "
                + "ORDER BY a.appointment_date DESC, a.appointment_time DESC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (conn == null) return list;

            while (rs.next()) {
                AppointmentModel appt = new AppointmentModel();
                appt.setAppointmentId(rs.getInt("appointment_id"));
                appt.setPatientId(rs.getInt("patient_id"));
                appt.setPatientName(rs.getString("patient_name"));
                appt.setStaffId(rs.getInt("staff_id"));
                appt.setAppointmentDate(rs.getDate("appointment_date"));
                appt.setAppointmentTime(rs.getTime("appointment_time"));
                appt.setReason(rs.getString("reason"));
                appt.setStatus(rs.getString("status"));
                appt.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(appt);
            }

        } catch (Exception e) {
            System.out.println("ERROR FETCHING ALL APPOINTMENTS:");
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<AppointmentModel> getAppointmentsByPatientId(int patientId) {
        ArrayList<AppointmentModel> list = new ArrayList<>();
        String sql = "SELECT a.*, p.patient_name FROM appointment a "
                + "JOIN patient p ON a.patient_id = p.patient_id "
                + "WHERE a.patient_id = ? "
                + "ORDER BY a.appointment_date DESC, a.appointment_time DESC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) return list;
            ps.setInt(1, patientId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    AppointmentModel appt = new AppointmentModel();
                    appt.setAppointmentId(rs.getInt("appointment_id"));
                    appt.setPatientId(rs.getInt("patient_id"));
                    appt.setPatientName(rs.getString("patient_name"));
                    appt.setStaffId(rs.getInt("staff_id"));
                    appt.setAppointmentDate(rs.getDate("appointment_date"));
                    appt.setAppointmentTime(rs.getTime("appointment_time"));
                    appt.setReason(rs.getString("reason"));
                    appt.setStatus(rs.getString("status"));
                    appt.setCreatedAt(rs.getTimestamp("created_at"));
                    list.add(appt);
                }
            }

        } catch (Exception e) {
            System.out.println("ERROR FETCHING PATIENT APPOINTMENTS:");
            e.printStackTrace();
        }
        return list;
    }

    public AppointmentModel getAppointmentById(int id) {
        String sql = "SELECT a.*, p.patient_name FROM appointment a "
                + "JOIN patient p ON a.patient_id = p.patient_id "
                + "WHERE a.appointment_id = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) return null;
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    AppointmentModel appt = new AppointmentModel();
                    appt.setAppointmentId(rs.getInt("appointment_id"));
                    appt.setPatientId(rs.getInt("patient_id"));
                    appt.setPatientName(rs.getString("patient_name"));
                    appt.setStaffId(rs.getInt("staff_id"));
                    appt.setAppointmentDate(rs.getDate("appointment_date"));
                    appt.setAppointmentTime(rs.getTime("appointment_time"));
                    appt.setReason(rs.getString("reason"));
                    appt.setStatus(rs.getString("status"));
                    appt.setCreatedAt(rs.getTimestamp("created_at"));
                    return appt;
                }
            }

        } catch (Exception e) {
            System.out.println("ERROR FETCHING APPOINTMENT BY ID:");
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateAppointment(AppointmentModel appt) throws SQLException {
        String sql = "UPDATE appointment SET patient_id = ?, staff_id = ?, appointment_date = ?, "
                + "appointment_time = ?, reason = ?, status = ? "
                + "WHERE appointment_id = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) throw new SQLException("Database connection is null.");

            ps.setInt(1, appt.getPatientId());
            ps.setInt(2, appt.getStaffId());
            ps.setDate(3, appt.getAppointmentDate());
            ps.setTime(4, appt.getAppointmentTime());
            ps.setString(5, appt.getReason());
            ps.setString(6, appt.getStatus());
            ps.setInt(7, appt.getAppointmentId());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            System.out.println("ERROR UPDATING APPOINTMENT:");
            e.printStackTrace();
            throw e;
        }
    }

    public boolean updateStatus(int appointmentId, String status) {
        String sql = "UPDATE appointment SET status = ? WHERE appointment_id = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) return false;

            ps.setString(1, status);
            ps.setInt(2, appointmentId);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            System.out.println("ERROR UPDATING STATUS:");
            e.printStackTrace();
            return false;
        }
    }

    public boolean checkConflict(int patientId, int staffId, Date date, Time time, Integer excludeId) {
        String sql = "SELECT COUNT(*) FROM appointment "
                + "WHERE appointment_date = ? AND appointment_time = ? "
                + "AND (patient_id = ? OR staff_id = ?) "
                + "AND status NOT IN ('Cancelled')";

        if (excludeId != null) {
            sql += " AND appointment_id != " + excludeId;
        }

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) return false;

            ps.setDate(1, date);
            ps.setTime(2, time);
            ps.setInt(3, patientId);
            ps.setInt(4, staffId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }

        } catch (Exception e) {
            System.out.println("ERROR CHECKING APPOINTMENT CONFLICT:");
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteAppointment(int appointmentId) {
        String sql = "DELETE FROM appointment WHERE appointment_id = ?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            if (conn == null) return false;
            ps.setInt(1, appointmentId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.out.println("ERROR DELETING APPOINTMENT BY ID " + appointmentId + ": " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}

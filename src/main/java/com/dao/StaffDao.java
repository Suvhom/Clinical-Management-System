package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.StaffModel;
import com.utils.DBconfig;

public class StaffDao {
    
    private String nameColName = "staff_name";
    private String phoneColName = "phone";

    public StaffDao() {
        verifyAndMigrateStaffTable();
    }

    private void verifyAndMigrateStaffTable() {
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return;

            // 1. Check if staff table exists. If not, create it.
            boolean tableExists = false;
            try (ResultSet tables = conn.getMetaData().getTables(null, null, "staff", null)) {
                if (tables.next()) {
                    tableExists = true;
                }
            }

            if (!tableExists) {
                String createSql = "CREATE TABLE staff ("
                        + "staff_id INT AUTO_INCREMENT PRIMARY KEY, "
                        + "staff_name VARCHAR(150) NOT NULL, "
                        + "specialization VARCHAR(150), "
                        + "qualification VARCHAR(150), "
                        + "phone VARCHAR(20), "
                        + "email VARCHAR(100), "
                        + "experience INT DEFAULT 0, "
                        + "gender VARCHAR(20), "
                        + "address VARCHAR(255), "
                        + "status VARCHAR(50) DEFAULT 'Active', "
                        + "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP"
                        + ")";
                try (PreparedStatement ps = conn.prepareStatement(createSql)) {
                    ps.executeUpdate();
                    System.out.println("Staff table created successfully.");
                }
                return;
            }

            // 2. If table exists, inspect columns and alter if missing
            ArrayList<String> existingCols = new ArrayList<>();
            try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM staff LIMIT 1");
                 ResultSet rs = ps.executeQuery()) {
                java.sql.ResultSetMetaData md = rs.getMetaData();
                int count = md.getColumnCount();
                for (int i = 1; i <= count; i++) {
                    existingCols.add(md.getColumnName(i).toLowerCase());
                }
            }

            // Check and alter missing columns
            checkAndAddColumn(conn, existingCols, "specialization", "VARCHAR(150)");
            checkAndAddColumn(conn, existingCols, "qualification", "VARCHAR(150)");
            checkAndAddColumn(conn, existingCols, "email", "VARCHAR(100)");
            checkAndAddColumn(conn, existingCols, "experience", "INT DEFAULT 0");
            checkAndAddColumn(conn, existingCols, "gender", "VARCHAR(20)");
            checkAndAddColumn(conn, existingCols, "address", "VARCHAR(255)");
            checkAndAddColumn(conn, existingCols, "status", "VARCHAR(50) DEFAULT 'Active'");

            // Check if name column name is different
            if (existingCols.contains("name")) {
                nameColName = "name";
                System.out.println("Mapped staff table name field to existing column: 'name'");
            } else if (!existingCols.contains("staff_name")) {
                addColumnDirectly(conn, "staff_name", "VARCHAR(150)");
                nameColName = "staff_name";
            } else {
                nameColName = "staff_name";
            }

            // Check if phone column name is different
            if (existingCols.contains("phone_number")) {
                phoneColName = "phone_number";
                System.out.println("Mapped staff table phone field to existing column: 'phone_number'");
            } else if (!existingCols.contains("phone")) {
                addColumnDirectly(conn, "phone", "VARCHAR(20)");
                phoneColName = "phone";
            } else {
                phoneColName = "phone";
            }

        } catch (Exception e) {
            System.out.println("ERROR VERIFYING/MIGRATING STAFF TABLE:");
            e.printStackTrace();
        }
    }

    private void checkAndAddColumn(Connection conn, ArrayList<String> existingCols, String colName, String colType) throws SQLException {
        if (!existingCols.contains(colName.toLowerCase())) {
            addColumnDirectly(conn, colName, colType);
        }
    }

    private void addColumnDirectly(Connection conn, String colName, String colType) throws SQLException {
        String sql = "ALTER TABLE staff ADD COLUMN `" + colName + "` " + colType;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.executeUpdate();
            System.out.println("Staff table column added: " + colName);
        }
    }

    private StaffModel mapRow(ResultSet rs) throws SQLException {
        StaffModel staff = new StaffModel();
        
        java.sql.ResultSetMetaData md = rs.getMetaData();
        int colCount = md.getColumnCount();
        ArrayList<String> cols = new ArrayList<>();
        for (int i = 1; i <= colCount; i++) {
            cols.add(md.getColumnName(i).toLowerCase());
        }

        staff.setStaffId(rs.getInt("staff_id"));

        if (cols.contains("staff_name")) {
            staff.setStaffName(rs.getString("staff_name"));
        } else if (cols.contains("name")) {
            staff.setStaffName(rs.getString("name"));
        }

        if (cols.contains("specialization")) {
            staff.setSpecialization(rs.getString("specialization"));
        }
        if (cols.contains("qualification")) {
            staff.setQualification(rs.getString("qualification"));
        }

        if (cols.contains("phone")) {
            staff.setPhone(rs.getString("phone"));
        } else if (cols.contains("phone_number")) {
            staff.setPhone(rs.getString("phone_number"));
        }

        if (cols.contains("email")) {
            staff.setEmail(rs.getString("email"));
        }
        if (cols.contains("experience")) {
            staff.setExperience(rs.getInt("experience"));
        }
        if (cols.contains("gender")) {
            staff.setGender(rs.getString("gender"));
        }
        if (cols.contains("address")) {
            staff.setAddress(rs.getString("address"));
        }
        if (cols.contains("status")) {
            staff.setStatus(rs.getString("status"));
        }
        if (cols.contains("created_at")) {
            staff.setCreatedAt(rs.getTimestamp("created_at"));
        }
        
        // Map workload count if present in query join results
        try {
            staff.setActiveAppointmentsCount(rs.getInt("active_appts"));
        } catch (SQLException e) {
            // Not joined, ignore
        }

        return staff;
    }

    public boolean addStaff(StaffModel staff) throws SQLException {
        String sql = "INSERT INTO staff (" + nameColName + ", specialization, qualification, " 
                + phoneColName + ", email, experience, gender, address, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) throw new SQLException("Database connection is null.");

            ps.setString(1, staff.getStaffName());
            ps.setString(2, staff.getSpecialization());
            ps.setString(3, staff.getQualification());
            ps.setString(4, staff.getPhone());
            ps.setString(5, staff.getEmail());
            ps.setInt(6, staff.getExperience());
            ps.setString(7, staff.getGender());
            ps.setString(8, staff.getAddress());
            ps.setString(9, staff.getStatus());

            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    public ArrayList<StaffModel> getAllStaff() {
        ArrayList<StaffModel> list = new ArrayList<>();
        // Query joins staff with active appointments to display workload metrics
        String sql = "SELECT s.*, COUNT(CASE WHEN a.status NOT IN ('Cancelled', 'Completed') THEN 1 END) AS active_appts "
                + "FROM staff s "
                + "LEFT JOIN appointment a ON s.staff_id = a.staff_id "
                + "GROUP BY s.staff_id "
                + "ORDER BY s.staff_id ASC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (conn == null) return list;

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (Exception e) {
            System.out.println("ERROR GETTING ALL STAFF:");
            e.printStackTrace();
        }
        return list;
    }

    public StaffModel getStaffById(int id) {
        String sql = "SELECT s.*, COUNT(CASE WHEN a.status NOT IN ('Cancelled', 'Completed') THEN 1 END) AS active_appts "
                + "FROM staff s "
                + "LEFT JOIN appointment a ON s.staff_id = a.staff_id "
                + "WHERE s.staff_id = ? "
                + "GROUP BY s.staff_id";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) return null;
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }
        } catch (Exception e) {
            System.out.println("ERROR GETTING STAFF BY ID:");
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateStaff(StaffModel staff) throws SQLException {
        String sql = "UPDATE staff SET " + nameColName + " = ?, specialization = ?, qualification = ?, "
                + phoneColName + " = ?, email = ?, experience = ?, gender = ?, address = ?, status = ? "
                + "WHERE staff_id = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) throw new SQLException("Database connection is null.");

            ps.setString(1, staff.getStaffName());
            ps.setString(2, staff.getSpecialization());
            ps.setString(3, staff.getQualification());
            ps.setString(4, staff.getPhone());
            ps.setString(5, staff.getEmail());
            ps.setInt(6, staff.getExperience());
            ps.setString(7, staff.getGender());
            ps.setString(8, staff.getAddress());
            ps.setString(9, staff.getStatus());
            ps.setInt(10, staff.getStaffId());

            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }
}

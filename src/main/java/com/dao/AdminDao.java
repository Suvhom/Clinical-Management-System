package com.dao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.AdminModel;
import com.utils.DBconfig;

public class AdminDao {
    private String lastErrorMessage = "";

    public AdminDao() {
        verifyAdminTable();
    }

    public String getLastErrorMessage() {
        return lastErrorMessage;
    }

    private void setLastError(Exception e) {
        lastErrorMessage = e == null ? "" : e.getMessage();
    }

    private void verifyAdminTable() {
        String createSql = "CREATE TABLE IF NOT EXISTS admin ("
                + "admin_id INT AUTO_INCREMENT PRIMARY KEY, "
                + "username VARCHAR(100) NOT NULL UNIQUE, "
                + "password VARCHAR(255) NOT NULL, "
                + "full_name VARCHAR(150), "
                + "email VARCHAR(150), "
                + "phone VARCHAR(50), "
                + "address VARCHAR(255)"
                + ")";

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return;

            try (Statement stmt = conn.createStatement()) {
                stmt.executeUpdate(createSql);
            }

            addColumnIfMissing(conn, "username", "VARCHAR(100)");
            addColumnIfMissing(conn, "password", "VARCHAR(255)");
            addColumnIfMissing(conn, "full_name", "VARCHAR(150)");
            addColumnIfMissing(conn, "email", "VARCHAR(150)");
            addColumnIfMissing(conn, "phone", "VARCHAR(50)");
            addColumnIfMissing(conn, "address", "VARCHAR(255)");
            ensureColumnCanStore(conn, "username", 100);
            ensureColumnCanStore(conn, "password", 255);
            ensureAdminIdAutoIncrement(conn);

        } catch (Exception e) {
            setLastError(e);
            System.out.println("ERROR VERIFYING ADMIN TABLE:");
            e.printStackTrace();
        }
    }

    private void addColumnIfMissing(Connection conn, String columnName, String columnType) throws Exception {
        if (columnExists(conn, columnName)) {
            return;
        }

        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate("ALTER TABLE admin ADD COLUMN " + columnName + " " + columnType);
        }
    }

    private void resizeColumnIfExists(Connection conn, String columnName, String columnType) throws Exception {
        if (!columnExists(conn, columnName)) {
            return;
        }

        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate("ALTER TABLE admin MODIFY COLUMN " + columnName + " " + columnType);
        }
    }

    private void ensureColumnCanStore(Connection conn, String columnName, int minLength) throws Exception {
        if (!columnExists(conn, columnName)) {
            return;
        }

        DatabaseMetaData metaData = conn.getMetaData();
        try (ResultSet rs = metaData.getColumns(conn.getCatalog(), null, "admin", columnName)) {
            if (rs.next()) {
                int currentSize = rs.getInt("COLUMN_SIZE");
                if (currentSize < minLength) {
                    resizeColumnIfExists(conn, columnName, "VARCHAR(" + minLength + ")");
                }
            }
        }
    }

    private boolean columnExists(Connection conn, String columnName) throws Exception {
        DatabaseMetaData metaData = conn.getMetaData();
        try (ResultSet rs = metaData.getColumns(conn.getCatalog(), null, "admin", columnName)) {
            if (rs.next()) {
                return true;
            }
        }

        try (PreparedStatement ps = conn.prepareStatement("SELECT admin_id FROM admin LIMIT 1");
             ResultSet rs = ps.executeQuery()) {
            java.sql.ResultSetMetaData rowMetaData = rs.getMetaData();
            for (int i = 1; i <= rowMetaData.getColumnCount(); i++) {
                if (columnName.equalsIgnoreCase(rowMetaData.getColumnName(i))) {
                    return true;
                }
            }
        }

        return false;
    }

    private void ensureAdminIdAutoIncrement(Connection conn) {
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate("ALTER TABLE admin MODIFY COLUMN admin_id INT AUTO_INCREMENT");
        } catch (Exception e) {
            System.out.println("ADMIN ID AUTO_INCREMENT CHECK SKIPPED:");
            System.out.println(e.getMessage());
        }
    }

    private AdminModel mapRow(ResultSet rs) throws Exception {
        AdminModel admin = new AdminModel();
        admin.setAdminId(rs.getInt("admin_id"));
        admin.setUsername(rs.getString("username"));
        admin.setPassword(rs.getString("password"));
        admin.setFullName(rs.getString("full_name"));
        admin.setEmail(rs.getString("email"));
        admin.setPhone(rs.getString("phone"));
        admin.setAddress(rs.getString("address"));
        return admin;
    }

    public boolean addAdmin(AdminModel admin) {
        String sql = "INSERT INTO admin (username, password, full_name, email, phone, address) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) return false;

            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());
            ps.setString(3, admin.getFullName());
            ps.setString(4, admin.getEmail());
            ps.setString(5, admin.getPhone());
            ps.setString(6, admin.getAddress());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            setLastError(e);
            System.out.println("ERROR ADDING ADMIN:");
            e.printStackTrace();
            return false;
        }
    }

    public boolean usernameExists(String username) {
        String sql = "SELECT COUNT(*) FROM admin WHERE username = ?";

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return false;

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, username);

                try (ResultSet rs = ps.executeQuery()) {
                    return rs.next() && rs.getInt(1) > 0;
                }
            }

        } catch (Exception e) {
            setLastError(e);
            System.out.println("ERROR CHECKING ADMIN USERNAME:");
            e.printStackTrace();
            return false;
        }
    }

    public boolean usernameExistsForAnotherAdmin(String username, int adminId) {
        String sql = "SELECT COUNT(*) FROM admin WHERE username = ? AND admin_id <> ?";

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return false;

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, username);
                ps.setInt(2, adminId);

                try (ResultSet rs = ps.executeQuery()) {
                    return rs.next() && rs.getInt(1) > 0;
                }
            }

        } catch (Exception e) {
            setLastError(e);
            System.out.println("ERROR CHECKING ADMIN USERNAME:");
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<AdminModel> getAllAdmins() {
        ArrayList<AdminModel> admins = new ArrayList<>();
        String sql = "SELECT admin_id, username, password, full_name, email, phone, address "
                + "FROM admin ORDER BY admin_id ASC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (conn == null) return admins;

            while (rs.next()) {
                admins.add(mapRow(rs));
            }

        } catch (Exception e) {
            setLastError(e);
            System.out.println("ERROR GETTING ALL ADMINS:");
            e.printStackTrace();
        }

        return admins;
    }

    public AdminModel getAdminById(int adminId) {
        String sql = "SELECT admin_id, username, password, full_name, email, phone, address "
                + "FROM admin WHERE admin_id = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) return null;

            ps.setInt(1, adminId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (Exception e) {
            setLastError(e);
            System.out.println("ERROR GETTING ADMIN BY ID:");
            e.printStackTrace();
        }

        return null;
    }

    public boolean updateAdmin(AdminModel admin) {
        String sql = "UPDATE admin SET username = ?, password = ?, full_name = ?, email = ?, "
                + "phone = ?, address = ? WHERE admin_id = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) return false;

            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());
            ps.setString(3, admin.getFullName());
            ps.setString(4, admin.getEmail());
            ps.setString(5, admin.getPhone());
            ps.setString(6, admin.getAddress());
            ps.setInt(7, admin.getAdminId());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            setLastError(e);
            System.out.println("ERROR UPDATING ADMIN:");
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteAdmin(int adminId) {
        String sql = "DELETE FROM admin WHERE admin_id = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) return false;

            ps.setInt(1, adminId);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            setLastError(e);
            System.out.println("ERROR DELETING ADMIN:");
            e.printStackTrace();
            return false;
        }
    }
}

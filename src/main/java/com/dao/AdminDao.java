package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.AdminModel;
import com.utils.DBconfig;

public class AdminDao {

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
            System.out.println("ERROR ADDING ADMIN:");
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
            System.out.println("ERROR DELETING ADMIN:");
            e.printStackTrace();
            return false;
        }
    }
}

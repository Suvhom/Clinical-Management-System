package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import com.utils.DBconfig;

public class DashboardDao {

    public DashboardDao() {
        createActivityLogTableIfNotExists();
    }

    private void createActivityLogTableIfNotExists() {
        String sql = "CREATE TABLE IF NOT EXISTS activity_log ("
                + "activity_id INT AUTO_INCREMENT PRIMARY KEY, "
                + "message VARCHAR(255) NOT NULL, "
                + "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP"
                + ")";
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Map<String, Integer> getGenderDistribution() {
        Map<String, Integer> data = new LinkedHashMap<>();
        String sql = "SELECT gender, COUNT(*) as count FROM patient WHERE gender IS NOT NULL GROUP BY gender";
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return data;
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    data.put(rs.getString("gender"), rs.getInt("count"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public Map<String, Integer> getAppointmentStatusDistribution() {
        Map<String, Integer> data = new LinkedHashMap<>();
        String sql = "SELECT status, COUNT(*) as count FROM appointment GROUP BY status";
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return data;
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    data.put(rs.getString("status"), rs.getInt("count"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public Map<String, Integer> getTreatmentDistribution() {
        Map<String, Integer> data = new LinkedHashMap<>();
        String sql = "SELECT reason, COUNT(*) as count FROM appointment GROUP BY reason";
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return data;
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    data.put(rs.getString("reason"), rs.getInt("count"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public Map<String, Integer> getPatientGrowth() {
        Map<String, Integer> data = new LinkedHashMap<>();
        String sql = "SELECT MONTHNAME(created_at) as month, COUNT(*) as count FROM patient "
                   + "WHERE created_at IS NOT NULL GROUP BY MONTH(created_at) ORDER BY MONTH(created_at)";
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return data;
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String month = rs.getString("month");
                    if (month != null) {
                        data.put(month.substring(0, 3), rs.getInt("count"));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public Map<String, Integer> getAppointmentsTrend() {
        Map<String, Integer> data = new LinkedHashMap<>();
        String sql = "SELECT MONTHNAME(appointment_date) as month, COUNT(*) as count FROM appointment "
                   + "GROUP BY MONTH(appointment_date) ORDER BY MONTH(appointment_date)";
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return data;
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String month = rs.getString("month");
                    if (month != null) {
                        data.put(month.substring(0, 3), rs.getInt("count"));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public Map<String, Integer> getStaffWorkloads() {
        Map<String, Integer> data = new LinkedHashMap<>();
        HashMap<Integer, String> staffNames = new HashMap<>();

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return data;

            try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM staff");
                 ResultSet rs = ps.executeQuery()) {
                java.sql.ResultSetMetaData md = rs.getMetaData();
                int count = md.getColumnCount();
                int idIndex = 1;
                int nameIndex = -1;
                for (int i = 1; i <= count; i++) {
                    String col = md.getColumnName(i).toLowerCase();
                    if (col.equals("staff_id")) idIndex = i;
                    if (col.equals("staff_name") || col.equals("name")) nameIndex = i;
                }
                if (nameIndex == -1) {
                    for (int i = 1; i <= count; i++) {
                        if (md.getColumnName(i).toLowerCase().contains("name")) nameIndex = i;
                    }
                }
                while (rs.next()) {
                    int id = rs.getInt(idIndex);
                    String name = nameIndex != -1 ? rs.getString(nameIndex) : "Staff ST-" + id;
                    staffNames.put(id, name);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String workloadSql = "SELECT staff_id, COUNT(*) as count FROM appointment "
                           + "WHERE status NOT IN ('Cancelled', 'Completed') GROUP BY staff_id";
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return data;
            try (PreparedStatement ps = conn.prepareStatement(workloadSql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int staffId = rs.getInt("staff_id");
                    String name = staffNames.getOrDefault(staffId, "Staff member ST-" + staffId);
                    data.put(name, rs.getInt("count"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public Map<String, Integer> getMonthlyRevenue() {
        Map<String, Integer> data = new LinkedHashMap<>();
        String sql = "SELECT MONTHNAME(appointment_date) as month, "
                   + "SUM(CASE "
                   + "  WHEN status = 'Completed' THEN 2500 "
                   + "  WHEN status IN ('Confirmed', 'Rescheduled') THEN 2000 "
                   + "  WHEN status = 'Pending' THEN 1500 "
                   + "  ELSE 0 END) as revenue "
                   + "FROM appointment GROUP BY MONTH(appointment_date) ORDER BY MONTH(appointment_date)";
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return data;
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String month = rs.getString("month");
                    if (month != null) {
                        data.put(month.substring(0, 3), rs.getInt("revenue"));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public Map<String, Integer> getPaymentStatusDistribution() {
        Map<String, Integer> data = new LinkedHashMap<>();
        String sql = "SELECT "
                   + "SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) as paid, "
                   + "SUM(CASE WHEN status IN ('Confirmed', 'Rescheduled') THEN 1 ELSE 0 END) as pending, "
                   + "SUM(CASE WHEN status = 'Pending' THEN 1 ELSE 0 END) as overdue "
                   + "FROM appointment";
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return data;
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    data.put("Paid", rs.getInt("paid"));
                    data.put("Pending", rs.getInt("pending"));
                    data.put("Overdue", rs.getInt("overdue"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public Map<String, Integer> getOverviewCounts() {
        Map<String, Integer> counts = new HashMap<>();
        counts.put("totalPatients", 0);
        counts.put("totalStaff", 0);
        counts.put("totalAppointments", 0);
        counts.put("appointmentsToday", 0);
        counts.put("pendingAppointments", 0);
        counts.put("completedAppointments", 0);
        counts.put("cancelledAppointments", 0);
        counts.put("totalRevenue", 0);
        counts.put("monthlyRevenue", 0);
        counts.put("activeDoctors", 0);

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return counts;

            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM patient");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) counts.put("totalPatients", rs.getInt(1));
            }

            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM staff");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) counts.put("totalStaff", rs.getInt(1));
            }

            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM appointment");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) counts.put("totalAppointments", rs.getInt(1));
            }

            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM appointment WHERE appointment_date = CURDATE()");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) counts.put("appointmentsToday", rs.getInt(1));
            }

            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM appointment WHERE status = 'Pending'");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) counts.put("pendingAppointments", rs.getInt(1));
            }

            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM appointment WHERE status = 'Completed'");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) counts.put("completedAppointments", rs.getInt(1));
            }

            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM appointment WHERE status = 'Cancelled'");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) counts.put("cancelledAppointments", rs.getInt(1));
            }

            try (PreparedStatement ps = conn.prepareStatement("SELECT SUM(2500) FROM appointment WHERE status = 'Completed'");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) counts.put("totalRevenue", rs.getInt(1));
            }

            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM staff WHERE status = 'Active'");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) counts.put("activeDoctors", rs.getInt(1));
            }

            String revSql = "SELECT SUM(CASE "
                          + "  WHEN status = 'Completed' THEN 2500 "
                          + "  WHEN status IN ('Confirmed', 'Rescheduled') THEN 2000 "
                          + "  WHEN status = 'Pending' THEN 1500 "
                          + "  ELSE 0 END) "
                          + "FROM appointment WHERE MONTH(appointment_date) = MONTH(CURDATE())";
            try (PreparedStatement ps = conn.prepareStatement(revSql);
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) counts.put("monthlyRevenue", rs.getInt(1));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return counts;
    }

    public Map<String, Integer> getBillingSummaryStats() {
        Map<String, Integer> stats = new HashMap<>();
        stats.put("totalRevenue", 0);
        stats.put("monthlyRevenue", 0);
        stats.put("outstandingBalance", 0);
        stats.put("paidInvoicesCount", 0);

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return stats;

            try (PreparedStatement ps = conn.prepareStatement("SELECT SUM(total_amount) FROM billing WHERE payment_status = 'Paid'");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) stats.put("totalRevenue", rs.getInt(1));
            }

            try (PreparedStatement ps = conn.prepareStatement("SELECT SUM(total_amount) FROM billing WHERE payment_status = 'Paid' AND MONTH(billing_date) = MONTH(CURDATE())");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) stats.put("monthlyRevenue", rs.getInt(1));
            }

            try (PreparedStatement ps = conn.prepareStatement("SELECT SUM(total_amount) FROM billing WHERE payment_status IN ('Pending', 'Overdue')");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) stats.put("outstandingBalance", rs.getInt(1));
            }

            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM billing WHERE payment_status = 'Paid'");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) stats.put("paidInvoicesCount", rs.getInt(1));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return stats;
    }

    public java.util.ArrayList<String[]> getRecentTransactions() {
        java.util.ArrayList<String[]> transactions = new java.util.ArrayList<>();
        String sql = "SELECT b.billing_id, p.patient_name, a.reason, b.billing_date, b.total_amount, b.payment_status "
                   + "FROM billing b "
                   + "JOIN patient p ON b.patient_id = p.patient_id "
                   + "JOIN appointment a ON b.appointment_id = a.appointment_id "
                   + "ORDER BY b.billing_date DESC, b.created_at DESC";
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return transactions;
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String invoiceId = "INV-" + rs.getInt("billing_id");
                    String patientName = rs.getString("patient_name");
                    String reason = rs.getString("reason");
                    java.sql.Date date = rs.getDate("billing_date");
                    String formattedDate = new java.text.SimpleDateFormat("MMM dd, yyyy").format(date);
                    String formattedAmount = "NRP " + java.text.NumberFormat.getInstance().format(rs.getBigDecimal("total_amount"));
                    String status = rs.getString("payment_status");
                    transactions.add(new String[]{invoiceId, patientName, reason, formattedDate, formattedAmount, status});
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transactions;
    }

    public boolean insertActivity(String message) {
        String sql = "INSERT INTO activity_log (message) VALUES (?)";
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return false;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, message);
                return ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static String getFormattedTimeDifference(java.sql.Timestamp timestamp) {
        if (timestamp == null) return "Just now";
        long diff = System.currentTimeMillis() - timestamp.getTime();
        long diffSeconds = diff / 1000;
        long diffMinutes = diff / (60 * 1000) % 60;
        long diffHours = diff / (60 * 60 * 1000) % 24;
        long diffDays = diff / (24 * 60 * 60 * 1000);

        if (diffSeconds < 60) return "Just now";
        if (diffMinutes < 60 && diffHours == 0 && diffDays == 0)
            return diffMinutes + (diffMinutes == 1 ? " min ago" : " mins ago");
        if (diffHours < 24 && diffDays == 0)
            return diffHours + (diffHours == 1 ? " hour ago" : " hours ago");
        return diffDays + (diffDays == 1 ? " day ago" : " days ago");
    }

    public java.util.ArrayList<String[]> getRecentActivities() {
        java.util.ArrayList<String[]> list = new java.util.ArrayList<>();
        String sql = "SELECT message, created_at FROM activity_log ORDER BY created_at DESC, activity_id DESC LIMIT 6";
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return list;
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new String[]{rs.getString("message"), getFormattedTimeDifference(rs.getTimestamp("created_at"))});
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public java.util.ArrayList<String[]> getTodayAppointments() {
        java.util.ArrayList<String[]> list = new java.util.ArrayList<>();
        String staffNameCol = "staff_name";

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return list;
            try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM staff LIMIT 0")) {
                java.sql.ResultSetMetaData md = ps.getMetaData();
                for (int i = 1; i <= md.getColumnCount(); i++) {
                    if (md.getColumnName(i).equalsIgnoreCase("name")) {
                        staffNameCol = "name";
                        break;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            String sql = "SELECT a.appointment_id, p.patient_name, s." + staffNameCol + " as staff_name, "
                       + "a.appointment_time, a.reason, a.status "
                       + "FROM appointment a "
                       + "JOIN patient p ON a.patient_id = p.patient_id "
                       + "LEFT JOIN staff s ON a.staff_id = s.staff_id "
                       + "WHERE a.appointment_date = CURDATE() "
                       + "ORDER BY a.appointment_time ASC";

            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String staffName = rs.getString("staff_name");
                    if (staffName == null) staffName = "Unassigned";
                    String formattedTime = new java.text.SimpleDateFormat("hh:mm a").format(rs.getTime("appointment_time"));
                    list.add(new String[]{
                        String.valueOf(rs.getInt("appointment_id")),
                        rs.getString("patient_name"),
                        staffName,
                        formattedTime,
                        rs.getString("reason"),
                        rs.getString("status")
                    });
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public java.util.ArrayList<String[]> getAvailableStaffWithStatus() {
        java.util.ArrayList<String[]> list = new java.util.ArrayList<>();
        String staffNameCol = "staff_name";
        String phoneCol = "phone";

        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return list;
            try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM staff LIMIT 0")) {
                java.sql.ResultSetMetaData md = ps.getMetaData();
                for (int i = 1; i <= md.getColumnCount(); i++) {
                    String col = md.getColumnName(i).toLowerCase();
                    if (col.equals("name")) staffNameCol = "name";
                    if (col.equals("phone_number")) phoneCol = "phone_number";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            String sql = "SELECT s.staff_id, s." + staffNameCol + " as staff_name, s.specialization, s." + phoneCol + " as phone, s.email, s.status as db_status, "
                       + "(CASE WHEN EXISTS ( "
                       + "    SELECT 1 FROM appointment a "
                       + "    WHERE a.staff_id = s.staff_id "
                       + "    AND a.appointment_date = CURDATE() "
                       + "    AND a.status NOT IN ('Cancelled', 'Completed') "
                       + "    AND ABS(TIMESTAMPDIFF(MINUTE, a.appointment_time, CURRENT_TIME())) < 60 "
                       + ") THEN 'Busy' ELSE 'Available' END) as availability_status "
                       + "FROM staff s "
                       + "WHERE s.status IN ('Active', 'Available') "
                       + "ORDER BY s.staff_id ASC";

            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String spec = rs.getString("specialization");
                    if (spec == null) spec = "General Physiotherapy";
                    String phone = rs.getString("phone");
                    if (phone == null) phone = "-";
                    String email = rs.getString("email");
                    if (email == null) email = "-";
                    list.add(new String[]{
                        String.valueOf(rs.getInt("staff_id")),
                        rs.getString("staff_name"),
                        spec,
                        phone,
                        email,
                        rs.getString("availability_status")
                    });
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
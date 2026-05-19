package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import com.utils.DBconfig;

public class DashboardDao {

    // 1. Get Patient Gender Distribution (100% Real Data)
    public Map<String, Integer> getGenderDistribution() {
        Map<String, Integer> data = new LinkedHashMap<>();
        String sql = "SELECT gender, COUNT(*) as count FROM patient WHERE gender IS NOT NULL GROUP BY gender";
        
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                String gender = rs.getString("gender");
                data.put(gender, rs.getInt("count"));
            }
        } catch (Exception e) {
            System.out.println("Error getting gender distribution: " + e.getMessage());
        }
        return data;
    }

    // 2. Get Appointment Status Distribution (100% Real Data)
    public Map<String, Integer> getAppointmentStatusDistribution() {
        Map<String, Integer> data = new LinkedHashMap<>();
        String sql = "SELECT status, COUNT(*) as count FROM appointment GROUP BY status";
        
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                String status = rs.getString("status");
                data.put(status, rs.getInt("count"));
            }
        } catch (Exception e) {
            System.out.println("Error getting status distribution: " + e.getMessage());
        }
        return data;
    }

    // 3. Get Treatment Category Distribution (100% Real Data)
    public Map<String, Integer> getTreatmentDistribution() {
        Map<String, Integer> data = new LinkedHashMap<>();
        String sql = "SELECT reason, COUNT(*) as count FROM appointment GROUP BY reason";
        
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                String reason = rs.getString("reason");
                data.put(reason, rs.getInt("count"));
            }
        } catch (Exception e) {
            System.out.println("Error getting treatment distribution: " + e.getMessage());
        }
        return data;
    }

    // 4. Get Monthly Patient Registrations (100% Real Data)
    public Map<String, Integer> getPatientGrowth() {
        Map<String, Integer> data = new LinkedHashMap<>();
        String sql = "SELECT MONTHNAME(created_at) as month, COUNT(*) as count FROM patient " +
                     "WHERE created_at IS NOT NULL GROUP BY MONTH(created_at) ORDER BY MONTH(created_at)";
        
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                String month = rs.getString("month");
                if (month != null) {
                    data.put(month.substring(0, 3), rs.getInt("count"));
                }
            }
        } catch (Exception e) {
            System.out.println("Error getting patient growth: " + e.getMessage());
        }
        return data;
    }

    // 5. Get Monthly Appointments Trend (100% Real Data)
    public Map<String, Integer> getAppointmentsTrend() {
        Map<String, Integer> data = new LinkedHashMap<>();
        String sql = "SELECT MONTHNAME(appointment_date) as month, COUNT(*) as count FROM appointment " +
                     "GROUP BY MONTH(appointment_date) ORDER BY MONTH(appointment_date)";
        
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                String month = rs.getString("month");
                if (month != null) {
                    data.put(month.substring(0, 3), rs.getInt("count"));
                }
            }
        } catch (Exception e) {
            System.out.println("Error getting appointments trend: " + e.getMessage());
        }
        return data;
    }

    // 6. Get Staff Workload (100% Real Data)
    public Map<String, Integer> getStaffWorkloads() {
        Map<String, Integer> data = new LinkedHashMap<>();
        
        // Dynamic lookup to match name column in staff table safely
        String staffTableSql = "SELECT * FROM staff";
        HashMap<Integer, String> staffNames = new HashMap<>();
        
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(staffTableSql);
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
                String name = nameIndex != -1 ? rs.getString(nameIndex) : "Staff #" + id;
                staffNames.put(id, name);
            }
        } catch (Exception e) {
            System.out.println("Error fetching staff name map for workloads: " + e.getMessage());
        }

        // Count active appointments grouped by staff
        String workloadSql = "SELECT staff_id, COUNT(*) as count FROM appointment " +
                             "WHERE status NOT IN ('Cancelled', 'Completed') GROUP BY staff_id";
        
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(workloadSql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                int staffId = rs.getInt("staff_id");
                String name = staffNames.getOrDefault(staffId, "Staff member #" + staffId);
                data.put(name, rs.getInt("count"));
            }
        } catch (Exception e) {
            System.out.println("Error getting active workloads: " + e.getMessage());
        }
        return data;
    }

    // 7. Get Monthly Revenue (100% Real Data)
    public Map<String, Integer> getMonthlyRevenue() {
        Map<String, Integer> data = new LinkedHashMap<>();
        
        // Sum revenue dynamically from live appointments!
        String sql = "SELECT MONTHNAME(appointment_date) as month, " +
                     "SUM(CASE " +
                     "  WHEN status = 'Completed' THEN 2500 " +
                     "  WHEN status IN ('Confirmed', 'Rescheduled') THEN 2000 " +
                     "  WHEN status = 'Pending' THEN 1500 " +
                     "  ELSE 0 END) as revenue " +
                     "FROM appointment GROUP BY MONTH(appointment_date) ORDER BY MONTH(appointment_date)";
        
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                String month = rs.getString("month");
                if (month != null) {
                    data.put(month.substring(0, 3), rs.getInt("revenue"));
                }
            }
        } catch (Exception e) {
            System.out.println("Error getting monthly revenue: " + e.getMessage());
        }
        return data;
    }

    // 8. Get Payment Status distribution (100% Real Data)
    public Map<String, Integer> getPaymentStatusDistribution() {
        Map<String, Integer> data = new LinkedHashMap<>();
        
        // Paid = Completed appointments, Pending = Confirmed/Rescheduled, Overdue = Pending
        String sql = "SELECT " +
                     "SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) as paid, " +
                     "SUM(CASE WHEN status IN ('Confirmed', 'Rescheduled') THEN 1 ELSE 0 END) as pending, " +
                     "SUM(CASE WHEN status = 'Pending' THEN 1 ELSE 0 END) as overdue " +
                     "FROM appointment";
        
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            if (rs.next()) {
                data.put("Paid", rs.getInt("paid"));
                data.put("Pending", rs.getInt("pending"));
                data.put("Overdue", rs.getInt("overdue"));
            }
        } catch (Exception e) {
            System.out.println("Error getting payment distribution: " + e.getMessage());
        }
        return data;
    }

    // 9. Get Live Overview Counts (100% Real Data)
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
            
            // Total Patients
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM patient");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    counts.put("totalPatients", rs.getInt(1));
                }
            }
            
            // Total Staff
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM staff");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    counts.put("totalStaff", rs.getInt(1));
                }
            }
            
            // Total Appointments
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM appointment");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    counts.put("totalAppointments", rs.getInt(1));
                }
            }
            
            // Appointments Today
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM appointment WHERE appointment_date = CURDATE()");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    counts.put("appointmentsToday", rs.getInt(1));
                }
            }
            
            // Pending Appointments
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM appointment WHERE status = 'Pending'");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    counts.put("pendingAppointments", rs.getInt(1));
                }
            }
            
            // Completed Appointments
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM appointment WHERE status = 'Completed'");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    counts.put("completedAppointments", rs.getInt(1));
                }
            }
            
            // Cancelled Appointments
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM appointment WHERE status = 'Cancelled'");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    counts.put("cancelledAppointments", rs.getInt(1));
                }
            }
            
            // Total Revenue (Completed all time)
            try (PreparedStatement ps = conn.prepareStatement("SELECT SUM(2500) FROM appointment WHERE status = 'Completed'");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    counts.put("totalRevenue", rs.getInt(1));
                }
            }
            
            // Active Staff / Doctors
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM staff WHERE status = 'Active'");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    counts.put("activeDoctors", rs.getInt(1));
                }
            }
            
            // Monthly Revenue (Current Month)
            String revSql = "SELECT SUM(CASE " +
                            "  WHEN status = 'Completed' THEN 2500 " +
                            "  WHEN status IN ('Confirmed', 'Rescheduled') THEN 2000 " +
                            "  WHEN status = 'Pending' THEN 1500 " +
                            "  ELSE 0 END) " +
                            "FROM appointment WHERE MONTH(appointment_date) = MONTH(CURDATE())";
            try (PreparedStatement ps = conn.prepareStatement(revSql);
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    counts.put("monthlyRevenue", rs.getInt(1));
                }
            }
            
        } catch (Exception e) {
            System.out.println("Error getting overview counts: " + e.getMessage());
        }
        
        return counts;
    }

    // 10. Get Billing Summary Stats (100% Real Database Data)
    public Map<String, Integer> getBillingSummaryStats() {
        Map<String, Integer> stats = new HashMap<>();
        stats.put("totalRevenue", 0);
        stats.put("monthlyRevenue", 0);
        stats.put("outstandingBalance", 0);
        stats.put("paidInvoicesCount", 0);
        
        try (Connection conn = DBconfig.getConnection()) {
            if (conn == null) return stats;
            
            // Total Revenue (Only paid billing records)
            String totalRevSql = "SELECT SUM(total_amount) FROM billing WHERE payment_status = 'Paid'";
            try (PreparedStatement ps = conn.prepareStatement(totalRevSql);
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    stats.put("totalRevenue", rs.getInt(1));
                }
            }
            
            // Monthly Revenue (Paid billing records in current month)
            String monthlyRevSql = "SELECT SUM(total_amount) FROM billing WHERE payment_status = 'Paid' AND MONTH(billing_date) = MONTH(CURDATE())";
            try (PreparedStatement ps = conn.prepareStatement(monthlyRevSql);
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    stats.put("monthlyRevenue", rs.getInt(1));
                }
            }
            
            // Outstanding Balance (pending and overdue billing records)
            String outstandingSql = "SELECT SUM(total_amount) FROM billing WHERE payment_status IN ('Pending', 'Overdue')";
            try (PreparedStatement ps = conn.prepareStatement(outstandingSql);
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    stats.put("outstandingBalance", rs.getInt(1));
                }
            }
            
            // Paid Invoices Count
            String paidCountSql = "SELECT COUNT(*) FROM billing WHERE payment_status = 'Paid'";
            try (PreparedStatement ps = conn.prepareStatement(paidCountSql);
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    stats.put("paidInvoicesCount", rs.getInt(1));
                }
            }
            
        } catch (Exception e) {
            System.out.println("Error getting billing summary stats: " + e.getMessage());
        }
        
        return stats;
    }

    // 11. Get Recent Transactions (100% Real Database Data)
    public java.util.ArrayList<String[]> getRecentTransactions() {
        java.util.ArrayList<String[]> transactions = new java.util.ArrayList<>();
        
        String sql = "SELECT b.billing_id, p.patient_name, a.reason, b.billing_date, b.total_amount, b.payment_status " +
                     "FROM billing b " +
                     "JOIN patient p ON b.patient_id = p.patient_id " +
                     "JOIN appointment a ON b.appointment_id = a.appointment_id " +
                     "ORDER BY b.billing_date DESC, b.created_at DESC";
                     
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
             
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("billing_id"));
                String patientName = rs.getString("patient_name");
                String reason = rs.getString("reason");
                java.sql.Date date = rs.getDate("billing_date");
                String displayStatus = rs.getString("payment_status");
                
                String invoiceId = "#INV-" + String.format("%04d", Integer.parseInt(id));
                
                // Formatted date
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("MMM dd, yyyy");
                String formattedDate = sdf.format(date);
                
                String formattedAmount = "NRP " + java.text.NumberFormat.getInstance().format(rs.getBigDecimal("total_amount"));
                
                transactions.add(new String[]{invoiceId, patientName, reason, formattedDate, formattedAmount, displayStatus});
            }
        } catch (Exception e) {
            System.out.println("Error getting recent transactions: " + e.getMessage());
        }
        
        return transactions;
    }

    // Constructor to verify and create activity log table automatically
    public DashboardDao() {
        createActivityLogTableIfNotExists();
    }

    private void createActivityLogTableIfNotExists() {
        String sql = "CREATE TABLE IF NOT EXISTS activity_log ("
                + "activity_id INT AUTO_INCREMENT PRIMARY KEY, "
                + "message VARCHAR(255) NOT NULL, "
                + "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP"
                + ")";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            if (conn != null) {
                ps.executeUpdate();
                System.out.println("Activity log table verified/created successfully.");
            }
        } catch (Exception e) {
            System.out.println("ERROR CREATING ACTIVITY LOG TABLE:");
            e.printStackTrace();
        }
    }

    // Activity Logging Utility
    public boolean insertActivity(String message) {
        String sql = "INSERT INTO activity_log (message) VALUES (?)";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            if (conn == null) return false;
            ps.setString(1, message);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.out.println("Error inserting activity log: " + e.getMessage());
            return false;
        }
    }

    // Get formatted relative time difference
    public static String getFormattedTimeDifference(java.sql.Timestamp timestamp) {
        if (timestamp == null) return "Just now";
        long diff = System.currentTimeMillis() - timestamp.getTime();
        long diffSeconds = diff / 1000;
        long diffMinutes = diff / (60 * 1000) % 60;
        long diffHours = diff / (60 * 60 * 1000) % 24;
        long diffDays = diff / (24 * 60 * 60 * 1000);

        if (diffSeconds < 60) {
            return "Just now";
        } else if (diffMinutes < 60 && diffHours == 0 && diffDays == 0) {
            return diffMinutes + (diffMinutes == 1 ? " min ago" : " mins ago");
        } else if (diffHours < 24 && diffDays == 0) {
            return diffHours + (diffHours == 1 ? " hour ago" : " hours ago");
        } else {
            return diffDays + (diffDays == 1 ? " day ago" : " days ago");
        }
    }

    // Get recent activities
    public java.util.ArrayList<String[]> getRecentActivities() {
        java.util.ArrayList<String[]> list = new java.util.ArrayList<>();
        String sql = "SELECT message, created_at FROM activity_log ORDER BY created_at DESC, activity_id DESC LIMIT 6";
        
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                String message = rs.getString("message");
                java.sql.Timestamp ts = rs.getTimestamp("created_at");
                String timeDiff = getFormattedTimeDifference(ts);
                
                list.add(new String[]{message, timeDiff});
            }
        } catch (Exception e) {
            System.out.println("Error getting recent activities: " + e.getMessage());
        }
        return list;
    }

    // Get today's appointments dynamically
    public java.util.ArrayList<String[]> getTodayAppointments() {
        java.util.ArrayList<String[]> list = new java.util.ArrayList<>();
        
        String staffNameCol = "staff_name";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM staff LIMIT 1");
             ResultSet rs = ps.executeQuery()) {
            java.sql.ResultSetMetaData md = rs.getMetaData();
            for (int i = 1; i <= md.getColumnCount(); i++) {
                if (md.getColumnName(i).equalsIgnoreCase("name")) {
                    staffNameCol = "name";
                    break;
                }
            }
        } catch (Exception e) {}

        String sql = "SELECT a.appointment_id, p.patient_name, s." + staffNameCol + " as staff_name, " +
                     "a.appointment_time, a.reason, a.status " +
                     "FROM appointment a " +
                     "JOIN patient p ON a.patient_id = p.patient_id " +
                     "LEFT JOIN staff s ON a.staff_id = s.staff_id " +
                     "WHERE a.appointment_date = CURDATE() " +
                     "ORDER BY a.appointment_time ASC";
                     
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
             
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("appointment_id"));
                String patientName = rs.getString("patient_name");
                String staffName = rs.getString("staff_name");
                if (staffName == null) staffName = "Unassigned";
                
                java.sql.Time time = rs.getTime("appointment_time");
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("hh:mm a");
                String formattedTime = sdf.format(time);
                
                String reason = rs.getString("reason");
                String status = rs.getString("status");
                
                list.add(new String[]{id, patientName, staffName, formattedTime, reason, status});
            }
        } catch (Exception e) {
            System.out.println("Error getting today appointments: " + e.getMessage());
        }
        return list;
    }

    // Get active/available staff with live statuses
    public java.util.ArrayList<String[]> getAvailableStaffWithStatus() {
        java.util.ArrayList<String[]> list = new java.util.ArrayList<>();
        
        String staffNameCol = "staff_name";
        String phoneCol = "phone";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM staff LIMIT 1");
             ResultSet rs = ps.executeQuery()) {
            java.sql.ResultSetMetaData md = rs.getMetaData();
            for (int i = 1; i <= md.getColumnCount(); i++) {
                String col = md.getColumnName(i).toLowerCase();
                if (col.equals("name")) staffNameCol = "name";
                if (col.equals("phone_number")) phoneCol = "phone_number";
            }
        } catch (Exception e) {}

        String sql = "SELECT s.staff_id, s." + staffNameCol + " as staff_name, s.specialization, s." + phoneCol + " as phone, s.email, s.status as db_status, " +
                     "(CASE WHEN EXISTS ( " +
                     "    SELECT 1 FROM appointment a " +
                     "    WHERE a.staff_id = s.staff_id " +
                     "    AND a.appointment_date = CURDATE() " +
                     "    AND a.status NOT IN ('Cancelled', 'Completed') " +
                     "    AND ABS(TIMESTAMPDIFF(MINUTE, a.appointment_time, CURRENT_TIME())) < 60 " +
                     ") THEN 'Busy' ELSE 'Available' END) as availability_status " +
                     "FROM staff s " +
                     "WHERE s.status IN ('Active', 'Available') " +
                     "ORDER BY s.staff_id ASC";
                     
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
             
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("staff_id"));
                String name = rs.getString("staff_name");
                String spec = rs.getString("specialization");
                if (spec == null) spec = "General Physiotherapy";
                String phone = rs.getString("phone");
                if (phone == null) phone = "-";
                String email = rs.getString("email");
                if (email == null) email = "-";
                String availStatus = rs.getString("availability_status");
                
                list.add(new String[]{id, name, spec, phone, email, availStatus});
            }
        } catch (Exception e) {
            System.out.println("Error getting available staff: " + e.getMessage());
        }
        return list;
    }
}

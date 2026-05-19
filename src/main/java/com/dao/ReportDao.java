package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.utils.DBconfig;

public class ReportDao {

	public double getLast30DaysRevenue() throws Exception {
	    Connection con = DBconfig.getConnection();

	    String sql = "SELECT SUM(total_amount) FROM billing "
	               + "WHERE payment_status = 'paid' "
	               + "AND billing_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)";

	    PreparedStatement pst = con.prepareStatement(sql);
	    ResultSet rs = pst.executeQuery();

	    double total = 0;

	    if (rs.next()) {
	        total = rs.getDouble(1);
	    }

	    rs.close();
	    pst.close();
	    con.close();

	    return total;
	}
}
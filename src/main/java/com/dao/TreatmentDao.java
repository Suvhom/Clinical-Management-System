package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.utils.DBconfig;

public class TreatmentDao {

	public int findMatchingFacilityId(String keyword) throws Exception {
	    Connection con = DBconfig.getConnection();

	    String sql = "SELECT treatment_id FROM treatment WHERE treatment_name LIKE ? OR description LIKE ? "
	            + "ORDER BY CASE WHEN treatment_name LIKE ? THEN 1 WHEN description LIKE ? THEN 2 END LIMIT 1";
	    
	    
	    PreparedStatement pst = con.prepareStatement(sql);

	    String searchValue = "%" + keyword + "%";

	    pst.setString(1, searchValue);
	    pst.setString(2, searchValue);
	    pst.setString(3, searchValue);
	    pst.setString(4, searchValue);

	    ResultSet rs = pst.executeQuery();

	    int treatmentId = 0;

	    if (rs.next()) {
	        treatmentId = rs.getInt("treatment_id");
	    }

	    rs.close();
	    pst.close();
	    con.close();

	    return treatmentId;
	}
}
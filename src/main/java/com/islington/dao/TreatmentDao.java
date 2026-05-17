package com.islington.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.islington.utils.DBconfig;

public class TreatmentDao {

    public String searchFacilities(String keyword) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "SELECT * FROM treatment "
                + "WHERE treatment_name LIKE ? OR description LIKE ? "
                + "ORDER BY CASE "
                + "WHEN treatment_name LIKE ? THEN 1 "
                + "WHEN description LIKE ? THEN 2 "
                + "ELSE 3 END";

        PreparedStatement pst = con.prepareStatement(sql);

        String searchValue = "%" + keyword + "%";

        pst.setString(1, searchValue);
        pst.setString(2, searchValue);
        pst.setString(3, searchValue);
        pst.setString(4, searchValue);

        ResultSet rs = pst.executeQuery();

        String result = "";
        boolean found = false;

        while (rs.next()) {
            found = true;

            result += "<div  id='matchedResult' class='facility-row'>"
                    + "<div class='description'>"
                    + "<h3>" + rs.getString("treatment_name") + "</h3>"
                    + "<p>" + rs.getString("description") + "</p>"
                    + "<p><strong>Status:</strong> " + rs.getString("status") + "</p>"
                    + "</div>"
                    + "</div>";
        }

        if (!found) {
            result = "<p>No matching facility found.</p>";
        }

        rs.close();
        pst.close();
        con.close();

        return result;
    }
}
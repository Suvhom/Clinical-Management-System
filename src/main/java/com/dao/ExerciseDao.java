package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.ExerciseModel;
import com.utils.DBconfig;

public class ExerciseDao {

	public ExerciseModel searchExercise(String keyword) throws Exception {

	    Connection con = DBconfig.getConnection();

	    String sql = "SELECT * FROM exercise "
	               + "WHERE exercise_name LIKE ? OR focus_area LIKE ? OR description LIKE ? "
	               + "LIMIT 1";

	    PreparedStatement pst = con.prepareStatement(sql);

	    String searchValue = "%" + keyword + "%";

	    pst.setString(1, searchValue);
	    pst.setString(2, searchValue);
	    pst.setString(3, searchValue);

	    ResultSet rs = pst.executeQuery();

	    ExerciseModel exercise = null;

	    if (rs.next()) {
	        exercise = new ExerciseModel();
	        exercise.setExerciseId(rs.getInt("exercise_id"));
	        exercise.setExerciseName(rs.getString("exercise_name"));
	        exercise.setFocusArea(rs.getString("focus_area"));
	        exercise.setDescription(rs.getString("description"));
	        exercise.setVideoUrl(rs.getString("video_url"));
	    }

	    rs.close();
	    pst.close();
	    con.close();

	    return exercise;
	}


	
}
package com.service;

import com.dao.PatientDao;
import com.model.PatientModel;

public class PatientService {
	 private PatientDao dao = new PatientDao();

	    public PatientModel getStudentByUsername(String username) {
	        try {
	            return dao.getPatientByUsername(username);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	    }

	    public boolean updateImage(String username, String imageBase64) {
	        try {
	            dao.updateImage(username, imageBase64);
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    public boolean updatePassword(String username, String newPassword) {
	        try {
	            dao.updatePassword(username, newPassword);
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
}

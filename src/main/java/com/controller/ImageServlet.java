package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Base64;

import com.model.PatientModel;
import com.service.PatientService;


@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   private PatientService service = new PatientService();

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        try {
	            // 1. Get username from query parameter
	            String username = request.getParameter("username");

	            // 2. Fetch student from DB via service layer
	            PatientModel patient = service.getPatientByUsername(username);

	            // 3. Validate
	            if (patient == null || patient.getImage() == null || patient.getImage().isEmpty()) {
	                return;
	            }

	            // 4. Decode Base64 image string into raw bytes
	            byte[] imageBytes = Base64.getDecoder().decode(patient.getImage());

	            // 5. Set response content type
	            response.setContentType("image/jpeg");

	            // 6. Write bytes to response
	            response.getOutputStream().write(imageBytes);
	            response.getOutputStream().flush();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }
	}

package com.utils;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.http.Part;

public class ImageUtil {
	public String getImageNameFromPart(Part part) {
		String contentDisp = part.getHeader("content-disposition"); // It retrieves the content-disposition header from the part
		String[] items = contentDisp.split(";"); // It splits the header by semicolons to isolate key-value pairs
		String imageName = null; // It initializes the imageName variable to store the extracted file name
		for (String s : items) { // It iterates through the items to find the filename
			if (s.trim().startsWith("filename")) {
				imageName = s.substring(s.indexOf("=") + 2, s.length() - 1); // Extract the file name from the header value
			}
		}
		if (imageName == null || imageName.isEmpty()) { // Check if the filename was not found or is empty
			// It assigns a default file name if none was provided
			imageName = "download.png";
		}
		return imageName; // It returns the extracted or default file name
	}

	 boolean uploadImage(Part part, String rootPath, String saveFolder) {
		String savePath = getSavePath(saveFolder);
		File fileSaveDir = new File(savePath);
		// It ensures that the directory exists
		if (!fileSaveDir.exists()) {
			if (!fileSaveDir.mkdir()) {
				return false; // If failed to create the directory
			}
		}
		try {
			String imageName = getImageNameFromPart(part); // Get the image name
			String filePath = savePath + "/" + imageName; 	// Create the file path
			part.write(filePath); // Write the file to the server
			return true; // Upload successful
		} catch (IOException e) {
			e.printStackTrace(); // Log the exception
			return false; // Upload failed
		}
	}
	
	public String getSavePath(String saveFolder) {
		return "ur absolute/relative path"+saveFolder+"/";
	}
}

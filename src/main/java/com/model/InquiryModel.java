package com.model;

import java.sql.Timestamp;

public class InquiryModel {
    private int inquiryId;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String doctorPreference;
    private String description;
    private Timestamp createdAt;

    public InquiryModel() {
    }

    public InquiryModel(String firstName, String lastName, String email, String phone,
            String doctorPreference, String description) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.doctorPreference = doctorPreference;
        this.description = description;
    }

    public int getInquiryId() {
        return inquiryId;
    }

    public void setInquiryId(int inquiryId) {
        this.inquiryId = inquiryId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDoctorPreference() {
        return doctorPreference;
    }

    public void setDoctorPreference(String doctorPreference) {
        this.doctorPreference = doctorPreference;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}

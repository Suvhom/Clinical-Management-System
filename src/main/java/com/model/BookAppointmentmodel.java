package com.model;

public class BookAppointmentmodel {

    private int appointmentId;
    private int patientId;
    private int staffId;
    private String appointmentDate;
    private String appointmentTime;
    private String reason;
    private String status;
    private String staffName;
    private String specialization;
    private String createdAt;

    public BookAppointmentmodel(int patientId, int staffId, String appointmentDate, String appointmentTime, String reason) {
        this.patientId = patientId;
        this.staffId = staffId;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.reason = reason;
    }

    public BookAppointmentmodel(int appointmentId, int patientId, int staffId, String appointmentDate,
            String appointmentTime, String reason, String status, String staffName, String specialization,
            String createdAt) {
        this.appointmentId = appointmentId;
        this.patientId = patientId;
        this.staffId = staffId;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.reason = reason;
        this.status = status;
        this.staffName = staffName;
        this.specialization = specialization;
        this.createdAt = createdAt;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public int getPatientId() {
        return patientId;
    }

    public int getStaffId() {
        return staffId;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public String getReason() {
        return reason;
    }

    public String getStatus() {
        return status;
    }

    public String getStaffName() {
        return staffName;
    }

    public String getSpecialization() {
        return specialization;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public String getStatusCssClass() {
        if (status == null) {
            return "upcoming";
        }

        String statusValue = status.toLowerCase();

        if (statusValue.equals("completed")) {
            return "completed";
        }

        if (statusValue.equals("cancelled")) {
            return "cancelled";
        }

        return "upcoming";
    }
}

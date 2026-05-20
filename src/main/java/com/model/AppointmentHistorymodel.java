package com.model;

public class AppointmentHistorymodel {

    private int appointmentId;
    private String appointmentDate;
    private String appointmentTime;
    private String reason;
    private String status;
    private String staffName;

    public AppointmentHistorymodel() {
    }

    public AppointmentHistorymodel(int appointmentId, String appointmentDate,
                                   String appointmentTime, String reason,
                                   String status, String staffName) {
        this.appointmentId = appointmentId;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.reason = reason;
        this.status = status;
        this.staffName = staffName;
    }

    public int getAppointmentId() {
        return appointmentId;
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
}
package com.service;

import java.util.List;

import com.dao.AppointmentHistorydao;
import com.model.AppointmentHistorymodel;

public class AppointmentHistoryservice {

    private AppointmentHistorydao dao = new AppointmentHistorydao();

    public List<AppointmentHistorymodel> getAppointmentsByPatientId(int patientId) {
        return dao.getAppointmentsByPatientId(patientId);
    }
}
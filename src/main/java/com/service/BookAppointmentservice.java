package com.service;

import java.util.List;

import com.dao.BookAppointmentdao;
import com.model.BookAppointmentmodel;

public class BookAppointmentservice {

    private BookAppointmentdao dao = new BookAppointmentdao();

    public boolean bookAppointment(BookAppointmentmodel appointment) {
        return dao.insertAppointment(appointment);
    }

    public int getAvailableStaffId() {
        return dao.getAvailableStaffId();
    }

    public List<BookAppointmentmodel> getAppointmentsByPatientId(int patientId) {
        return dao.getAppointmentsByPatientId(patientId);
    }
}

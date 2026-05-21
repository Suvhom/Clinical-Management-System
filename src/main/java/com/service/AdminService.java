package com.service;

import com.dao.AdminDao;
import com.model.AdminModel;
import com.utils.PasswordUtil;

public class AdminService {
    private final AdminDao dao = new AdminDao();

    public AdminModel getAdminByUsername(String username) {
        return dao.getAdminByUsername(username);
    }

    public AdminModel getAdminById(int adminId) {
        return dao.getAdminById(adminId);
    }

    public boolean addAdmin(AdminModel admin) {
        admin.setPassword(PasswordUtil.getHashPassword(admin.getPassword()));
        return dao.addAdmin(admin);
    }

    public boolean updateAdmin(AdminModel admin) {
        admin.setPassword(PasswordUtil.hashIfNeeded(admin.getPassword()));
        return dao.updateAdmin(admin);
    }

    public boolean deleteAdmin(int adminId) {
        return dao.deleteAdmin(adminId);
    }

    public boolean usernameExists(String username) {
        return dao.usernameExists(username);
    }

    public boolean usernameExistsForAnotherAdmin(String username, int adminId) {
        return dao.usernameExistsForAnotherAdmin(username, adminId);
    }
}

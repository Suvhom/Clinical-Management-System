package com.utils;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
    private static final int COST = 10;

    public static String getHashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt(COST));
    }

    public static boolean checkPassword(String inputPassword, String storedPassword) {
        if (inputPassword == null || storedPassword == null) {
            return false;
        }

        if (isBCryptHash(storedPassword)) {
            try {
                return BCrypt.checkpw(inputPassword, normalizeBCryptPrefix(storedPassword));
            } catch (IllegalArgumentException e) {
                return false;
            }
        }

        return inputPassword.equals(storedPassword);
    }

    public static String hashIfNeeded(String password) {
        if (password == null || isBCryptHash(password)) {
            return password;
        }
        return getHashPassword(password);
    }

    private static boolean isBCryptHash(String value) {
        return value.startsWith("$2a$") || value.startsWith("$2b$") || value.startsWith("$2y$");
    }

    private static String normalizeBCryptPrefix(String value) {
        if (value.startsWith("$2b$") || value.startsWith("$2y$")) {
            return "$2a$" + value.substring(4);
        }
        return value;
    }
}

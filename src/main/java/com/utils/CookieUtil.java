package com.utils;

import jakarta.servlet.http.*;

public class CookieUtil {
    private static final int DEFAULT_MAX_AGE = 30 * 60;

    // Create and send a cookie
    public static void setCookie(HttpServletResponse response,
                                  String name, String value, int maxAgeSeconds) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAgeSeconds);
        cookie.setHttpOnly(true);
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    public static void setCookie(HttpServletResponse response, String name, String value) {
        setCookie(response, name, value, DEFAULT_MAX_AGE);
    }

    // Read a cookie value by name
    public static String getCookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (name.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null; // not found
    }

    // Delete a cookie
    public static void deleteCookie(HttpServletResponse response, String name) {
        Cookie cookie = new Cookie(name, "");
        cookie.setMaxAge(0);
        cookie.setHttpOnly(true);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
}

package com.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.model.PatientModel;
import com.dao.PatientDao;

@WebFilter(urlPatterns = {
    "/UserDashboard",
    "/UpdateProfile"
})
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  httpReq  = (HttpServletRequest)  request;
        HttpServletResponse httpResp = (HttpServletResponse) response;

        //Check session
        HttpSession session = httpReq.getSession(false);

        if (session != null && session.getAttribute("patient") != null) {
            chain.doFilter(request, response);
            return;
        }

        // No session and checking cookie
        String usernameFromCookie = null;
        Cookie[] cookies = httpReq.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    usernameFromCookie = cookie.getValue();
                    break;
                }
            }
        }

        if (usernameFromCookie != null) {
            try {
                PatientDao dao = new PatientDao();
                PatientModel patient = dao.getPatientByUsername(usernameFromCookie);

                if (patient != null) {
                    // Rebuild session from cookie
                    HttpSession newSession = httpReq.getSession(true);
                    newSession.setAttribute("patient",    patient);
                    newSession.setAttribute("username",   patient.getUsername());
                    newSession.setAttribute("patient_id", patient.getPatientId());
                    newSession.setMaxInactiveInterval(30 * 60); // 30 minutes

                    chain.doFilter(request, response);
                    return;
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // There is no session, no valid cookie. So, redirect to login
        httpResp.sendRedirect(httpReq.getContextPath() + "/login");
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}
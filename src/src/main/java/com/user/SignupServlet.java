package com.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    @Override
    public void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
        res.setContentType("text/html");

        String idStr = req.getParameter("id");
        String password = req.getParameter("password");
        String subject = req.getParameter("subject");
        String schoolid = req.getParameter("school_id");
        String school_name = req.getParameter("school_name");

        // 1. Validation
        if (idStr == null || idStr.isEmpty() || password == null || password.isEmpty()) {
            res.getWriter().println("ID and Password are required.");
            return;
        }

        int id;
        int school_id = 0;
        
        // 2. Safe Parsing
        try {
            id = Integer.parseInt(idStr);
            if (schoolid != null && !schoolid.trim().isEmpty()) {
                school_id = Integer.parseInt(schoolid);
            }
        } catch (NumberFormatException e) {
            res.getWriter().println("Error: ID and School ID must be numbers.");
            return;
        }

        // 3. Database Execution
        try (Connection con = new DBConnection().getConnection()) {

            // CHECK: Does this ID already exist?
            String checkSql = "SELECT subject_id FROM login WHERE subject_id = ?";
            try (PreparedStatement checkSt = con.prepareStatement(checkSql)) {
                checkSt.setInt(1, id);
                try (ResultSet rs = checkSt.executeQuery()) {
                    if (rs.next()) {
                        // The ID exists! Stop the insert and warn the user.
                        res.getWriter().println("<h3>Error: Account with ID " + id + " already exists!</h3>");
                        res.getWriter().println("<a href='login.html'>Go to Login</a>");
                        return;
                    }
                }
            }

            // INSERT: Safe to create the new user
            // Explicitly naming columns is required in PostgreSQL to avoid ordering errors
            String sql = "INSERT INTO login (subject_id, password, subject, school_id, school_name) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement st = con.prepareStatement(sql)) {
                st.setInt(1, id);
                st.setString(2, password);
                st.setString(3, subject);
                st.setInt(4, school_id);
                st.setString(5, school_name);
                
                st.executeUpdate();
            }

            res.sendRedirect("login.html");

        } catch (Exception e) {
            e.printStackTrace(); // This prints the exact error to Koyeb's logs
            res.getWriter().println("Database Error: " + e.getMessage());
        }
    }
}
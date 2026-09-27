package com.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/TrainerSignupServlet")
public class TrainerSignupServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
	 // Get form parameters
    String trainer_id = req.getParameter("trainer_id");
    String trainer_name = req.getParameter("trainer_name");
    String email = req.getParameter("email");
    String designation = req.getParameter("designation");
    String subject_id_str = req.getParameter("subject_id");
    String password = req.getParameter("password");
    String subject = req.getParameter("subject");
    String status = "Active";

    if (trainer_id == null || trainer_id.isEmpty() ||
        subject_id_str == null || subject_id_str.isEmpty() ||
        password == null || password.isEmpty()) {
        res.getWriter().println("Trainer ID, Subject ID and Password are required");
        return;
    }

    int trainerIdInt, subject_id;
    try {
        trainerIdInt = Integer.parseInt(trainer_id);
    } catch (NumberFormatException e) {
        res.getWriter().println("Trainer ID must be a number");
        return;
    }
    try {
        subject_id = Integer.parseInt(subject_id_str);
    } catch (NumberFormatException e) {
        res.getWriter().println("Subject ID must be a number");
        return;
    }

    try {
    	Connection con = new DBConnection().getConnection();


        // Insert data into trainers table
        String sql = "INSERT INTO trainers VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement st = con.prepareStatement(sql);
       

        st.setInt(1, trainerIdInt);
        st.setString(2, trainer_name);
        st.setString(3, email);
        st.setString(5, designation);
        st.setInt(7, subject_id);
        st.setString(4, password);
        st.setString(8, subject);
        st.setString(6, status);

        st.executeUpdate();
        st.close();
       
     

        // Redirect to login page
        res.sendRedirect("trainerlogin.html");

    } 
    catch (Exception e) {
        e.printStackTrace();
        res.getWriter().println("Signup failed (the Trainer ID or email may already be in use): " + e.getMessage());
    }
	}
}
    
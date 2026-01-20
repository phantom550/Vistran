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
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) {
	 // Get form parameters
    String trainer_id = req.getParameter("trainer_id");
    String trainer_name = req.getParameter("trainer_name");
    String email = req.getParameter("email");
    String designation = req.getParameter("designation");
    String subject_id_str = req.getParameter("subject_id");
    String password = req.getParameter("password");
    String subject = req.getParameter("subject");
    String status = "Active";
    int subject_id = Integer.parseInt(subject_id_str);
    int active = 2; // default value, assuming from .class constants


    try {
    	Connection con = new DBConnection().getConnection();


        // Insert data into trainers table
        String sql = "INSERT INTO trainers VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement st = con.prepareStatement(sql);
       

        st.setInt(1, Integer.parseInt(trainer_id));
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
    }
	}
}
    
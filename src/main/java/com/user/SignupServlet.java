package com.user;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
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
	        String subject=req.getParameter("subject");
	        String schoolid = req.getParameter("school_id");
	        String school_name = req.getParameter("school_name");
	        int school_id=Integer.parseInt(schoolid);

	        // Validation
	        if (idStr == null || idStr.isEmpty() ||
	            password == null || password.isEmpty()) {

	            res.getWriter().println("ID and Password are required");
	            return;
	        }

	        int id;
	        try {
	            id = Integer.parseInt(idStr);
	        } catch (NumberFormatException e) {
	            res.getWriter().println("ID must be a number");
	            return;
	        }

	        try {
	        	Connection con = new DBConnection().getConnection();


	            String sql = "insert into login values(?,?,?,?,?)";
	            PreparedStatement st = con.prepareStatement(sql);
	            st.setInt(1, id);
	            st.setString(2, password);
	            st.setString(3, subject);
	            st.setInt(4, school_id);
	            st.setString(5, school_name);




	           st.executeUpdate();

	           
	            st.close();
	        
	            res.sendRedirect("login.html");

	        } catch (Exception e) {
	            e.printStackTrace();
	            res.getWriter().println("Database Error");
	        }
	 }
	 
}

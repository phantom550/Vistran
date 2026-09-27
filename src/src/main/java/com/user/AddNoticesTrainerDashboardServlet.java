package com.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


@WebServlet("/AddNoticesTrainerDashboardServlet")
public class AddNoticesTrainerDashboardServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String title = req.getParameter("title");
		String description = req.getParameter("description");
	
		
		    HttpSession session = req.getSession(false);
	        Integer school_id = (Integer) session.getAttribute("school_id");
	        String school_name = (String) session.getAttribute("school_name");
	        Integer subject_id = (Integer) session.getAttribute("subject_id");
	        String subject = (String) session.getAttribute("subject_name");
		
	        try {
	        	Connection con = new DBConnection().getConnection();

		          String sql1 = "INSERT INTO notices "
		                    + "(subject ,description, title, school_id, school_name) "
		                    + "VALUES (?, ?, ?, ?, ?)";
		          PreparedStatement st1 = con.prepareStatement(sql1);
		          
		          st1.setString(1,subject);
		          st1.setString(3,title);
		          st1.setString(2,description);
		          st1.setInt(4,school_id);
		          st1.setString(5,school_name);
		          
		          st1.executeUpdate();
		          

		       
		        
		        
		      
		        st1.close();
		 
		    } 
		    catch (Exception e) {
		        e.printStackTrace();
		    }
	        
	        req.getRequestDispatcher("TrainerSubjectDashboardServlet")
	           .forward(req, res);		
	}

		

}

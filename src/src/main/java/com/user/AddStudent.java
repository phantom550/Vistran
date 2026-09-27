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

/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	
	  @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse res)
	            throws ServletException, IOException {

	        // Read form parameters
	        String classIdStr   = req.getParameter("classId");
	        String subjectIdStr = req.getParameter("subject_id");
	        String teacherIdStr = req.getParameter("teacher_id");
	        String student_name     = req.getParameter("student_name");
	        String college_id1  = req.getParameter("college_id");
	        String attendence1 = req.getParameter("attendance");
	        String behaviour1     = req.getParameter("behaviour");
	        String marks1  = req.getParameter("marks");
	        String subject = req.getParameter("subject");
	        int subject_id=Integer.parseInt(subjectIdStr);
	        int classId =Integer.parseInt(classIdStr);
	        int teacher_id=Integer.parseInt(teacherIdStr);
	        int behaviour=Integer.parseInt(behaviour1);
	        int marks =Integer.parseInt(marks1);
	        int attendence=Integer.parseInt(attendence1);
	        int college_id=Integer.parseInt(college_id1);
	        
	        
	        HttpSession session = req.getSession();
	        int school_id = (int) session.getAttribute("school_id");
	        String school_name = (String) session.getAttribute("school_name");

	        
	        // Convert to int
	        try {
	        	Connection con = new DBConnection().getConnection();


	            String sql = "INSERT INTO students "
	                    + "(student_name, class_id, college_id, attendance,marks,behaviour_score, school_id, school_name) "
	                    + "VALUES (?, ?, ?, ?, ?,?,?,?)";

	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, student_name);
	            ps.setInt(3, college_id);
	            ps.setInt(2, classId);
	            ps.setInt(5, marks);
	            ps.setInt(4, attendence);
	            ps.setInt(6, behaviour);
	            ps.setInt(7, school_id);
	            ps.setString(8, school_name);
	     
	            ps.executeUpdate();
	            
	          
	            ps.close();
	          
	            
	            
	            res.sendRedirect(
	                    "ClassesServlet?classId=" + classId +
	                    "&subject=" + subject +
	                    "&subject_id=" + subject_id
	                );
	            
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	       
	 	   

	        
	    }


}

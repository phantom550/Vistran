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
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/RaiseIssueServlet")
public class RaiseIssueServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Read form parameters
        String classIdStr   = req.getParameter("classId");
        String subjectIdStr = req.getParameter("subject_id");
        String teacherIdStr = req.getParameter("teacher_id");
        String category     = req.getParameter("category");
        String description  = req.getParameter("description");
        String subject = req.getParameter("subject");
        int subject_id=Integer.parseInt(subjectIdStr);
        int classId =Integer.parseInt(classIdStr);
        int teacher_id=Integer.parseInt(teacherIdStr);
        
        HttpSession session = req.getSession();
        int school_id = (int) session.getAttribute("school_id");
        String school_name = (String) session.getAttribute("school_name");
        
        
        // Convert to int
        try {
        	Connection con = new DBConnection().getConnection();


            String sql = "INSERT INTO teacher_issues "
                    + "(teacher_id, subject_id, class_id, issue_description, category,school_id,school_name) "
                    + "VALUES (?, ?, ?, ?, ? , ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, teacher_id);
            ps.setInt(2, subject_id);
            ps.setInt(3, classId);
            ps.setString(5, category);
            ps.setString(4, description);
            ps.setInt(6, school_id);
            ps.setString(7, school_name);
     
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

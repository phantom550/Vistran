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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class TrainerGetDataServlet
 */
@WebServlet("/GetIssueServlet")
public class GetIssueServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
    	
    	
    	 HttpSession session = req.getSession(false);

         if (session == null) {
             res.sendRedirect("login.jsp");
             return;
         }

         Integer school_id = (Integer) session.getAttribute("school_id");
         String school_name = (String) session.getAttribute("school_name");
         Integer subject_id = (Integer) session.getAttribute("subject_id");
         String subject_name = (String) session.getAttribute("subject_name");
         
         
		 String classId = req.getParameter("classId");
		 


         if (school_id == null || school_name == null) {
             res.sendRedirect("login.jsp");
             return;
         }

         req.setAttribute("school_id", school_id);
         req.setAttribute("school_name", school_name);
         req.setAttribute("subject",subject_name);
         req.setAttribute("subject_id", subject_id);
         
         System.out.println(school_id+school_name);

        List<Map<String, String>> issues = new ArrayList<>();

        try {
        	Connection con = new DBConnection().getConnection();

            
            int class_id =Integer.parseInt(classId);
            
            String sql = "SELECT issue_id, subject_id, teacher_id, class_id, issue_description, status, created_at, category FROM teacher_issues where subject_id=? and class_id=? and school_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, subject_id);
            ps.setInt(2, class_id);
            ps.setInt(3, school_id);


            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Map<String, String> issue = new HashMap<>();
                issue.put("issue_id", rs.getString("issue_id"));
                issue.put("subject_id", rs.getString("subject_id"));
                issue.put("teacher_id", rs.getString("teacher_id"));
                issue.put("class_id", rs.getString("class_id"));
                issue.put("issue_description", rs.getString("issue_description"));
                issue.put("status", rs.getString("status"));
                issue.put("created_at", rs.getString("created_at"));
                issue.put("category", rs.getString("category"));
                issues.add(issue);
            }

            
    
            
            System.out.println("issue count: " + issues.size());

            req.setAttribute("issueList", issues);
            req.getRequestDispatcher("getissue.jsp").forward(req, res);

           

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

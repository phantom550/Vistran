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

@WebServlet("/ClusterAServlet")
public class ClusterAServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        List<Map<String, String>> issues = new ArrayList<>();

        try {
        	Connection con = new DBConnection().getConnection();

            
            
            
            String sql =
            	    "SELECT b.issue_id, b.teacher_id, b.issue_description, " +
            	    "b.school_id, b.created_at,b.status " +
            	    "FROM teachers a " +
            	    "JOIN teacher_issues b ON a.teacher_id = b.teacher_id " +
            	    "WHERE a.cluster = 'A'";

            PreparedStatement ps = con.prepareStatement(sql);
           


            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Map<String, String> issue = new HashMap<>();
                issue.put("issue_id", rs.getString("issue_id"));
                issue.put("teacher_id", rs.getString("teacher_id"));
                issue.put("issue_description", rs.getString("issue_description"));
                issue.put("status", rs.getString("status"));
                issue.put("created_at", rs.getString("created_at"));
                issue.put("school_id", rs.getString("school_id"));
                issues.add(issue);
            }

            
    
            
            System.out.println("issue count: " + issues.size());

            req.setAttribute("issueList", issues);
            req.getRequestDispatcher("clusterA.jsp").forward(req, res);

           

        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

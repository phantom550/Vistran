package com.user;

import com.user.PollinationsService;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/AdaptModuleServlet")
public class AdaptModuleServlet extends HttpServlet {
    
    // DB Credentials - Replace with yours
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Void4";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String originalContent = request.getParameter("rawContent");
        String cluster = request.getParameter("targetCluster");
        String NewContent="";
        int clusterN = 0;
        if ("A".equals(cluster)) {
            clusterN = 1;
        }
        else if ("B".equals(cluster)) {
            clusterN = 2;
        }
        else if ("C".equals(cluster)) {
            clusterN = 3;
        }
        
        		
        if (originalContent != null) {
            // 1. Call the AI Service
            String localizedContent = PollinationsService.adaptForTribalContext(originalContent,clusterN);
            
            // 2. Save to Database
            updateDatabase(cluster,localizedContent);
        }
        try {
        	Connection con = new DBConnection().getConnection(); {
            	String sql = "SELECT * FROM training_modules ORDER BY id DESC LIMIT 1";


                PreparedStatement pstmt = con.prepareStatement(sql);
               
                ResultSet st = pstmt.executeQuery();
                

                if (st.next()) {   // ✅ move cursor
                    NewContent = st.getString("content");
                }
               
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // 3. Redirect back to the view page
        response.sendRedirect("view_module.jsp?cluster="+cluster+"&NewContent=" + 
                URLEncoder.encode(NewContent, "UTF-8"));
    }

    private void updateDatabase(String cluster,String content) {
        try {
        	Connection con = new DBConnection().getConnection();
 {
            	String sql = "INSERT INTO training_modules (content, cluster) VALUES (?, ?)";

                PreparedStatement pstmt = con.prepareStatement(sql);
                pstmt.setString(1, content);
                pstmt.setString(2, cluster);
                pstmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
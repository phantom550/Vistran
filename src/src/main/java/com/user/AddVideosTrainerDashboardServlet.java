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

@WebServlet("/AddVideosTrainerDashboardServlet")
public class AddVideosTrainerDashboardServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
        // 1. Set Encoding
        req.setCharacterEncoding("UTF-8");
        
        String title = req.getParameter("video_title");
        String url = req.getParameter("video_url");
        
        HttpSession session = req.getSession(false);
        if (session == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        Integer school_id = (Integer) session.getAttribute("school_id");
        String school_name = (String) session.getAttribute("school_name");
        Integer subject_id = (Integer) session.getAttribute("subject_id");
        String subject = (String) session.getAttribute("subject_name");

        
        try {
        	Connection con = new DBConnection().getConnection();

            
            // Prepare SQL with class_id
            String sql = "INSERT INTO trainer_videos (subject, title, video_url, school_id, school_name) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);
            
            // Logic to handle "All Classes" or specific class
          
                    st.setString(1, subject);
                    st.setString(2, title);
                    st.setString(3, url);
                    st.setInt(4, 111);
                    st.setString(5, school_name);
                    st.executeUpdate();
       
            st.close();
           

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        req.getRequestDispatcher("TrainerSubjectDashboardServlet").forward(req, res);       
    }
}
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


@WebServlet("/AddVideoTrainerClassesServlet")
public class AddVideoTrainerClassesServlet extends HttpServlet {
	
	
protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
        // 1. Set Encoding
        req.setCharacterEncoding("UTF-8");
        
        String title = req.getParameter("video_title");
        String url = req.getParameter("video_url");
        String classIdParam = req.getParameter("class_id"); // Capture class_id
        
        HttpSession session = req.getSession(false);
        if (session == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        Integer school_id = (Integer) session.getAttribute("school_id");
        String school_name = (String) session.getAttribute("school_name");
        Integer subject_id = (Integer) session.getAttribute("subject_id");
        
        try {
        	Connection con = new DBConnection().getConnection();

            
            // Prepare SQL with class_id
            String sql = "INSERT INTO videos (subject_id, title, video_url, school_id, school_name, description, class_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);
        
                int classId = Integer.parseInt(classIdParam);
                st.setInt(1, subject_id);
                st.setString(2, title);
                st.setString(3, url);
                st.setInt(4, school_id);
                st.setString(5, school_name);
                st.setString(6, "not defined");
                st.setInt(7, classId); // Set class ID
                st.executeUpdate();
          
            st.close();
           

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        req.getRequestDispatcher("TrainerClassesServlet").forward(req, res);       
    }
}
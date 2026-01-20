package com.user;

import jakarta.servlet.RequestDispatcher;
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


@WebServlet("/EditTeacherServlet")
public class EditTeacherServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int teacherId = Integer.parseInt(req.getParameter("teacher_id"));
        String name = req.getParameter("teacher_name");
        String email = req.getParameter("email");
        String joinedDate = req.getParameter("joined_date");
        String cluster = req.getParameter("cluster");
        
        HttpSession session = req.getSession();
        int school_id = (int) session.getAttribute("school_id");
        String school_name = (String) session.getAttribute("school_name");

        String classId = req.getParameter("classId");
        String subject = req.getParameter("subject");
        String subject_id = req.getParameter("subject_id");

        try {
        	Connection con = new DBConnection().getConnection();


            String sql = "UPDATE teachers SET name=?, email=?, joined_date=?, cluster=? WHERE teacher_id=? and school_id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, joinedDate);
            ps.setString(4, cluster);
            ps.setInt(5, teacherId);
            ps.setInt(6, school_id);

            ps.executeUpdate();

            ps.close();
          

            // ✅ Redirect back to ClassesServlet (BEST PRACTICE)
            res.sendRedirect(
                "ClassesServlet?classId=" + classId +
                "&subject=" + subject +
                "&subject_id=" + subject_id+
                "&cluster=" + cluster
            );

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Database Error");
        }
    }
}

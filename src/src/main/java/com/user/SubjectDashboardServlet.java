package com.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/SubjectDashboardServlet")
public class SubjectDashboardServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        List<Map<String, String>> videos = new ArrayList<>();
        List<Map<String, String>> noticeList = new ArrayList<>();

        String subject = (String) req.getAttribute("subject");
        String subject_id = (String) req.getAttribute("subject_id");

        HttpSession session = req.getSession();
        int school_id = (int) session.getAttribute("school_id");

        try {
        	Connection con = new DBConnection().getConnection();


            /* ---------------- VIDEOS ---------------- */
            String sql = "SELECT title, video_url FROM trainer_videos WHERE subject=? AND school_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, subject);
            ps.setInt(2, school_id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, String> video = new HashMap<>();
                video.put("title", rs.getString("title"));
                video.put("url", rs.getString("video_url"));
                videos.add(video);
            }

            /* ---------------- NOTICES ---------------- */
            String sql1 = "SELECT description, created_date FROM notices WHERE subject=?";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ps1.setString(1, subject);

            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                Map<String, String> notice = new HashMap<>();
                notice.put("description", rs1.getString("description"));
                notice.put("date", rs1.getString("created_date"));
                noticeList.add(notice);
            }

            /* ---------------- TRAINING MODULES ---------------- */
            String sql2 = "SELECT content, created_at FROM training_modules";
            PreparedStatement ps2 = con.prepareStatement(sql2);

            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                Map<String, String> notice = new HashMap<>();
                notice.put("description", rs2.getString("content"));
                notice.put("date", rs2.getString("created_at"));
                noticeList.add(notice);
            }

            rs.close();
            ps.close();
            rs1.close();
            ps1.close();
            rs2.close();
            ps2.close();
          

        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("videos", videos);
        req.setAttribute("notice", noticeList);
        req.setAttribute("subject", subject);
        req.setAttribute("subject_id", subject_id);

        req.getRequestDispatcher("subjectdashboard.jsp").forward(req, res);
    }
}

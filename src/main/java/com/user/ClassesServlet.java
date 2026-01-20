package com.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/ClassesServlet")
public class ClassesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

    	req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html; charset=UTF-8");

        
    	
        String classId = req.getParameter("classId");
        String subject = req.getParameter("subject");
        String subject_i = req.getParameter("subject_id");
        int subject_id=Integer.parseInt(subject_i);
        int classI =Integer.parseInt(classId);
        
        HttpSession session = req.getSession();
        int school_id = (int) session.getAttribute("school_id");
        String school_name = (String) session.getAttribute("school_name");
        
        List<Map<String, String>> videos = new ArrayList<>();
        List<Map<String, String>> notice = new ArrayList<>();
        ArrayList<Integer> attend = new ArrayList();
        ArrayList<Integer> beheviour = new ArrayList();
        
        ArrayList<Integer> perform = new ArrayList();
        ArrayList<String> name = new ArrayList();
        
        int low=0;
        int avg=0;
        int good=0;
        int teacher_id = 0;
        String email = null;
        String tname=null;
         java.sql.Date jDate = null;
         String sub = null ;
         String cluster ="";
         int total=0;
        String m="math";

        System.out.println("Aisha topped class " + classId + " in " + subject+" "+subject_id);
        	   
        	   try {
               	Connection con = new DBConnection().getConnection();


                   String sql = "SELECT title, video_url FROM videos WHERE subject_id=? and class_id=? and school_id=?";
                   PreparedStatement ps = con.prepareStatement(sql);
                   ps.setInt(1, subject_id);
                   ps.setInt(2, classI);
                   ps.setInt(3, school_id);

                   ResultSet rs = ps.executeQuery();

                   while (rs.next()) {
                       Map<String, String> video = new HashMap<>();
                       video.put("title", rs.getString("title"));
                       video.put("url", rs.getString("video_url"));
                       videos.add(video);
                   }
                   
                   String sql1 = "SELECT * FROM notices WHERE subject=? and class_id=? and school_id=?";
                   PreparedStatement ps1 = con.prepareStatement(sql1);
                   ps1.setString(1, subject);
                   ps1.setInt(2, classI);
                   ps1.setInt(3, school_id);


                   ResultSet rs1 = ps1.executeQuery();

                   while (rs1.next()) {
                       Map<String, String> notices = new HashMap<>();
                       notices.put("description", rs1.getString("description"));
                       notices.put("date", rs1.getString("created_date"));
                       notice.add(notices);
                   }
                   
                   String sql2 = "SELECT attendance FROM students WHERE class_id=? and school_id=?";
                   PreparedStatement ps2 = con.prepareStatement(sql2);
                   ps2.setInt(1, classI);
                   ps2.setInt(2, school_id);


                   ResultSet rs2 = ps2.executeQuery();
                   while (rs2.next()) {
                       
                       attend.add(rs2.getInt("attendance"));
                       
                   }
                   
                   String sql3 = "SELECT name,teacher_id,email,joined_date,subject,cluster FROM teachers WHERE class_id=? and subject=? and school_id=?";
                   PreparedStatement ps3 = con.prepareStatement(sql3);
                   ps3.setInt(1, classI);
                   ps3.setString(2, subject);
                   ps3.setInt(3, school_id);


                   ResultSet rs3 = ps3.executeQuery();
                       
                   if (rs3.next()) { 
                	   tname=rs3.getString("name");
                       teacher_id = rs3.getInt("teacher_id");
                       email = rs3.getString("email");
                       jDate = rs3.getDate("joined_date");
                       sub = rs3.getString("subject");
                       cluster=rs3.getString("cluster");
                  
                   }
    
                   

					
					  String sql4 = "SELECT behaviour_score FROM students WHERE class_id=? and school_id=?";
					  PreparedStatement ps4 = con.prepareStatement(sql4);
					  ps4.setInt(1, classI);
					  ps4.setInt(2, school_id);

					  
					 
					  ResultSet rs4 = ps4.executeQuery();
					  
					  while(rs4.next())
					  {
						  beheviour.add(rs4.getInt("behaviour_score"));
					 
					 }
					  
					  for(int i : beheviour) {
						  
						  if(i>=0 && i<=4) {
							  low++;
						  }
						  else if(i>4 && i<=7) {
							  avg++;
						  }
						  else {
							  good++;
						  }
						  
					  }
					 
                   
                   String sql5 = "SELECT count(*) as total FROM students WHERE class_id=? and school_id=?";
                   PreparedStatement ps5 = con.prepareStatement(sql5);
                   ps5.setInt(1, classI);
                   ps5.setInt(2, school_id);

                   
                   ResultSet rs5 = ps5.executeQuery();
                   
                   if (rs5.next()) { 
                	  total=rs5.getInt("total");
                  
                   }
                   
                   String sql6 = "SELECT student_name,marks FROM students WHERE class_id=? and school_id=?";
                   PreparedStatement ps6 = con.prepareStatement(sql6);
                   ps6.setInt(1, classI);
                   ps6.setInt(2, school_id);

                 

                   ResultSet rs6 = ps6.executeQuery();
                       
                   while (rs6.next()) {
                       
                       perform.add(rs6.getInt("marks"));
                       name.add(rs6.getString("student_name"));
                       
                   }
                   String sql7 = "SELECT content, created_at FROM training_modules where cluster=?";
                   PreparedStatement ps7 = con.prepareStatement(sql7);
                   ps7.setString(1,cluster);
                   ResultSet rs7 = ps7.executeQuery();
                   while (rs7.next()) {
                       Map<String, String> notices = new HashMap<>();
                       notices.put("description", rs7.getString("content"));
                       notices.put("date", rs7.getString("created_at"));
                       notice.add(notices);
                   }
                   
                   rs7.close();
                   ps7.close();

                   rs6.close();
                   ps6.close();
                   rs4.close();
                   ps4.close();
                   rs5.close();
                   ps5.close();
                   rs3.close();
                   ps3.close();
                   rs2.close();
                   ps2.close();
                   rs1.close();
                   ps1.close();
                   rs.close();
                   ps.close();
                  
                   
               } catch (Exception e) {
                   e.printStackTrace();
               }
        	   
           
        // Send data to JSP
        req.setAttribute("classId", classId);
        req.setAttribute("subject", subject);
        req.setAttribute("subject_id", subject_i);
        req.setAttribute("videos", videos);
        req.setAttribute("notice",notice);
        req.setAttribute("attend", attend);
        req.setAttribute("email", email);
        req.setAttribute("sub", sub);
        req.setAttribute("jDate", jDate);
        req.setAttribute("teacher_id", teacher_id);
        req.setAttribute("name", tname);
        req.setAttribute("total", total);
        req.setAttribute("low", low);
        req.setAttribute("avg", avg);
        req.setAttribute("good", good);
        req.setAttribute("performance", perform);
        req.setAttribute("sname", name);
        req.setAttribute("cluster", cluster);

        RequestDispatcher rd = req.getRequestDispatcher("classes.jsp");
        rd.forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doGet(req, res);
    }
}
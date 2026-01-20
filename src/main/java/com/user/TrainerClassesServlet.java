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


@WebServlet("/TrainerClassesServlet")
public class TrainerClassesServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		 String classId = req.getParameter("classId");
		 
    	 HttpSession session = req.getSession(false);

         if (session == null) {
             res.sendRedirect("login.jsp");
             return;
         }

         Integer school_id = (Integer) session.getAttribute("school_id");
         String school_name = (String) session.getAttribute("school_name");
         Integer subject_id = (Integer) session.getAttribute("subject_id");
         String subject_name = (String) session.getAttribute("subject_name");
		 
         String trainer_name="";;
   	     int trainer_id= 0;
         String  email ="";
         String status ="";
         String subject ="";
         
         ArrayList<String> name = new ArrayList();
         ArrayList<Integer> attend = new ArrayList();
         
         ArrayList<Integer> perform = new ArrayList();
         
         ArrayList<Integer> beheviour = new ArrayList();
         
         
         int low=0;
         int avg=0;
         int good=0;

		 
		  try {
	        	Connection con = new DBConnection().getConnection();

              
              int class_id = Integer.parseInt(classId);
              
              String sql = "SELECT trainer_name,trainer_id,email,status,subject_name FROM trainers WHERE subject_id=?";
              PreparedStatement ps = con.prepareStatement(sql);
              ps.setInt(1, subject_id);


              ResultSet rs = ps.executeQuery();
                  
              if (rs.next()) { 
            	  trainer_name=rs.getString("trainer_name");
            	  trainer_id = rs.getInt("trainer_id");
                  email = rs.getString("email");
                  status = rs.getString("status");
                  subject = rs.getString("subject_name");
             
              }
              
              String sql1 = "SELECT COUNT(*) FROM videos where subject_id=? and class_id=? and school_id=?";
              PreparedStatement ps1 = con.prepareStatement(sql1);
              ps1.setInt(1, subject_id);
              ps1.setInt(2, class_id);
              ps1.setInt(3, school_id);
              ResultSet rs1 = ps1.executeQuery();

              int totalVideos = 0;
              if (rs1.next()) {
                  totalVideos = rs1.getInt(1);
              }
              req.setAttribute("videos", totalVideos);
              System.out.println(totalVideos);
              
              String sql2 = "SELECT COUNT(*) FROM notices where subject=? and class_id=? and school_id=?";
              PreparedStatement ps2 = con.prepareStatement(sql2);
              ps2.setString(1, subject_name);
              ps2.setInt(2, class_id);
              ps2.setInt(3, school_id);
              
              ResultSet rs2 = ps2.executeQuery();

              int totalNotices = 0;
              if (rs2.next()) {
                  totalNotices = rs2.getInt(1);
              }
              req.setAttribute("notice", totalNotices);
              System.out.println(totalNotices);
              
              String sql6 = "SELECT student_name,marks,attendance FROM students WHERE class_id=? and school_id=?";
              PreparedStatement ps6 = con.prepareStatement(sql6);
              ps6.setInt(1, class_id);
              ps6.setInt(2, school_id);

            

              ResultSet rs6 = ps6.executeQuery();
                  
              while (rs6.next()) {
                  
                  perform.add(rs6.getInt("marks"));
                  name.add(rs6.getString("student_name"));
                  attend.add(rs6.getInt("attendance"));
                  
                  
              }
              String sql4 = "SELECT behaviour_score FROM students WHERE class_id=? and school_id=?";
			  PreparedStatement ps4 = con.prepareStatement(sql4);
			  ps4.setInt(1, class_id);
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
			  
			  rs4.close();
              ps4.close();
              

              rs6.close();
              ps6.close();
              

              rs.close();
              ps.close();
              rs1.close();
              ps1.close();
              
              rs2.close();
              ps2.close();
            
              
          } catch (Exception e) {
              e.printStackTrace();
          }
		  
		  int total=low+avg+good;
		 
		 req.setAttribute("name", trainer_name);
		 req.setAttribute("classId", classId);
		 req.setAttribute("trainer_id", trainer_id);
		 req.setAttribute("email",email);
		 req.setAttribute("status", status);
		 req.setAttribute("subject", subject);
		    req.setAttribute("performance", perform);
	        req.setAttribute("sname", name);
	        req.setAttribute("attend", attend);
	        req.setAttribute("low", low);
	        req.setAttribute("avg", avg);
	        req.setAttribute("good", good);
	        req.setAttribute("total", total);

		
		req.getRequestDispatcher("trainerclasses.jsp").forward(req,res);
		
	}

}

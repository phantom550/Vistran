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

/**
 * Servlet implementation class TrainerLoginServlet
 */
@WebServlet("/TrainerLoginServlet")
public class TrainerLoginServlet extends HttpServlet {
	

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String tid = req.getParameter("trainer_id");
		String password = req.getParameter("password");
		String school_name = req.getParameter("school_name");
		int school_id = 0;

		if (tid == null || tid.isEmpty() || password == null || password.isEmpty()) {
			res.getWriter().println("Trainer ID and Password are required");
			return;
		}

		int trainer_id;
		try {
			trainer_id = Integer.parseInt(tid);
		} catch (NumberFormatException e) {
			res.getWriter().println("Trainer ID must be a number");
			return;
		}

		try {
        	Connection con = new DBConnection().getConnection();

	          String sql1 = "select school_id from trainer_videos where school_name=? ";
	          PreparedStatement st1 = con.prepareStatement(sql1);
	          
	          st1.setString(1,school_name);
	          ResultSet rs1=st1.executeQuery();
	          if (rs1.next()) {
	                school_id = rs1.getInt("school_id");
	          }
	          

	        // trainer_id is the trainers table's primary key. subject_id is
	        // NOT unique (several trainers can teach the same subject), so
	        // looking it up by subject_id used to silently log people in as
	        // whichever trainer happened to be first in the table for that
	        // subject instead of the person who actually signed in.
	        String sql = "select password, subject_id, subject_name from trainers where trainer_id=?";
	        PreparedStatement st = con.prepareStatement(sql);
	        st.setInt(1, trainer_id);

	        ResultSet rs = st.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password");

                if (dbPassword.equals(password)) {
                	   int subject_id = rs.getInt("subject_id");
                	   String subject_name = rs.getString("subject_name");
                	   HttpSession session = req.getSession();
                       session.setAttribute("school_id", school_id);
                       session.setAttribute("school_name", school_name);
                       session.setAttribute("subject_name", subject_name);
                       session.setAttribute("subject_id", subject_id);

                       req.getRequestDispatcher("/TrainerSubjectDashboardServlet").forward(req, res);                } else {
                    res.getWriter().println("Invalid Password");
                }
            } else {
                res.getWriter().println("Trainer not found");
            }
	        st.close();
	        st1.close();
	        rs.close();
	        rs1.close();
	       
	      


	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	        res.getWriter().println("Login failed: " + e.getMessage());
	    }
		
     
		
	}

}

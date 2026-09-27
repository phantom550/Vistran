package com.user;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int countA = 0;
        int countB = 0;
        int countC = 0;

        try {
        	Connection con = new DBConnection().getConnection();


            String sql =
                    "SELECT COUNT(*) AS countA " +
                    "FROM teachers a " +
                    "JOIN teacher_issues b ON a.teacher_id = b.teacher_id " +
                    "WHERE a.cluster = 'A'";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                countA = rs.getInt("countA");
            }

            rs.close();
            ps.close();
            
            String sql1 =
                    "SELECT COUNT(*) AS countB " +
                    "FROM teachers a " +
                    "JOIN teacher_issues b ON a.teacher_id = b.teacher_id " +
                    "WHERE a.cluster = 'B'";

            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();

            if (rs1.next()) {
                countB = rs1.getInt("countB");
            }

            rs1.close();
            ps1.close();
            
            String sql2 =
                    "SELECT COUNT(*) AS countC " +
                    "FROM teachers a " +
                    "JOIN teacher_issues b ON a.teacher_id = b.teacher_id " +
                    "WHERE a.cluster = 'C'";

            PreparedStatement ps2 = con.prepareStatement(sql2);
            ResultSet rs2 = ps2.executeQuery();

            if (rs2.next()) {
                countC = rs2.getInt("countC");
            }

            rs2.close();
            ps2.close();
            

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Database Error");
        }

        // ✅ ALWAYS forward after DB logic
        req.setAttribute("countA", countA);
        req.setAttribute("countB", countB);
        req.setAttribute("countC", countC);
        RequestDispatcher rd = req.getRequestDispatcher("admindashboard.jsp");
        rd.forward(req, res);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

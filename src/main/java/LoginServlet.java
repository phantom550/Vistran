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

import com.user.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    public void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");

        String idStr = req.getParameter("id");
        String password = req.getParameter("password");
        String subject = req.getParameter("subject");
        String schoolid = req.getParameter("school_id");
        String school_name = req.getParameter("school_name");
        int school_id=Integer.parseInt(schoolid);

        // Validation
        if (idStr == null || idStr.isEmpty() ||
            password == null || password.isEmpty()) {

            res.getWriter().println("ID and Password are required");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {
            res.getWriter().println("ID must be a number");
            return;
        }

        try {
        	Connection con = new DBConnection().getConnection();

            String sql = "SELECT password FROM login WHERE subject_id=? AND subject=? and school_id=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, subject);
            st.setInt(3,school_id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password");

                if (dbPassword.equals(password)) {
                    res.getWriter().println("Login Successful");
                } else {
                    res.getWriter().println("Invalid Password");
                }
            } else {
                res.getWriter().println("User not found");
            }

            rs.close();
            st.close();
            
            HttpSession session = req.getSession();
            session.setAttribute("school_id", school_id);
            session.setAttribute("school_name", school_name);


            
            req.setAttribute("subject",subject);
            req.setAttribute("subject_id",idStr);
            req.getRequestDispatcher("/SubjectDashboardServlet").forward(req, res);


        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Database Error");
        }
    }
}

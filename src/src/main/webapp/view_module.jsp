<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vistran - Module View</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    
    <style>
        :root {
            --md-sys-color-primary: #006492;
            --md-sys-color-on-primary: #ffffff;
            --md-sys-color-surface: #f8fdff;
            --md-sys-color-surface-container: #eef1f4;
            --md-sys-color-tertiary-container: #cce5ff;
            --md-elevation-2: 0px 2px 6px 2px rgba(0, 0, 0, 0.15);
        }

        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: var(--md-sys-color-surface);
            display: flex;
            height: 100vh;
        }

        /* Left Panel - Navigation */
        .left-panel {
            width: 280px;
            background-color: var(--md-sys-color-surface-container);
            padding: 20px;
            border-right: 1px solid #dee2e6;
            display: flex;
            flex-direction: column;
        }

        .profile-section {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 30px;
        }

        .profile-pic {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--md-sys-color-primary);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Right Panel - Content */
        .right-panel {
            flex: 1;
            padding: 40px;
            overflow-y: auto;
        }

        .content-card {
            background: white;
            border-radius: 24px;
            padding: 30px;
            max-width: 900px;
            margin: 0 auto;
            box-shadow: var(--md-elevation-2);
        }

        /* MD3 Button Styling */
        .btn-adapt {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background-color: var(--md-sys-color-tertiary-container);
            color: #001e30;
            border: none;
            padding: 12px 24px;
            border-radius: 100px; /* Fully rounded pill shape */
            font-weight: 500;
            cursor: pointer;
            transition: 0.2s;
            text-decoration: none;
        }

        .btn-adapt:hover {
            box-shadow: 0 1px 2px rgba(0,0,0,0.3);
            background-color: #b3d9ff;
        }

        .tribal-content-box {
            margin-top: 20px;
            padding: 20px;
            background-color: #f1f8e9; /* Light green tint for nature/tribal feel */
            border-left: 5px solid #558b2f;
            border-radius: 0 12px 12px 0;
        }
    </style>
</head>
<body>

<%
    // Fetch Data Logic (Simplified for the example)
    String id = request.getParameter("id");
    String title = "Introduction to Water Conservation"; // Default/Placeholder
    String content = "Water conservation includes all the policies, strategies and activities to sustainably manage the natural resource of fresh water...";
    String tribalContent = null;

    if(id != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/void4",
                    "root",
                    "root"
            );
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM training_modules ORDER BY id DESC LIMIT 1");
           
            ResultSet rs = pst.executeQuery();
            if(rs.next()) {
                
                content = rs.getString("content");
               
            }
            conn.close();
        } catch(Exception e) { out.println(e); }
    }
%>

    <aside class="left-panel">
        <div class="profile-section">
            <div class="profile-pic">T</div> <div>
                <div style="font-weight:bold;">Dr. Kumar</div>
                <div style="font-size: 0.8em; opacity: 0.7;">Adminstrator</div>
            </div>
        </div>
        <h3>Modules</h3>
        </aside>

    <main class="right-panel">
        <div class="content-card">
            <h1>Revisied Content</h1>
<p style="line-height: 1.6; opacity: 0.8;">
    <%= request.getParameter("NewContent") %>
</p>

            <hr style="margin: 30px 0; border: 0; border-top: 1px solid #eee;">

            <div style="display: flex; align-items: center; justify-content: space-between;">
                <h3>Context Variations</h3>
                
                <form action="AdaptModuleServlet" method="post">
                    <input type="hidden" name="moduleId" value="<%= id %>">
                    <input type="hidden" name="originalContent" value="<%= content %>">
                    
                    <button type="submit" class="btn-adapt">
                        <span class="material-symbols-outlined">forest</span>
                        Adapted for Cluster <%= request.getParameter("cluster") %>
                    </button>
                </form>
            </div>

            <% if (tribalContent != null && !tribalContent.isEmpty()) { %>
                <div class="tribal-content-box">
                    <h4 style="margin-top:0; color:#2e7d32;">
                        <span class="material-symbols-outlined" style="vertical-align:bottom; font-size:1.2em;">translate</span> 
                        Localized Version
                    </h4>
                    <p><%= tribalContent %></p>
                </div>
            <% } %>

        </div>
    </main>

</body>
</html>
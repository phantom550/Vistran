<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.util.ArrayList, java.util.Map, java.util.HashMap" %>

<%@ page import="java.util.*" %>

<%
    List<Map<String, String>> teacherList =
        (List<Map<String, String>>) request.getAttribute("teacherList");
      if (teacherList == null) {
    	  teacherList = new ArrayList<>();
      }
%>

  <%
  String classId = request.getParameter("classId");
  String subjectName = request.getParameter("subjectName");
  String subject_id = request.getParameter("subject_id");
  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teachers Information - EduDash</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    
    <style>
        :root {
            /* --- Material Design 3 Tokens --- */
            /* Using a Blue theme similar to the image */
            --md-sys-color-primary: #2C3E50; /* Dark Blue Header */
            --md-sys-color-on-primary: #FFFFFF;
            
            --md-sys-color-surface: #F5F7FA; /* Light Gray Background */
            --md-sys-color-surface-container: #FFFFFF; /* White Card */
            
            --md-sys-color-outline: #E0E0E0;
            --md-sys-color-on-surface: #1A1C1E;
            --md-sys-color-on-surface-variant: #596172;

            /* Status Colors */
            --status-active-bg: #E6F4EA;
            --status-active-text: #1E8E3E;
            --status-leave-bg: #FEF7E0;
            --status-leave-text: #F9AB00;
            --status-inactive-bg: #FCE8E6;
            --status-inactive-text: #C5221F;

            /* Shapes */
            --md-sys-shape-corner-medium: 12px;
            --md-sys-shape-corner-large: 16px;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Roboto', sans-serif; }
        
        body { 
            background-color: var(--md-sys-color-surface); 
            color: var(--md-sys-color-on-surface);
            padding: 40px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .page-title {
            font-size: 1.75rem;
            color: #5F6D7E;
            margin-bottom: 24px;
            font-weight: 500;
            text-align: center;
        }

        /* --- Card Container --- */
        .table-card {
            background: var(--md-sys-color-surface-container);
            width: 100%;
            max-width: 1200px;
            border-radius: var(--md-sys-shape-corner-large);
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.05);
            overflow: hidden; /* Clips the header corners */
            border: 1px solid var(--md-sys-color-outline);
        }

        /* --- Table Styling --- */
        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        /* Header */
        thead {
            background-color: #3C5068; /* Matches the dark blue header in image */
            color: white;
        }

        th {
            padding: 18px 24px;
            font-weight: 500;
            font-size: 0.95rem;
            letter-spacing: 0.5px;
        }

        /* Body Rows */
        td {
            padding: 16px 24px;
            border-bottom: 1px solid #F0F0F0;
            vertical-align: middle;
            color: var(--md-sys-color-on-surface-variant);
            font-size: 0.95rem;
        }

        tr:last-child td { border-bottom: none; }
        
        tr:hover {
            background-color: #F8F9FF; /* Slight hover effect */
        }

        /* --- Components --- */
        
        /* User Profile in Table */
        .user-cell {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: #3498DB;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.85rem;
            font-weight: 600;
        }
        
        .user-info div:first-child {
            color: var(--md-sys-color-on-surface);
            font-weight: 500;
        }
        .user-info div:last-child {
            font-size: 0.8rem;
            color: #888;
        }

        /* Status Badges */
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            display: inline-block;
            text-align: center;
            min-width: 80px;
        }
        .status-active { background: var(--status-active-bg); color: var(--status-active-text); }
        .status-leave { background: var(--status-leave-bg); color: var(--status-leave-text); }
        .status-inactive { background: var(--status-inactive-bg); color: var(--status-inactive-text); }

        /* Action Buttons */
        .action-btn {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 12px;
            border: 1px solid #E0E0E0;
            border-radius: 6px;
            background: white;
            cursor: pointer;
            text-decoration: none;
            color: var(--md-sys-color-on-surface-variant);
            font-size: 0.85rem;
            transition: 0.2s;
        }
        .action-btn:hover { background: #F5F5F5; border-color: #CCC; }
        .action-btn.delete { color: #C5221F; }
        .action-btn.delete:hover { background: #FCE8E6; border-color: #FCE8E6; }

        .btn-icon { font-size: 16px; }

        /* Footer Placeholders */
        .footer-actions {
            margin-top: 24px;
            display: flex;
            gap: 16px;
            width: 100%;
            max-width: 1200px;
            justify-content: flex-end;
        }

        .btn-filled {
            background: var(--md-sys-color-primary);
            color: white;
            padding: 10px 24px;
            border-radius: 100px;
            border: none;
            cursor: pointer;
            font-weight: 500;
        }
        .btn-outlined {
            border: 1px solid var(--md-sys-color-primary);
            color: var(--md-sys-color-primary);
            background: transparent;
            padding: 10px 24px;
            border-radius: 100px;
            cursor: pointer;
            font-weight: 500;
        }
        
        /* Responsive Table */
        @media (max-width: 1000px) {
            .table-container { overflow-x: auto; }
            th, td { white-space: nowrap; }
        }
    </style>
</head>
<body>

    <h1 class="page-title">Teachers Information</h1>

    <div class="table-card">
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>        
                        <th>Name</th>        
                        <th>Email</th>    
                        <th>Subject Id</th> 
                        <th>Experience</th> 
                        <th>Join Date</th>  
                        <th>School Id</th>  
                        <th>School Name</th>  
                        <th>Class Id</th>   
                        <th style="text-align: center;">Actions</th>
                    </tr>
                </thead>
               <tbody>
<%
if (teacherList != null && !teacherList.isEmpty()) {
    for (Map<String, String> t : teacherList) {
%>
<tr>
    <td><%= t.get("id") %></td>

    <td>
        <div class="user-cell">
            <div class="avatar">
                <%= t.get("name").substring(0, 1) %>
            </div>
            <div class="user-info">
                <div><%= t.get("name") %></div>
                
            </div>
        </div>
    </td>

<td><%= t.get("email") %></td>
    <td><%= t.get("sub_id") %></td>
    <td><%= t.get("experience") %></td>
    <td><%= t.get("join_date") %></td>
    <td><%= t.get("school_id") %></td>
    <td><%= t.get("school_name") %></td>
    <td><%= t.get("class_id") %></td>

    <td style="text-align:center;">
        <a href="teacher_details.jsp?teacher_id=<%= t.get("id") %>" class="action-btn">
            View
        </a>
    </td>
</tr>

<%
    }
} else {
%>
<tr>
    <td colspan="8" style="text-align:center;">No teachers found</td>
</tr>
<%
}
%>
</tbody>
            </table>
        </div>
    </div>

    <div class="footer-actions">
        <button class="btn-outlined">Placeholder 1</button>
        <button class="btn-filled">Placeholder 2</button>
    </div>

</body>
</html>
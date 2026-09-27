<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.util.ArrayList, java.util.Map, java.util.HashMap" %>

<%
    // Retrieve the list of issues from the request (sent by the Servlet)
    List<Map<String, String>> issueList = (List<Map<String, String>>) request.getAttribute("issueList");
    
    // Initialize if null to prevent crashes
    if (issueList == null) {
        issueList = new ArrayList<>();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Issue Tracker - EduDash</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    
    <style>
        :root {
            /* --- Material Design 3 Tokens (Consistent with getdata.jsp) --- */
            --md-sys-color-primary: #2C3E50;
            --md-sys-color-on-primary: #FFFFFF;
            --md-sys-color-surface: #F5F7FA;
            --md-sys-color-surface-container: #FFFFFF;
            --md-sys-color-outline: #E0E0E0;
            --md-sys-color-on-surface: #1A1C1E;
            --md-sys-color-on-surface-variant: #596172;

            /* Status Colors for Issues */
            --status-open-bg: #FCE8E6;       /* Red-ish for open/critical */
            --status-open-text: #C5221F;
            --status-pending-bg: #FEF7E0;    /* Yellow for in-progress */
            --status-pending-text: #F9AB00;
            --status-resolved-bg: #E6F4EA;   /* Green for done */
            --status-resolved-text: #1E8E3E;

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
            max-width: 1400px; /* Wider for description text */
            border-radius: var(--md-sys-shape-corner-large);
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            border: 1px solid var(--md-sys-color-outline);
        }

        /* --- Table Styling --- */
        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        thead {
            background-color: #3C5068;
            color: white;
        }

        th {
            padding: 18px 24px;
            font-weight: 500;
            font-size: 0.95rem;
            letter-spacing: 0.5px;
            white-space: nowrap;
        }

        td {
            padding: 16px 24px;
            border-bottom: 1px solid #F0F0F0;
            vertical-align: top; /* Align top for long descriptions */
            color: var(--md-sys-color-on-surface-variant);
            font-size: 0.95rem;
        }

        tr:last-child td { border-bottom: none; }
        tr:hover { background-color: #F8F9FF; }

        /* --- Specific Column Styling --- */
        .desc-cell {
            max-width: 300px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        
        /* Category Chips */
        .category-chip {
            display: inline-block;
            padding: 4px 12px;
            background-color: #E8F0FE;
            color: #1967D2;
            border-radius: 8px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        /* Status Badges */
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            display: inline-block;
            text-align: center;
            min-width: 90px;
            text-transform: capitalize;
        }
        
        .status-open { background: var(--status-open-bg); color: var(--status-open-text); }
        .status-pending { background: var(--status-pending-bg); color: var(--status-pending-text); }
        .status-resolved { background: var(--status-resolved-bg); color: var(--status-resolved-text); }

        /* Responsive Table */
        @media (max-width: 1200px) {
            .table-container { overflow-x: auto; }
            th, td { white-space: nowrap; }
        }
    </style>
</head>
<body>

    <h1 class="page-title">Issue Dashboard</h1>

    <div class="table-card">
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Issue ID</th>        
                        <th>Category</th>        
                        <th>Description</th>    
                        <th>Status</th> 
                        <th>Created At</th> 
                        <th>Subject ID</th>  
                        <th>Teacher ID</th>  
                        <th>Class ID</th>   
                    </tr>
                </thead>
                <tbody>
                    <%
                    if (issueList != null && !issueList.isEmpty()) {
                        for (Map<String, String> issue : issueList) {
                            // Helper logic for status styling
                            String status = issue.get("status");
                            String statusClass = "status-pending"; // Default
                            if (status != null) {
                                if (status.equalsIgnoreCase("resolved") || status.equalsIgnoreCase("closed")) {
                                    statusClass = "status-resolved";
                                } else if (status.equalsIgnoreCase("open") || status.equalsIgnoreCase("critical")) {
                                    statusClass = "status-open";
                                }
                            } else {
                                status = "Unknown";
                            }
                    %>
                    <tr>
                        <td>#<%= issue.get("issue_id") %></td>
                        
                        <td>
                            <span class="category-chip">
                                <%= issue.get("category") %>
                            </span>
                        </td>
                        
                        <td class="desc-cell" title="<%= issue.get("issue_description") %>">
                            <%= issue.get("issue_description") %>
                        </td>

                        <td>
                            <span class="status-badge <%= statusClass %>">
                                <%= status %>
                            </span>
                        </td>
                        
                        <td><%= issue.get("created_at") %></td>
                        <td><%= issue.get("subject_id") %></td>
                        <td><%= issue.get("teacher_id") %></td>
                        <td><%= issue.get("class_id") %></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="8" style="text-align:center; padding: 40px;">
                            <span class="material-symbols-outlined" style="font-size: 48px; color: #ccc;">inbox</span>
                            <br><br>
                            No issues found in the system.
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
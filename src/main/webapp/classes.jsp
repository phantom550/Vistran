<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="classes.css">
</head>
<body>

    <div class="scrim"></div>

    <aside class="sidebar">
        <div class="logo-area">
            <span class="material-symbols-outlined">school</span>
            EduDash
        </div>
        <ul class="nav-links">
            <li class="nav-item">
                <a href="#" class="nav-link active">
                    <span class="material-symbols-outlined">dashboard</span>
                    Overview
                </a>
            </li>
            
            <li class="nav-item">
                <a href="raiseissue.jsp?subject=<%= request.getAttribute("subject") %>&teacher_id=<%= request.getAttribute("teacher_id") %>&classId=<%= request.getAttribute("classId") %>&subject_id=<%= request.getAttribute("subject_id") %>" class="nav-link">
                    <span class="material-symbols-outlined">report_problem</span>
                    Raise Issue
                </a>
            </li>

            <li class="nav-item">
                <a href="addstudent.jsp?subject=<%= request.getAttribute("subject") %>&teacher_id=<%= request.getAttribute("teacher_id") %>&classId=<%= request.getAttribute("classId") %>&subject_id=<%= request.getAttribute("subject_id") %>" class="nav-link" onclick="openModal('updateModal')">
                    <span class="material-symbols-outlined">edit_document</span>
                    Update Data
                </a>
            </li>
        </ul>
        
     <div style="margin-top: auto; padding: 16px;">
    <a href="index.html" class="nav-link" style="color: #B3261E;">
        <span class="material-symbols-outlined">logout</span>
        Logout
    </a>
</div>

    </aside>

    <main class="main-content">
        
        <div class="top-app-bar">
            <div style="display: flex; align-items: center; gap: 16px; overflow: hidden; width: 100%;">
                <button type="button" class="menu-btn" id="menuBtn">
                    <span class="material-symbols-outlined">menu</span>
                </button>
                <div class="chips-container" style="margin-bottom: 0;">
                    <button type="button" class="chip active">English</button>
                    <button type="button" class="chip">Hindi</button>
                    <button type="button" class="chip">Marathi</button>
                    <button type="button" class="chip">Tamil</button>
                    <button type="button" class="chip">Telugu</button>
                    <button type="button" class="chip">Urdu</button>
                    <button type="button" class="chip">Gujarati</button>
                    <button type="button" class="chip">Kannada</button>
                    <button type="button" class="chip">Malayalam</button>
                    <button type="button" class="chip">Bengali</button>
                </div>
            </div>
            <span class="material-symbols-outlined" style="cursor: pointer; flex-shrink: 0;">notifications</span>
        </div>

        <header class="dashboard-header">
            <div class="header-content">
                <div>
                    <h1 class="headline-small">Class <%= request.getAttribute("classId") %> <%= request.getAttribute("subject") %></h1>
                    <span class="label-large" style="color: #666;">Overview</span>
                </div>
                
                <div class="profile-chip" onclick="openModal('profileModal')" style="cursor: pointer;">
                    <div style="text-align: right;">
                        <div class="label-large">Mr. <%= request.getAttribute("name") %></div>
                        <div class="body-medium" style="font-size: 11px;"><%= request.getAttribute("sub") %></div>
                    </div>
                    <img src="https://ui-avatars.com/api/?name=Mr+Sharma&background=0061a4&color=fff&rounded=true" width="32" alt="Profile">
                </div>
            </div>
        </header>

        <section class="grid-3">
            <div class="stat-card">
                <div class="list-row" style="border: none; padding: 0;">
                    <span class="title-medium">Attendance</span>
                    <span class="material-symbols-outlined">more_horiz</span>
                </div>
                <div style="margin-top: 10px;">
                    <span class="headline-small" id="attendanceAvg">0%</span>
                    <span class="body-medium">Avg</span>
                </div>
                <div class="chart-box">
                    <canvas id="attendanceChart"></canvas>
                </div>
                <button type="button" class="btn-tonal" style="width: 100%; margin-top: 12px;">View Details</button>
            </div>

            <div class="stat-card">
                <div class="list-row" style="border: none; padding: 0;">
                    <span class="title-medium">Performance</span>
                    <span class="material-symbols-outlined">more_horiz</span>
                </div>
                <div class="chart-box">
                    <canvas id="performanceChart"></canvas>
                </div>
            </div>

            <div class="stat-card">
                <div class="list-row" style="border: none; padding: 0;">
                    <span class="title-medium">Behavior Data of <%= request.getAttribute("total") %> students</span>
                    <span class="material-symbols-outlined">more_horiz</span>
                </div>
                <div class="list-row">
                    <span class="label-large"><span class="material-symbols-outlined" style="vertical-align: -5px; color:#4caf50;">sentiment_satisfied</span> Good</span>
                    <span><%= request.getAttribute("good") %></span>
                </div>
                <div class="list-row">
                    <span class="label-large"><span class="material-symbols-outlined" style="vertical-align: -5px; color:#ff9800;">sentiment_neutral</span> Average</span>
                    <span><%= request.getAttribute("avg") %></span>
                </div>
                <div class="list-row">
                    <span class="label-large"><span class="material-symbols-outlined" style="vertical-align: -5px; color:#f44336;">sentiment_dissatisfied</span> Needs Work</span>
                    <span><%= request.getAttribute("low") %></span>
                </div>
            </div>
        </section>

        <section class="grid-3" style="margin-top: 24px;">

            <div class="stat-card">
                <div class="list-row" style="border: none; padding: 0; margin-bottom: 16px;">
                    <span class="title-medium">Recent Lessons</span>
                    <span class="material-symbols-outlined">smart_display</span>
                </div>

                <div style="display: flex; flex-direction: column; gap: 16px;">
                    <%
                        List<Map<String, String>> videos =
                                (List<Map<String, String>>) request.getAttribute("videos");

                        if (videos != null && !videos.isEmpty()) {
                            for (Map<String, String> video : videos) {
                    %>
                    <div style="display: flex; gap: 12px; align-items: center;">
                        <div style="width: 80px; height: 50px; background: #EADDFF;
                                    border-radius: 8px; display: flex;
                                    align-items: center; justify-content: center;">
                            <span class="material-symbols-outlined"
                                  style="color: var(--md-sys-color-primary);">
                                play_circle
                            </span>
                        </div>

                        <div>
                            <div class="label-large">
                                <%= video.get("title") %>
                            </div>

                           <%
                            String url = video.get("url");
                            if (url != null && url.endsWith(".mp4")) {
                            %>
                                <video width="220" controls style="margin-top: 6px; border-radius: 6px;">
                                    <source src="<%= url %>" type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                            <%
                            } else {
                                String embedUrl = url;
                                if (url != null && url.contains("youtube.com/watch")) {
                                    embedUrl = "https://www.youtube.com/embed/" +
                                               url.substring(url.indexOf("v=") + 2);
                                } else if (url != null && url.contains("youtu.be/")) {
                                    embedUrl = "https://www.youtube.com/embed/" +
                                               url.substring(url.lastIndexOf("/") + 1);
                                }
                            %>
                                <iframe width="220" height="140"
                                        src="<%= embedUrl %>"
                                        style="margin-top: 6px; border-radius: 6px;"
                                        frameborder="0"
                                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                        allowfullscreen>
                                </iframe>
                            <%
                            }
                            %>
                        </div>
                    </div>
                    <%
                            }
                        } else {
                    %>
                        <p class="body-small" style="color:#666;">No lessons available</p>
                    <%
                        }
                    %>
                </div>

                <button type="button" class="btn-tonal"
                        style="width: 100%; margin-top: 16px;">
                    Go to Library
                </button>
            </div>

            <div class="stat-card" style="background: linear-gradient(135deg, #d1e4ff 0%, #fdfcff 100%); border: 1px solid #0061a4;">
                <div class="list-row" style="border:none; padding:0; margin-bottom:12px;">
                    <span style="font-weight:500; color:#001d36; font-size:18px;">AI Assistant</span>
                    <span class="material-symbols-outlined" style="color:#0061a4;">smart_toy</span>
                </div>
                <p style="font-size:13px; color:#001d36; margin-bottom:24px;">
                    Need help analyzing student data or finding notices? Use the new AI workspace.
                </p>
                <button type="button" onclick="window.location.href='chat.html'" class="btn-filled" style="width:100%;">
                    <span class="material-symbols-outlined" style="margin-right:8px;">open_in_new</span>
                    Launch Workspace
                </button>
            </div>

        </section>

        <section style="margin-top: 24px;">
            <div class="stat-card">
                <div class="list-row" style="border: none; padding: 0; margin-bottom: 16px;">
                    <span class="title-medium">Class Notices</span>
                    <span class="material-symbols-outlined">campaign</span>
                </div>

                <div style="max-height: 300px; overflow-y: auto; padding-right: 8px;">
                <%
                    List<Map<String, String>> notices =
                            (List<Map<String, String>>) request.getAttribute("notice");

                    if (notices != null && !notices.isEmpty()) {
                        for (Map<String, String> n : notices) {
                %>
                    <div class="list-row clickable-row"
                         onclick="showNotice(
                             'Notice',
                             '<%= n.get("date") %>',
                             '<%= n.get("description") %>'
                         )">
                        <div>
                            <span class="material-symbols-outlined"
                                  style="vertical-align:-6px;
                                         color:var(--md-sys-color-primary);
                                         margin-right:4px;
                                         font-size:20px;">
                                campaign
                            </span>
                            <span class="label-large">
                                <%= n.get("description") %>
                            </span>
                        </div>
                        <span class="body-small"><%= n.get("date") %></span>
                    </div>
                <%
                        }
                    } else {
                %>
                    <p class="body-small" style="color:#666;">No notices available</p>
                <%
                    }
                %>
                </div>
                </div>
        </section>

    </main>

    <div class="modal-overlay" id="profileModal">
        <div class="modal-box">
            <h3 class="modal-header">Profile Details</h3>
            <div class="profile-detail-header">
                <img src="https://ui-avatars.com/api/?name=Mr+Sharma&background=0061a4&color=fff&rounded=true&size=128" alt="Profile">
                <span class="headline-small">Mr. <%= request.getAttribute("name") %></span>
                <span class="body-medium" style="color: #666;"><%= request.getAttribute("sub") %></span>
            </div>
            
            <div class="profile-detail-info">
                <div class="info-row">
                    <span style="font-weight: 500;">Employee ID</span>
                    <span><%= request.getAttribute("teacher_id") %></span>
                </div>
                <div class="info-row">
                    <span style="font-weight: 500;">Email</span>
                    <span><%= request.getAttribute("email") %></span>
                </div>
                <div class="info-row">
                    <span style="font-weight: 500;">Joined</span>
                    <span><%= request.getAttribute("jDate") %></span>
                </div>
                <div class="info-row">
                    <span style="font-weight: 500;">Primary Subject</span>
                    <span><%= request.getAttribute("sub") %></span>
                </div>
                 <div class="info-row">
                    <span style="font-weight: 500;">Cluster</span>
                    <span><%= request.getAttribute("cluster") %></span>
                </div>
            </div>
            
            <div class="modal-actions" style="margin-top: 24px;">
                <button type="button" class="btn-tonal" onclick="location.href='editteacher.jsp?teacher_id=<%= request.getAttribute("teacher_id") %>&classId=<%= request.getAttribute("classId") %>&subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>'">
                    <span class="material-symbols-outlined" style="font-size: 18px; margin-right: 8px;">edit</span>
                    Edit
                </button>
                <button type="button" class="btn-filled" onclick="closeModal('profileModal')">Close</button>
            </div>
        </div>
    </div>

    <div class="modal-overlay" id="noticeModal">
        <div class="modal-box">
            <h3 class="modal-header" id="noticeTitle">Notice Title</h3>
            <p style="font-size: 12px; color: #666; margin-bottom: 12px;" id="noticeDate">Date</p>
            <p class="modal-body" id="noticeContent">
                This is the detailed content of the notice.
            </p>
            <div class="modal-actions">
                <button type="button" class="btn-tonal" onclick="closeModal('noticeModal')">Close</button>
            </div>
        </div>
    </div>

    <div class="modal-overlay" id="issueModal">
        <div class="modal-box">
            <h3 class="modal-header">Raise an Issue</h3>
            <div class="modal-body">
                <label style="display:block; margin-bottom:8px; font-weight:500;">Category</label>
                <div style="border: 1px solid #79747E; border-radius: 4px; padding: 10px; margin-bottom: 16px; color: #49454F;">
                    Facilities / IT Support
                </div>
                <label style="display:block; margin-bottom:8px; font-weight:500;">Description</label>
                <textarea style="width: 100%; border: 1px solid #79747E; border-radius: 4px; padding: 10px; resize: none; height: 80px; font-family: inherit;" placeholder="Describe the problem..."></textarea>
            </div>
            <div class="modal-actions">
                <button type="button" class="btn-tonal" onclick="closeModal('issueModal')">Cancel</button>
                <button type="button" class="btn-filled" onclick="alert('Issue Submitted!'); closeModal('issueModal')">Submit</button>
            </div>
        </div>
    </div>

    <div class="modal-overlay" id="updateModal">
        <div class="modal-box">
            <h3 class="modal-header">Update Class Data</h3>
            <div class="modal-body">
                <p>Select data set to synchronize:</p>
                <div style="margin-top: 10px; display: flex; gap: 8px; flex-wrap: wrap;">
                    <span class="chip active">Grades</span>
                    <span class="chip">Attendance</span>
                    <span class="chip">Remarks</span>
                </div>
                <p style="margin-top: 16px; font-size: 12px; color: #666;">Last synced: 2 hours ago</p>
            </div>
            <div class="modal-actions">
                <button type="button" class="btn-tonal" onclick="closeModal('updateModal')">Cancel</button>
                <button type="button" class="btn-filled" onclick="alert('Data Updated Successfully'); closeModal('updateModal')">Sync Now</button>
            </div>
        </div>
    </div>

<script>
    // Attendance data coming from servlet
    var attendanceData = [
        <%
            java.util.List<Integer> attend =
                    (java.util.List<Integer>) request.getAttribute("attend");

            if (attend != null) {
                for (int i = 0; i < attend.size(); i++) {
                    out.print(attend.get(i));
                    if (i < attend.size() - 1) out.print(",");
                }
            }
        %>
    ];

    // Renamed variable to avoid conflict with window.performance
    var performanceData = [
        <%
            java.util.List<Integer> perform =
                (java.util.List<Integer>) request.getAttribute("performance");

            if (perform != null) {
                for (int i = 0; i < perform.size(); i++) {
                    out.print(perform.get(i));
                    if (i < perform.size() - 1) out.print(",");
                }
            }
        %>
    ];

    var student = [
        <%
            java.util.List<String> studentName =
                (java.util.List<String>) request.getAttribute("sname");
            if (studentName != null) {
                for (int i = 0; i < studentName.size(); i++) {
                    out.print("\"" + studentName.get(i) + "\"");
                    if (i < studentName.size() - 1) out.print(",");
                }
            }
        %>
    ];
</script>

<script src="classes.js"></script>
</body>
</html>
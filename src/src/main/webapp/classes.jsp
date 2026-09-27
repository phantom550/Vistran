<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Dashboard - Vistran</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        /* --- PATINA & BRONZE THEME --- */
        :root {
            --patina-dark: #134E4A;
            --patina-mid: #2D7A7B;
            --patina-light: #99F6E4;
            --copper-dark: #78350F;
            --copper-mid: #B45309;
            --copper-light: #F59E0B;
            --bg-page: #F2F7F6;
            --surface-glass: rgba(255, 255, 255, 0.95);
            --surface-border: rgba(45, 122, 123, 0.15);
            --text-main: #132A28;
            --text-muted: #4A6360;
            --sidebar-width: 260px;
            --header-height: 70px;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--bg-page);
            background: 
                radial-gradient(circle at 5% 10%, rgba(153, 246, 228, 0.2) 0%, transparent 40%),
                radial-gradient(circle at 95% 90%, rgba(253, 230, 138, 0.15) 0%, transparent 40%);
            color: var(--text-main);
            display: flex;
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* --- MOBILE OVERLAY --- */
        .scrim {
            position: fixed; inset: 0; background: rgba(0,0,0,0.5); z-index: 900;
            display: none; backdrop-filter: blur(2px);
        }
        .scrim.active { display: block; }

        /* --- SIDEBAR --- */
        .sidebar {
            width: var(--sidebar-width);
            background: var(--patina-dark);
            color: white;
            display: flex;
            flex-direction: column;
            position: fixed;
            height: 100vh;
            z-index: 1000;
            transition: transform 0.3s ease;
            box-shadow: 4px 0 15px rgba(0,0,0,0.1);
        }

        .logo-area {
            height: var(--header-height);
            display: flex; align-items: center; justify-content: space-between; /* Space for close btn */
            padding: 0 24px;
            font-size: 1.4rem; font-weight: 700;
            color: var(--patina-light);
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        
        .logo-content { display: flex; align-items: center; gap: 12px; }
        .logo-content .material-symbols-rounded { color: var(--copper-light); }

        /* Close Button (Mobile Only) */
        .close-sidebar-btn {
            background: none; border: none; cursor: pointer;
            color: var(--patina-light);
            display: none; /* Hidden on desktop */
        }

        .nav-links { list-style: none; padding: 16px; display: flex; flex-direction: column; gap: 8px; }
        
        .nav-link {
            display: flex; align-items: center; gap: 12px;
            padding: 12px 16px; border-radius: 8px;
            color: rgba(255,255,255,0.8); text-decoration: none;
            transition: 0.2s; font-weight: 500;
        }
        .nav-link:hover, .nav-link.active { background: rgba(255,255,255,0.1); color: var(--copper-light); }

        /* --- MAIN CONTENT --- */
        .main-content {
            margin-left: var(--sidebar-width);
            flex: 1; padding: 24px; width: calc(100% - var(--sidebar-width));
            transition: margin 0.3s ease;
        }

        /* --- TOP BAR --- */
        .top-app-bar {
            display: flex; align-items: center; justify-content: space-between;
            margin-bottom: 24px; background: var(--surface-glass);
            padding: 12px 20px; border-radius: 12px;
            border: 1px solid var(--surface-border); backdrop-filter: blur(10px);
        }
        .menu-btn { background: none; border: none; cursor: pointer; color: var(--patina-dark); display: none; }

        .chips-container {
            display: flex; gap: 8px; overflow-x: auto; padding-bottom: 4px; scrollbar-width: none;
        }
        .chips-container::-webkit-scrollbar { display: none; }

        .chip {
            border: 1px solid var(--patina-mid); background: transparent; color: var(--patina-dark);
            padding: 6px 16px; border-radius: 50px; cursor: pointer; white-space: nowrap; font-size: 0.85rem;
            transition: 0.2s;
        }
        .chip.active, .chip:hover { background: var(--patina-mid); color: white; }

        /* --- HEADER --- */
        .header-content {
            display: flex; justify-content: space-between; align-items: center;
            margin-bottom: 30px; flex-wrap: wrap; gap: 20px;
        }
        .headline-small { font-size: 1.8rem; font-weight: 700; color: var(--patina-dark); margin: 0; }

        .profile-chip {
            display: flex; align-items: center; gap: 12px;
            background: white; padding: 6px 12px 6px 20px;
            border-radius: 50px; border: 1px solid var(--surface-border);
            cursor: pointer; transition: 0.2s; user-select: none;
        }
        .profile-chip:hover { box-shadow: 0 4px 10px rgba(0,0,0,0.05); transform: translateY(-1px); }
        .profile-chip img { border-radius: 50%; border: 2px solid var(--copper-mid); }

        /* --- GRIDS --- */
        .grid-3 { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; margin-bottom: 24px; }
        .grid-2-split { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; margin-bottom: 24px; }

        /* --- CARDS --- */
        .stat-card {
            background: var(--surface-glass); border: 1px solid var(--surface-border);
            border-radius: 16px; padding: 20px;
            box-shadow: 0 4px 20px rgba(19, 78, 74, 0.05);
            display: flex; flex-direction: column;
        }

        .list-row {
            display: flex; justify-content: space-between; align-items: center;
            padding: 8px 0; border-bottom: 1px solid rgba(0,0,0,0.05);
        }
        .list-row:last-child { border-bottom: none; }

        .title-medium { font-weight: 600; color: var(--patina-mid); }
        .headline-large { font-size: 2.5rem; font-weight: 700; color: var(--copper-dark); }
        .chart-box { position: relative; height: 150px; width: 100%; margin-top: 15px; }

        /* --- BUTTONS --- */
        .btn-tonal {
            background: rgba(45, 122, 123, 0.1); color: var(--patina-dark);
            border: none; padding: 10px 16px; border-radius: 8px; cursor: pointer; font-weight: 500;
        }
        .btn-tonal:hover { background: rgba(45, 122, 123, 0.2); }

        .btn-filled {
            background: linear-gradient(135deg, var(--patina-dark), var(--patina-mid));
            color: white; border: none; padding: 10px 20px;
            border-radius: 8px; cursor: pointer; font-weight: 500;
            display: flex; align-items: center; justify-content: center; gap: 8px;
        }

        /* --- VIDEO SECTION STYLES (Single Column) --- */
        .video-scroll-container {
            height: 320px; /* Fixed Height */
            overflow-y: auto; /* Scrollable */
            padding-right: 8px;
            scrollbar-width: thin;
            scrollbar-color: var(--patina-mid) transparent;
        }
        .video-scroll-container::-webkit-scrollbar { width: 6px; }
        .video-scroll-container::-webkit-scrollbar-thumb { background: var(--patina-mid); border-radius: 10px; }

        /* Single Column Flex List */
        .video-list-grid {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        /* Horizontal Video Card */
        .video-item {
            display: flex; gap: 15px; align-items: center;
            background: white; padding: 10px; border-radius: 8px;
            border: 1px solid var(--surface-border);
            cursor: pointer;
            transition: transform 0.1s ease, background 0.1s ease;
        }
        
        .video-item:hover {
            background: #F0FDFA; 
            transform: translateX(3px);
            border-color: var(--patina-mid);
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .video-thumbnail-box {
            width: 120px; height: 68px; /* Fixed size thumbnail */
            flex-shrink: 0;
            background: var(--patina-light);
            border-radius: 6px;
            overflow: hidden;
            display: flex; align-items: center; justify-content: center;
            position: relative;
        }

        /* --- MODALS --- */
        .modal-overlay {
            position: fixed; inset: 0; background: rgba(0,0,0,0.6);
            display: none; justify-content: center; align-items: center; z-index: 2000;
            backdrop-filter: blur(4px);
        }
        .modal-overlay.active { display: flex; }

        .modal-box {
            background: white; width: 90%; max-width: 500px;
            border-radius: 20px; padding: 24px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .modal-header {
            font-size: 1.2rem; font-weight: 700; color: var(--patina-dark);
            margin-bottom: 16px; border-bottom: 2px solid var(--copper-light); padding-bottom: 8px;
        }

        /* --- RESPONSIVE --- */
        @media (max-width: 900px) {
            .sidebar { transform: translateX(-100%); }
            .sidebar.active { transform: translateX(0); }
            
            /* Show Menu Buttons */
            .menu-btn { display: block; }
            .close-sidebar-btn { display: block; }
            
            .main-content { margin-left: 0; width: 100%; }
            .grid-3, .grid-2-split { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

    <div class="scrim" onclick="toggleSidebar()"></div>

    <aside class="sidebar" id="sidebar">
        <div class="logo-area">
            <div class="logo-content">
                <span class="material-symbols-rounded">school</span>
                Vistran
            </div>
            <button class="close-sidebar-btn" onclick="toggleSidebar()">
                <span class="material-symbols-rounded" style="font-size: 24px;">close</span>
            </button>
        </div>
        
        <ul class="nav-links">
            <li class="nav-item">
                <a href="#" class="nav-link active">
                    <span class="material-symbols-rounded">dashboard</span>
                    Overview
                </a>
            </li>
            <li class="nav-item">
                <a href="raiseissue.jsp?subject=<%= request.getAttribute("subject") %>&teacher_id=<%= request.getAttribute("teacher_id") %>&classId=<%= request.getAttribute("classId") %>&subject_id=<%= request.getAttribute("subject_id") %>" class="nav-link">
                    <span class="material-symbols-rounded">report_problem</span>
                    Raise Issue
                </a>
            </li>
            <li class="nav-item">
                <a href="addstudent.jsp?subject=<%= request.getAttribute("subject") %>&teacher_id=<%= request.getAttribute("teacher_id") %>&classId=<%= request.getAttribute("classId") %>&subject_id=<%= request.getAttribute("subject_id") %>" class="nav-link" onclick="openModal('updateModal')">
                    <span class="material-symbols-rounded">edit_document</span>
                    Update Data
                </a>
            </li>
        </ul>
        <div style="margin-top: auto; padding: 16px;">
            <a href="index.html" class="nav-link" style="color: #FFB4AB;">
                <span class="material-symbols-rounded">logout</span>
                Logout
            </a>
        </div>
    </aside>

    <main class="main-content">
        
        <div class="top-app-bar">
            <div style="display: flex; align-items: center; gap: 16px; overflow: hidden; width: 100%;">
                <button type="button" class="menu-btn" onclick="toggleSidebar()">
                    <span class="material-symbols-rounded">menu</span>
                </button>
                <div class="chips-container">
                    <button type="button" class="chip active">English</button>
                    <button type="button" class="chip">Hindi</button>
                    <button type="button" class="chip">Marathi</button>
                    <button type="button" class="chip">Tamil</button>
                    <button type="button" class="chip">Gujarati</button>
                </div>
            </div>
            <span class="material-symbols-rounded" style="cursor: pointer; color: var(--patina-dark);">notifications</span>
        </div>

        <header class="dashboard-header">
            <div class="header-content">
                <div>
                    <h1 class="headline-small">Class <%= request.getAttribute("classId") %> <%= request.getAttribute("subject") %></h1>
                    <span style="color: var(--text-muted);">Overview</span>
                </div>
                
                <div class="profile-chip" onclick="openModal('profileModal')">
                    <div style="text-align: right;">
                        <div style="font-weight:600; color:var(--text-main);">Mr. <%= request.getAttribute("name") %></div>
                        <div style="font-size: 11px; color:var(--text-muted);"><%= request.getAttribute("sub") %></div>
                    </div>
                    <img src="https://ui-avatars.com/api/?name=Mr+Sharma&background=2D7A7B&color=fff&rounded=true" width="36" alt="Profile">
                </div>
            </div>
        </header>

        <section class="grid-3">
            <div class="stat-card">
                <div class="list-row" style="border:none;"><span class="title-medium">Attendance</span><span class="material-symbols-rounded">more_horiz</span></div>
                <div style="margin-top: 10px;"><span class="headline-large" id="attendanceAvg">0%</span><span style="color: var(--text-muted);">Avg</span></div>
                <div class="chart-box"><canvas id="attendanceChart"></canvas></div>
                <button type="button" class="btn-tonal" style="width: 100%; margin-top: 12px;">View Details</button>
            </div>
            <div class="stat-card">
                <div class="list-row" style="border:none;"><span class="title-medium">Performance</span><span class="material-symbols-rounded">more_horiz</span></div>
                <div class="chart-box"><canvas id="performanceChart"></canvas></div>
            </div>
            <div class="stat-card">
                <div class="list-row" style="border:none;"><span class="title-medium">Behavior (<%= request.getAttribute("total") %>)</span><span class="material-symbols-rounded">more_horiz</span></div>
                <div class="list-row"><span style="display:flex; gap:5px;"><span class="material-symbols-rounded" style="color:#4caf50;">sentiment_satisfied</span> Good</span><b><%= request.getAttribute("good") %></b></div>
                <div class="list-row"><span style="display:flex; gap:5px;"><span class="material-symbols-rounded" style="color:#ff9800;">sentiment_neutral</span> Average</span><b><%= request.getAttribute("avg") %></b></div>
                <div class="list-row"><span style="display:flex; gap:5px;"><span class="material-symbols-rounded" style="color:#f44336;">sentiment_dissatisfied</span> Poor</span><b><%= request.getAttribute("low") %></b></div>
            </div>
        </section>

        <section class="grid-2-split">
            
            <div class="stat-card">
                <div class="list-row" style="border:none; margin-bottom:16px;">
                    <span class="title-medium">Recent Lessons</span>
                    <span class="material-symbols-rounded">smart_display</span>
                </div>

                <div class="video-scroll-container">
                    <div class="video-list-grid">
                        <%
                            List<Map<String, String>> videos = (List<Map<String, String>>) request.getAttribute("videos");
                            if (videos != null && !videos.isEmpty()) {
                                for (Map<String, String> video : videos) {
                                    String url = video.get("url");
                        %>
                        <div class="video-item" onclick="window.open('<%= url %>', '_blank')">
                            <div class="video-thumbnail-box">
                                <%
                                if (url != null && url.endsWith(".mp4")) {
                                %>
                                    <video width="100%" height="100%" style="object-fit:cover;">
                                        <source src="<%= url %>" type="video/mp4">
                                    </video>
                                    <span class="material-symbols-rounded" style="position:absolute; color:white; font-size:20px; text-shadow:0 1px 3px black;">play_circle</span>
                                <% } else { 
                                    String embedUrl = url;
                                    if (url != null && url.contains("youtube.com/watch")) embedUrl = "https://www.youtube.com/embed/" + url.substring(url.indexOf("v=") + 2);
                                    else if (url != null && url.contains("youtu.be/")) embedUrl = "https://www.youtube.com/embed/" + url.substring(url.lastIndexOf("/") + 1);
                                %>
                                    <iframe width="100%" height="100%" src="<%= embedUrl %>" style="border:none; pointer-events:none;" allowfullscreen></iframe>
                                    <div style="position:absolute; width:100%; height:100%;"></div>
                                <% } %>
                            </div>
                            
                            <div style="flex:1; overflow:hidden;">
                                <div style="font-weight:600; color:var(--text-main); font-size:0.95rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                    <%= video.get("title") %>
                                </div>
                                <span style="font-size:0.8rem; color:var(--copper-mid); display:flex; align-items:center; margin-top:4px;">
                                    <span class="material-symbols-rounded" style="font-size:16px; margin-right:4px;">play_arrow</span>
                                    Watch Now
                                </span>
                            </div>
                        </div>
                        <% } } else { %>
                            <p style="color:var(--text-muted); text-align:center;">No lessons available</p>
                        <% } %>
                    </div>
                </div>
                <button type="button" class="btn-tonal" style="width: 100%; margin-top: 16px;">Go to Library</button>
            </div>

            <div class="stat-card" style="background: linear-gradient(135deg, #E6FFFA 0%, #FFFFFF 100%); border: 1px solid var(--patina-mid);">
                <div class="list-row" style="border:none; margin-bottom:12px;">
                    <span style="font-weight:600; color:var(--patina-dark); font-size:18px;">AI Assistant</span>
                    <span class="material-symbols-rounded" style="color:var(--copper-mid);">smart_toy</span>
                </div>
                <p style="font-size:13px; color:var(--text-main); margin-bottom:24px;">Need help analyzing data? Use the AI workspace.</p>
                <button type="button" onclick="window.location.href='chat.html'" class="btn-filled" style="width:100%;">
                    <span class="material-symbols-rounded" style="margin-right:8px;">open_in_new</span>
                    Launch Workspace
                </button>
            </div>
        </section>

        <section>
            <div class="stat-card">
                <div class="list-row" style="border:none; margin-bottom:16px;">
                    <span class="title-medium">Class Notices</span>
                    <span class="material-symbols-rounded">campaign</span>
                </div>
                <div style="max-height: 300px; overflow-y: auto; padding-right: 8px;">
                <%
                    List<Map<String, String>> notices = (List<Map<String, String>>) request.getAttribute("notice");
                    if (notices != null && !notices.isEmpty()) {
                        for (Map<String, String> n : notices) {
                %>
                    <div class="list-row" style="cursor:pointer;" onclick="openNoticeModal('<%= n.get("description") %>', '<%= n.get("date") %>')">
                        <div>
                            <span class="material-symbols-rounded" style="vertical-align:-6px; color:var(--copper-mid); margin-right:4px; font-size:20px;">campaign</span>
                            <span style="font-weight:500;"><%= n.get("description") %></span>
                        </div>
                        <span style="font-size:0.8rem; color:var(--text-muted);"><%= n.get("date") %></span>
                    </div>
                <% } } else { %>
                    <p style="color:var(--text-muted);">No notices available</p>
                <% } %>
                </div>
            </div>
        </section>

    </main>

    <div class="modal-overlay" id="profileModal">
        <div class="modal-box">
            <h3 class="modal-header">Profile Details</h3>
            <div style="display:flex; align-items:center; gap:15px; margin-bottom:20px;">
                <img src="https://ui-avatars.com/api/?name=Mr+Sharma&background=2D7A7B&color=fff&rounded=true&size=64" alt="Profile" style="border-radius:50%;">
                <div>
                    <span style="font-size:1.5rem; font-weight:700; color:var(--patina-dark);">Mr. <%= request.getAttribute("name") %></span><br>
                    <span style="color:var(--text-muted);"><%= request.getAttribute("sub") %></span>
                </div>
            </div>
            <div style="display:grid; gap:10px;">
                <div class="list-row"><span>Employee ID</span> <b><%= request.getAttribute("teacher_id") %></b></div>
                <div class="list-row"><span>Email</span> <b><%= request.getAttribute("email") %></b></div>
                <div class="list-row"><span>Joined</span> <b><%= request.getAttribute("jDate") %></b></div>
                <div class="list-row"><span>Cluster</span> <b><%= request.getAttribute("cluster") %></b></div>
            </div>
            <div style="margin-top: 24px; display:flex; gap:10px; justify-content:flex-end;">
                <button type="button" class="btn-tonal" onclick="location.href='editteacher.jsp?teacher_id=<%= request.getAttribute("teacher_id") %>&classId=<%= request.getAttribute("classId") %>&subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>'">Edit</button>
                <button type="button" class="btn-filled" onclick="closeModal('profileModal')">Close</button>
            </div>
        </div>
    </div>

    <div class="modal-overlay" id="noticeModal">
        <div class="modal-box">
            <h3 class="modal-header" id="noticeTitle">Notice Detail</h3>
            <p style="font-size: 12px; color: var(--text-muted); margin-bottom: 12px;" id="noticeDate"></p>
            <p id="noticeContent" style="margin-bottom:20px;"></p>
            <button type="button" class="btn-filled" onclick="closeModal('noticeModal')" style="width:100%">Close</button>
        </div>
    </div>

    <div class="modal-overlay" id="updateModal">
        <div class="modal-box">
            <h3 class="modal-header">Update Class Data</h3>
            <p>Select data set to synchronize:</p>
            <div style="margin-top: 10px; display: flex; gap: 8px; flex-wrap: wrap;">
                <button class="chip active">Grades</button>
                <button class="chip">Attendance</button>
                <button class="chip">Remarks</button>
            </div>
            <div style="margin-top: 24px; display:flex; gap:10px; justify-content:flex-end;">
                <button type="button" class="btn-tonal" onclick="closeModal('updateModal')">Cancel</button>
                <button type="button" class="btn-filled" onclick="alert('Data Updated'); closeModal('updateModal')">Sync Now</button>
            </div>
        </div>
    </div>

<script>
    // UI Scripts
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        const scrim = document.querySelector('.scrim');
        sidebar.classList.toggle('active');
        scrim.classList.toggle('active');
    }

    function openModal(id) {
        document.getElementById(id).classList.add('active');
    }

    function closeModal(id) {
        document.getElementById(id).classList.remove('active');
    }

    function openNoticeModal(desc, date) {
        document.getElementById('noticeContent').innerText = desc;
        document.getElementById('noticeDate').innerText = date;
        openModal('noticeModal');
    }
</script>

<script>
    // Data Injection for Charts
    var attendanceData = [
        <%
            java.util.List<Integer> attend = (java.util.List<Integer>) request.getAttribute("attend");
            if (attend != null) {
                for (int i = 0; i < attend.size(); i++) {
                    out.print(attend.get(i));
                    if (i < attend.size() - 1) out.print(",");
                }
            }
        %>
    ];

    var performanceData = [
        <%
            java.util.List<Integer> perform = (java.util.List<Integer>) request.getAttribute("performance");
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
            java.util.List<String> studentName = (java.util.List<String>) request.getAttribute("sname");
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
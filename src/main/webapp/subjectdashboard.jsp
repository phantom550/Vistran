<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Training Portal - <%= request.getAttribute("subject") %></title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

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
            --surface-border: rgba(45, 122, 123, 0.2);
            --text-main: #132A28;
            --text-muted: #4A6360;
            --nav-height: 70px;
            --sidebar-width: 260px;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--bg-page);
            background: radial-gradient(circle at 10% 20%, rgba(153, 246, 228, 0.1) 0%, transparent 40%),
                        radial-gradient(circle at 90% 80%, rgba(253, 230, 138, 0.1) 0%, transparent 40%);
            color: var(--text-main);
            height: 100vh;
            overflow: hidden; 
            display: flex; flex-direction: column;
        }

        /* --- NAVIGATION --- */
        nav {
            height: var(--nav-height);
            background: var(--patina-dark);
            color: white;
            display: flex; align-items: center; justify-content: space-between;
            padding: 0 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            z-index: 100; flex-shrink: 0;
        }

        .nav-left { display: flex; align-items: center; gap: 15px; }
        .hamburger-btn { background: none; border: none; color: var(--patina-light); cursor: pointer; font-size: 28px; display: flex; align-items: center; }
        .nav-subject { font-size: 1.2rem; font-weight: 700; background: linear-gradient(135deg, #FFDCC1 0%, #F59E0B 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
        .profile-container { display: flex; align-items: center; gap: 12px; background: rgba(255,255,255,0.1); padding: 5px 15px; border-radius: 50px; font-size: 0.85rem; }
        .profile-photo { width: 32px; height: 32px; border-radius: 50%; border: 2px solid var(--copper-mid); }

        /* --- LAYOUT --- */
        .main-container { display: flex; height: calc(100vh - var(--nav-height)); position: relative; overflow: hidden; }

        /* --- SIDEBAR --- */
        .sidebar {
            width: var(--sidebar-width); background: rgba(255, 255, 255, 0.9); border-right: 1px solid var(--surface-border);
            backdrop-filter: blur(10px); padding: 20px; display: flex; flex-direction: column; gap: 10px;
            transition: transform 0.3s ease, width 0.3s ease; overflow-y: auto; flex-shrink: 0;
        }
        .sidebar.collapsed { width: 0; padding: 20px 0; overflow: hidden; border: none; }
        .sidebar h3 { color: var(--copper-dark); font-size: 0.8rem; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 10px; padding-left: 5px; opacity: 0.7; }
        
        .class-btn {
            background: white; border: 1px solid var(--surface-border); padding: 12px; text-align: left; border-radius: 10px;
            cursor: pointer; color: var(--patina-dark); font-weight: 500; transition: 0.2s; display: flex; align-items: center; gap: 10px;
        }
        .class-btn:hover { background: var(--patina-light); transform: translateX(5px); border-color: var(--patina-mid); }

        /* --- CONTENT AREA --- */
        .content-area { flex: 1; padding: 20px; display: grid; grid-template-columns: 1.8fr 1.2fr; gap: 20px; overflow: hidden; }
        
        @media (max-width: 1000px) {
            .content-area { grid-template-columns: 1fr; overflow-y: auto; }
        }

        .section-panel {
            background: var(--surface-glass); border: 1px solid var(--surface-border); border-radius: 20px; padding: 20px;
            box-shadow: 0 8px 32px rgba(19, 78, 74, 0.05); display: flex; flex-direction: column; height: 100%; overflow: hidden;
        }

        .section-header { 
            font-size: 1.2rem; font-weight: 700; margin-bottom: 20px; color: var(--patina-dark); 
            display: flex; align-items: center; gap: 10px; flex-shrink: 0;
        }

        .scrollable-content { flex: 1; overflow-y: auto; padding-right: 8px; }
        .scrollable-content::-webkit-scrollbar { width: 5px; }
        .scrollable-content::-webkit-scrollbar-thumb { background: var(--patina-mid); border-radius: 10px; }

        /* --- VIDEO ITEM STYLES --- */
        .video-item {
            display: flex; gap: 16px; align-items: center; background: white; 
            padding: 12px; border-radius: 12px; border: 1px solid rgba(0,0,0,0.05);
            cursor: pointer; margin-bottom: 12px; transition: all 0.2s ease;
        }

        .video-item:hover {
            background: #F0FDFA; 
            transform: translateX(4px);
            border-color: var(--patina-mid);
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        .thumb-container {
            width: 130px; height: 74px; background: #000; border-radius: 8px;
            position: relative; overflow: hidden; flex-shrink: 0;
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        }

        .thumb-container img { width: 100%; height: 100%; object-fit: cover; }
        
        .play-badge {
            position: absolute; inset: 0; display: flex; align-items: center; justify-content: center;
            background: rgba(0,0,0,0.2); color: white;
        }

        .video-text h4 { font-size: 0.95rem; font-weight: 600; color: var(--text-main); margin-bottom: 4px; line-height: 1.3; }
        .video-meta { font-size: 0.75rem; font-weight: 700; color: var(--copper-mid); text-transform: uppercase; letter-spacing: 0.5px; display: flex; align-items: center; gap: 4px; }

        /* --- NOTICE CARDS --- */
        .notice-card { 
            background: white; border-left: 5px solid var(--copper-mid); 
            padding: 16px; margin-bottom: 12px; border-radius: 10px; 
            box-shadow: 0 2px 8px rgba(0,0,0,0.04); 
        }
        .notice-card p { font-size: 0.9rem; font-weight: 500; color: var(--text-main); margin-bottom: 6px; }
        .notice-date { font-size: 0.75rem; color: var(--text-muted); display: block; text-align: right; font-weight: 600; }

    </style>
</head>
<body>

<nav>
    <div class="nav-left">
        <button class="hamburger-btn" onclick="toggleSidebar()"><span class="material-symbols-rounded">menu</span></button>
        <div class="nav-subject"><%= request.getAttribute("subject") %> Training</div>
    </div>
    <div class="profile-container">
        <span>Employee ID: <%= request.getAttribute("subject_id") %></span>
        <img src="https://ui-avatars.com/api/?name=Teacher&background=2D7A7B&color=fff" alt="Profile" class="profile-photo">
    </div>
</nav>

<div class="main-container">
    <aside class="sidebar" id="sidebar">
        <h3>Class Levels</h3>
        <% for (int i = 1; i <= 10; i++) { %>
            <button class="class-btn" onclick="location.href='ClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=<%= i %>'">
                <span class="material-symbols-rounded" style="color:var(--copper-mid); font-size:20px;">school</span>
                Class <%= i %>
            </button>
        <% } %>
    </aside>

    <main class="content-area">
        <section class="section-panel">
            <h2 class="section-header">
                <span class="material-symbols-rounded" style="color:var(--patina-mid);">video_library</span>
                Video Lessons & Resources
            </h2>
            <div class="scrollable-content">
                <%
                    List<Map<String, String>> videos = (List<Map<String, String>>) request.getAttribute("videos");
                    if (videos != null && !videos.isEmpty()) {
                        for (Map<String, String> video : videos) {
                            String url = video.get("url");
                            String title = video.get("title");
                            String vId = "";
                            
                            // Extract ID for Thumbnail Only
                            if (url != null && !url.isEmpty()) {
                                if (url.contains("v=")) vId = url.split("v=")[1].split("&")[0];
                                else if (url.contains("youtu.be/")) vId = url.substring(url.lastIndexOf("/") + 1).split("\\?")[0];
                                else if (url.contains("/embed/")) vId = url.substring(url.indexOf("/embed/") + 7).split("\\?")[0];
                                else if (url.contains("/shorts/")) vId = url.substring(url.indexOf("/shorts/") + 8).split("\\?")[0];
                            }
                %>
                <div class="video-item" onclick="window.open('<%= url %>', '_blank')">
                    <div class="thumb-container">
                        <% if (!vId.isEmpty()) { %>
                            <img src="https://img.youtube.com/vi/<%= vId %>/mqdefault.jpg" alt="Preview">
                        <% } else { %>
                            <div style="width:100%; height:100%; display:flex; align-items:center; justify-content:center; background:var(--patina-dark);">
                                <span class="material-symbols-rounded" style="color:white;">play_circle</span>
                            </div>
                        <% } %>
                        <div class="play-badge">
                            <span class="material-symbols-rounded" style="font-size:30px;">play_arrow</span>
                        </div>
                    </div>
                    <div class="video-text">
                        <h4><%= title %></h4>
                        <div class="video-meta">
                            <span class="material-symbols-rounded" style="font-size:14px;">open_in_new</span>
                            Watch Lesson
                        </div>
                    </div>
                </div>
                <% } } else { %>
                    <p style="text-align:center; padding:40px; color:var(--text-muted); font-size:0.9rem;">No videos assigned to this class level yet.</p>
                <% } %>
            </div>
        </section>

        <section class="section-panel">
            <h2 class="section-header">
                <span class="material-symbols-rounded" style="color:var(--copper-mid);">campaign</span>
                Announcements
            </h2>
            <div class="scrollable-content">
                <%
                    List<Map<String, String>> notices = (List<Map<String, String>>) request.getAttribute("notice");
                    if (notices != null && !notices.isEmpty()) {
                        for (Map<String, String> n : notices) {
                %>
                <div class="notice-card">
                    <p><%= n.get("description") %></p>
                    <span class="notice-date"><%= n.get("date") %></span>
                </div>
                <% } } else { %>
                    <p style="text-align:center; padding:40px; color:var(--text-muted); font-size:0.9rem;">No recent announcements.</p>
                <% } %>
            </div>
        </section>
    </main>
</div>

<script>
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        if (window.innerWidth <= 1000) {
            sidebar.classList.toggle('active');
        } else {
            sidebar.classList.toggle('collapsed');
        }
    }

    // Auto-close sidebar on mobile after clicking a class
    window.addEventListener('resize', () => {
        if (window.innerWidth > 1000) {
            document.getElementById('sidebar').classList.remove('active');
        }
    });
</script>

</body>
</html>
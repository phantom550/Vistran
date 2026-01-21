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
            background: radial-gradient(circle at 10% 20%, rgba(153, 246, 228, 0.2) 0%, transparent 40%),
                        radial-gradient(circle at 90% 80%, rgba(253, 230, 138, 0.15) 0%, transparent 40%);
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
        .profile-container { display: flex; align-items: center; gap: 12px; background: rgba(255,255,255,0.1); padding: 5px 15px; border-radius: 50px; font-size: 0.9rem; }
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
        .sidebar h3 { color: var(--copper-dark); font-size: 0.9rem; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 10px; padding-left: 5px; }
        
        .class-btn {
            background: white; border: 1px solid var(--surface-border); padding: 12px; text-align: left; border-radius: 8px;
            cursor: pointer; color: var(--patina-dark); font-weight: 500; transition: 0.2s; display: flex; align-items: center; gap: 10px;
        }
        .class-btn:hover { background: var(--patina-light); transform: translateX(5px); }

        /* --- CONTENT --- */
        .content-area { flex: 1; padding: 20px; display: grid; grid-template-columns: 2fr 1fr; gap: 20px; overflow: hidden; }
        .section-panel {
            background: var(--surface-glass); border: 1px solid var(--surface-border); border-radius: 16px; padding: 20px;
            box-shadow: 0 4px 20px rgba(19, 78, 74, 0.05); display: flex; flex-direction: column; height: 100%; overflow: hidden;
        }
        .section-header { font-size: 1.3rem; margin-bottom: 15px; color: var(--patina-dark); border-bottom: 2px solid var(--copper-light); padding-bottom: 10px; flex-shrink: 0; }
        .scrollable-content { flex: 1; overflow-y: auto; padding-right: 5px; }
        .scrollable-content::-webkit-scrollbar { width: 6px; }
        .scrollable-content::-webkit-scrollbar-thumb { background: var(--patina-mid); border-radius: 10px; }

        /* --- CARDS --- */
        .video-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 20px; }
        .video-card { background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 2px 8px rgba(0,0,0,0.05); transition: transform 0.2s; border: 1px solid rgba(0,0,0,0.05); }
        .video-card:hover { transform: translateY(-3px); box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        
        .thumbnail-box { position: relative; background: black; aspect-ratio: 16/9; display: flex; align-items: center; justify-content: center; cursor: pointer; }
        .video-info { padding: 12px; }
        .video-info h4 { font-size: 0.95rem; color: var(--text-main); margin-bottom: 5px; }
        .video-link { font-size: 0.8rem; color: var(--copper-mid); font-weight: 500; cursor: pointer; }

        .notice-card { background: white; border-left: 4px solid var(--copper-mid); padding: 15px; margin-bottom: 15px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.03); }
        .notice-card span:first-child { display: block; font-weight: 500; margin-bottom: 5px; color: var(--text-main); }
        .notice-card span:last-child { font-size: 0.8rem; color: var(--text-muted); display: block; text-align: right; }

        /* --- RESPONSIVE --- */
        @media (max-width: 900px) {
            .sidebar { position: fixed; height: 100%; z-index: 200; transform: translateX(-100%); box-shadow: 5px 0 15px rgba(0,0,0,0.2); }
            .sidebar.active { transform: translateX(0); }
            .content-area { grid-template-columns: 1fr; grid-template-rows: 1.5fr 1fr; }
        }
        @media (max-width: 600px) {
            .content-area { display: block; overflow-y: auto; }
            .section-panel { height: auto; max-height: 500px; margin-bottom: 20px; }
        }
        .modal-overlay { display: none; position: fixed; inset: 0; background: rgba(0,0,0,0.5); z-index: 150; backdrop-filter: blur(2px); }
    </style>
</head>
<body>

<nav>
    <div class="nav-left">
        <button class="hamburger-btn" onclick="toggleSidebar()"><span class="material-symbols-rounded">menu</span></button>
        <div class="nav-subject"><%= request.getAttribute("subject") %> Dashboard</div>
    </div>
    <div class="profile-container">
        <span>ID: <%= request.getAttribute("subject_id") %></span>
        <img src="https://ui-avatars.com/api/?name=Teacher+User&background=random&color=fff" alt="Profile" class="profile-photo">
    </div>
</nav>

<div class="modal-overlay" id="sidebarOverlay" onclick="toggleSidebar()"></div>

<div class="main-container">

    <aside class="sidebar" id="sidebar">
        <h3>Select Grade</h3>
        <% for (int i = 1; i <= 10; i++) { %>
            <button class="class-btn"
                onclick="location.href='ClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=<%= i %>'">
                <span class="material-symbols-rounded" style="color:var(--copper-mid); font-size:18px;">school</span>
                Class <%= i %>
            </button>
        <% } %>
    </aside>

    <main class="content-area">

        <section class="section-panel video-section">
            <h2 class="section-header">
                <span class="material-symbols-rounded" style="vertical-align:middle; margin-right:8px; color:var(--patina-mid);">video_library</span>
                Resources & Lessons
            </h2>

            <div class="scrollable-content">
                <div class="video-grid">
                    <%
                        List<Map<String, String>> videos = (List<Map<String, String>>) request.getAttribute("videos");

                        if (videos != null && !videos.isEmpty()) {
                            for (Map<String, String> video : videos) {
                                String url = video.get("url");
                                String title = video.get("title");
                                String embedUrl = "";
                                String videoId = "";
                                boolean isMp4 = url != null && url.endsWith(".mp4");
                                
                                // --- ROBUST ID EXTRACTION LOGIC ---
                                if (!isMp4 && url != null && !url.isEmpty()) {
                                    try {
                                        if (url.contains("v=")) {
                                            // Standard: youtube.com/watch?v=ID
                                            int vIndex = url.indexOf("v=");
                                            videoId = url.substring(vIndex + 2);
                                        } else if (url.contains("/embed/")) {
                                            // Embed: youtube.com/embed/ID
                                            videoId = url.substring(url.indexOf("/embed/") + 7);
                                        } else if (url.contains("/shorts/")) {
                                            // Shorts: youtube.com/shorts/ID
                                            videoId = url.substring(url.indexOf("/shorts/") + 8);
                                        } else if (url.contains("/live/")) {
                                            // Live: youtube.com/live/ID
                                            videoId = url.substring(url.indexOf("/live/") + 6);
                                        } else if (url.contains("youtu.be/")) {
                                            // Shortened: youtu.be/ID
                                            videoId = url.substring(url.lastIndexOf("/") + 1);
                                        }

                                        // Cleanup: Remove any trailing parameters (e.g. &t=10s or ?feature=share)
                                        if (!videoId.isEmpty()) {
                                            int ampIndex = videoId.indexOf("&");
                                            int qIndex = videoId.indexOf("?");
                                            
                                            // Cut off at the first occurrence of & or ?
                                            if (ampIndex != -1) videoId = videoId.substring(0, ampIndex);
                                            if (qIndex != -1 && (ampIndex == -1 || qIndex < ampIndex)) videoId = videoId.substring(0, qIndex);
                                            
                                            // Generate Clean Embed URL
                                            if (!videoId.isEmpty()) {
                                                embedUrl = "https://www.youtube.com/embed/" + videoId;
                                            }
                                        }
                                    } catch (Exception e) {
                                        // If parsing fails, leave embedUrl empty
                                        embedUrl = ""; 
                                    }
                                }
                    %>

                    <div class="video-card">
                        <div class="thumbnail-box" onclick="openVideo('<%= (embedUrl != null && !embedUrl.isEmpty()) ? embedUrl : url %>', '<%= isMp4 ? "mp4" : "yt" %>')">
                            <% if (isMp4) { %>
                                <video width="100%" height="100%" style="object-fit:cover;">
                                    <source src="<%= url %>" type="video/mp4">
                                </video>
                                <span class="material-symbols-rounded" style="position:absolute; color:white; font-size:40px; text-shadow:0 2px 5px black;">play_circle</span>
                            <% } else if (embedUrl != null && !embedUrl.isEmpty()) { %>
                                <iframe width="100%" height="100%"
                                        src="<%= embedUrl %>?controls=0&modestbranding=1&rel=0"
                                        frameborder="0" style="pointer-events:none;">
                                </iframe>
                                <div style="position:absolute; inset:0;"></div> 
                            <% } else { %>
                                <div style="color:white; text-align:center; padding:10px;">
                                    <span class="material-symbols-rounded" style="font-size:40px;">link</span>
                                    <p style="font-size:0.8rem; margin-top:5px;">Click to Open</p>
                                </div>
                            <% } %>
                        </div>

                        <div class="video-info">
                            <h4><%= title %></h4>
                            <span class="video-link" onclick="openVideo('<%= (embedUrl != null && !embedUrl.isEmpty()) ? embedUrl : url %>', '<%= isMp4 ? "mp4" : "yt" %>')">
                                <% if (embedUrl.isEmpty() && !isMp4) { %>
                                    Open Link 
                                <% } else { %>
                                    Tap to watch
                                <% } %>
                            </span>
                        </div>
                    </div>

                    <%
                            }
                        } else {
                    %>
                        <div style="grid-column: 1/-1; text-align:center; padding:20px; color:var(--text-muted);">
                            <span class="material-symbols-rounded" style="font-size:48px; opacity:0.5;">folder_off</span>
                            <p>No video resources found.</p>
                        </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </section>

        <section class="section-panel notices-section">
            <h2 class="section-header">
                <span class="material-symbols-rounded" style="vertical-align:middle; margin-right:8px; color:var(--copper-mid);">campaign</span>
                Notices
            </h2>
            <div class="scrollable-content">
                <%
                    List<Map<String, String>> notice = (List<Map<String, String>>) request.getAttribute("notice");
                    if (notice != null && !notice.isEmpty()) {
                        for (Map<String, String> n : notice) {
                %>
                    <div class="notice-card">
                        <span><%= n.get("description") %></span>
                        <span><%= n.get("date") %></span>
                    </div>
                <%
                        }
                    } else {
                %>
                    <div style="text-align:center; padding:20px; color:var(--text-muted);">
                        <p>No new notices.</p>
                    </div>
                <%
                    }
                %>
            </div>
        </section>

    </main>
</div>

<div id="videoModal" style="display:none; position:fixed; inset:0; background:rgba(0,0,0,0.9); z-index:9999; justify-content:center; align-items:center; backdrop-filter: blur(5px);">
    <div style="width:90%; max-width:900px; aspect-ratio: 16/9; background:#000; border-radius:12px; position:relative; overflow:hidden; box-shadow: 0 10px 30px rgba(0,0,0,0.5);">
        <button onclick="closeVideo()" style="position:absolute; top:10px; right:10px; background:rgba(255,255,255,0.2); border:none; color:white; border-radius:50%; width:35px; height:35px; cursor:pointer; z-index:10; display:flex; align-items:center; justify-content:center;">✕</button>
        <div id="videoContainer" style="width:100%; height:100%;"></div>
    </div>
</div>

<script>
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        const overlay = document.getElementById('sidebarOverlay');
        if (window.innerWidth <= 900) {
            sidebar.classList.toggle('active');
            overlay.style.display = sidebar.classList.contains('active') ? 'block' : 'none';
        } else {
            sidebar.classList.toggle('collapsed');
        }
    }

    function openVideo(url, type) {
        // --- PREVENT 404 ERROR ---
        if (!url || url.trim() === "" || url === "null") {
            alert("Video link is currently unavailable.");
            return;
        }

        const modal = document.getElementById("videoModal");
        const container = document.getElementById("videoContainer");
        container.innerHTML = "";

        if (type === "mp4") {
            container.innerHTML = `
                <video width="100%" height="100%" controls autoplay>
                    <source src="${url}" type="video/mp4">
                    Your browser does not support the video tag.
                </video>`;
        } else {
            // Check if it's a direct watch URL or embed URL
            let finalUrl = url;
            
            // If fallback was used and it's not an embed link, try to convert it or warn user
            // But usually the Java logic covers this. 
            // We append params safely.
            const separator = finalUrl.includes('?') ? '&' : '?';
            
            container.innerHTML = `
                <iframe width="100%" height="100%"
                    src="${finalUrl}${separator}autoplay=1&controls=1&rel=0"
                    frameborder="0"
                    allow="autoplay; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen>
                </iframe>`;
        }
        modal.style.display = "flex";
    }

    function closeVideo() {
        const container = document.getElementById("videoContainer");
        if(container) container.innerHTML = ""; // Stop playback
        document.getElementById("videoModal").style.display = "none";
    }
</script>

</body>
</html>
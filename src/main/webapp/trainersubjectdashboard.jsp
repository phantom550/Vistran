<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Training Portal - Admin</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
    
    <style>
        /* --- PATINA & BRONZE THEME --- */
        :root {
            /* Patina (Teals/Greens) */
            --patina-dark: #134E4A;
            --patina-mid: #2D7A7B;
            --patina-light: #99F6E4;
            
            /* Copper/Bronze */
            --copper-dark: #78350F;
            --copper-mid: #B45309;
            --copper-light: #F59E0B;
            
            /* Surfaces */
            --bg-page: #F2F7F6;
            --surface-glass: rgba(255, 255, 255, 0.95);
            --surface-border: rgba(45, 122, 123, 0.15);
            --text-main: #132A28;
            --text-muted: #4A6360;
            
            --sidebar-width: 260px;
            --header-height: 70px;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Roboto', sans-serif; }
        
        body { 
            background-color: var(--bg-page);
            background: 
                radial-gradient(circle at 10% 20%, rgba(153, 246, 228, 0.2) 0%, transparent 40%),
                radial-gradient(circle at 90% 80%, rgba(253, 230, 138, 0.15) 0%, transparent 40%);
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
            overflow-y: auto;
        }

        .brand { 
            height: var(--header-height);
            display: flex; align-items: center; justify-content: space-between;
            padding: 0 24px;
            font-weight: 700; font-size: 1.3rem; 
            color: var(--patina-light);
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 10px;
        }
        
        .close-sidebar-btn { display: none; background: none; border: none; color: white; cursor: pointer; }

        .sidebar-title {
            padding: 0 24px 8px 24px;
            font-size: 0.75rem;
            font-weight: 600;
            color: var(--copper-light);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 15px;
        }

        .menu-item {
            display: flex; align-items: center;
            padding: 12px 24px;
            cursor: pointer;
            transition: 0.2s;
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            font-size: 0.95rem;
            font-weight: 500;
        }
        
        .menu-item:hover, .menu-item.active { 
            background: rgba(255,255,255,0.1); 
            color: var(--copper-light);
            border-left: 3px solid var(--copper-light);
        }
        .menu-item i { width: 24px; margin-right: 10px; font-size: 1rem; text-align: center; }
        
        /* --- MAIN CONTENT --- */
        .main-content { 
            margin-left: var(--sidebar-width);
            flex: 1; 
            padding: 24px; 
            width: calc(100% - var(--sidebar-width));
            transition: margin 0.3s ease;
        }

        /* --- MOBILE TOP BAR --- */
        .top-app-bar {
            display: none; /* Hidden on desktop */
            align-items: center; justify-content: space-between;
            margin-bottom: 24px; background: var(--surface-glass);
            padding: 12px 20px; border-radius: 12px;
            border: 1px solid var(--surface-border); backdrop-filter: blur(10px);
        }
        .menu-btn { background: none; border: none; cursor: pointer; color: var(--patina-dark); }

        /* --- HEADER --- */
        .admin-header {
            display: flex; justify-content: space-between; align-items: center;
            margin-bottom: 30px; flex-wrap: wrap; gap: 20px;
        }
        .header-text h2 { 
            color: var(--patina-dark); font-weight: 700; font-size: 2rem; margin: 0; 
        }
        .header-text p { color: var(--text-muted); margin-top: 5px; }
        
        .admin-profile { 
            display: flex; align-items: center; gap: 12px; text-align: right; 
            background: white; padding: 8px 16px; border-radius: 50px; border: 1px solid var(--surface-border);
        }
        .admin-img { width: 40px; height: 40px; border-radius: 50%; object-fit: cover; border: 2px solid var(--copper-mid); }

        /* --- CARDS --- */
        .card {
            background: var(--surface-glass);
            padding: 24px;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(19, 78, 74, 0.05);
            border: 1px solid var(--surface-border);
        }

        .grid-3 {
            display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; margin-bottom: 24px;
        }

        .split-grid { 
            display: grid; grid-template-columns: 1.5fr 1fr; gap: 24px; 
        }

        .card-head { display: flex; justify-content: space-between; margin-bottom: 16px; align-items: center; }
        .badge-icon { 
            width: 40px; height: 40px; 
            border-radius: 12px; 
            display: flex; align-items: center; justify-content: center;
            background: var(--patina-light);
            color: var(--patina-dark);
            margin-right: 12px;
        }

        /* --- FORMS --- */
        .section-header {
            display: flex; align-items: center; margin-bottom: 24px;
            color: var(--patina-dark);
        }
        .section-header h3 { margin: 0; font-size: 1.2rem; }
        
        .md-input-group { margin-bottom: 20px; position: relative; }
        .md-input, .md-select, .md-textarea {
            width: 100%; padding: 14px 16px;
            background: white;
            border: 1px solid var(--surface-border);
            border-radius: 8px;
            font-size: 0.95rem; color: var(--text-main);
            transition: 0.2s;
        }
        .md-input:focus, .md-select:focus, .md-textarea:focus {
            outline: none; border-color: var(--patina-mid); 
            box-shadow: 0 0 0 3px rgba(45, 122, 123, 0.1);
        }
        
        .md-label {
            position: absolute; left: 12px; top: -9px;
            background: white; padding: 0 4px; font-size: 0.75rem;
            color: var(--text-muted); font-weight: 600;
        }
        .md-textarea { resize: none; height: 120px; }

        /* BUTTON STYLE (FIXED) */
        .btn-filled {
            background: linear-gradient(135deg, var(--patina-dark), var(--patina-mid));
            color: white; border: none; padding: 14px 24px;
            border-radius: 50px; font-weight: 600; cursor: pointer;
            display: flex; align-items: center; justify-content: center; gap: 8px;
            width: 100%; transition: 0.2s;
            font-size: 0.95rem;
        }
        .btn-filled:hover { transform: translateY(-2px); box-shadow: 0 4px 12px rgba(19, 78, 74, 0.2); }

        /* --- RESPONSIVE --- */
        @media (max-width: 900px) {
            .sidebar { transform: translateX(-100%); }
            .sidebar.active { transform: translateX(0); }
            
            .main-content { margin-left: 0; width: 100%; }
            .top-app-bar { display: flex; } /* Show mobile header */
            .close-sidebar-btn { display: block; } /* Show close btn */
            
            .grid-3 { grid-template-columns: 1fr; } /* Stack Stats */
            .split-grid { grid-template-columns: 1fr; } /* Stack Forms */
            
            .header-text h2 { font-size: 1.5rem; }
        }
    </style>
</head>
<body>

    <div class="scrim" onclick="toggleSidebar()"></div>

    <div class="sidebar" id="sidebar">
        <div class="brand">
            <div style="display:flex; align-items:center; gap:10px;">
                <i class="fa-solid fa-shapes"></i> <span>Vistran</span>
            </div>
            <button class="close-sidebar-btn" onclick="toggleSidebar()">
                <span class="material-symbols-rounded">close</span>
            </button>
        </div>
        
        <div class="sidebar-title">Main Menu</div>
        <a href="#" class="menu-item active">
            <i class="fa-solid fa-house"></i> Overview
        </a>
        
        <div class="sidebar-title" style="margin-top: 10px;">Manage Classes</div>

        <% for(int i=1; i<=10; i++) { %>
        <a href="TrainerClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=<%= i %>" class="menu-item">
            <i class="fa-solid fa-graduation-cap"></i> Class <%= i %>
        </a>
        <% } %>

        <div style="margin-top:auto; padding: 16px;">
            <a href="index.html" class="menu-item" style="color: #FFB4AB;">
                <i class="fa-solid fa-arrow-right-from-bracket"></i> Logout
            </a>
        </div>
    </div>

    <div class="main-content">
        
        <div class="top-app-bar">
            <button class="menu-btn" onclick="toggleSidebar()">
                <span class="material-symbols-rounded" style="font-size:28px;">menu</span>
            </button>
            <span class="material-symbols-rounded" style="color:var(--patina-dark);">notifications</span>
        </div>
        
        <div class="admin-header">
            <div class="header-text">
                <h2><%= request.getAttribute("subject") != null ? request.getAttribute("subject") : "Subject" %></h2>                
                <p>Manage resources and notices for all classes</p>
            </div>
            <div class="admin-profile">
                <div style="line-height:1.2;">
                    <div style="font-weight:600; color:var(--text-main); font-size:0.9rem;">
                        ID: <%= request.getAttribute("subject_id") %>
                    </div>
                    <small style="color: var(--text-muted);">Instructor</small>
                </div>
                <img src="https://ui-avatars.com/api/?name=Teacher+User&background=2D7A7B&color=fff&rounded=true" alt="Profile" class="admin-img">
            </div>
        </div>

        <div class="grid-3">
            <div class="card">
                <div class="card-head">
                    <div style="display:flex; align-items:center;">
                        <span class="badge-icon"><i class="fa-solid fa-video"></i></span> 
                        <b style="color:var(--text-main);">Resources</b>
                    </div>
                    <i class="fa-solid fa-ellipsis-vertical" style="color:var(--text-muted);"></i>
                </div>
                <div>
                    <h1 style="color:var(--copper-dark); font-size:2.5rem; font-weight:700; margin:5px 0;">
                        <%= request.getAttribute("totalVideos") != null ? request.getAttribute("totalVideos") : "0" %>
                    </h1>
                    <small style="color:var(--text-muted);">Active Videos</small>
                </div>
            </div>

            <div class="card">
                <div class="card-head">
                    <div style="display:flex; align-items:center;">
                        <span class="badge-icon"><i class="fa-solid fa-bullhorn"></i></span> 
                        <b style="color:var(--text-main);">Notices</b>
                    </div>
                    <i class="fa-solid fa-ellipsis-vertical" style="color:var(--text-muted);"></i>
                </div>
                <div>
                    <h1 style="color:var(--copper-dark); font-size:2.5rem; font-weight:700; margin:5px 0;">
                        <%= request.getAttribute("totalNotices") != null ? request.getAttribute("totalNotices") : "0" %>
                    </h1>
                    <small style="color:var(--text-muted);">Posted Notices</small>
                </div>
            </div>

            <div class="card">
                <div class="card-head">
                    <div style="display:flex; align-items:center;">
                        <span class="badge-icon"><i class="fa-solid fa-chart-line"></i></span> 
                        <b style="color:var(--text-main);">Engagement</b>
                    </div>
                    <i class="fa-solid fa-ellipsis-vertical" style="color:var(--text-muted);"></i>
                </div>
                 <svg width="100%" height="40" style="margin-top:15px;">
                    <path d="M0,30 Q30,25 50,15 T100,5" fill="none" stroke="#2D7A7B" stroke-width="3" />
                 </svg>
                 <small style="text-align: center; display: block; margin-top: 5px; color:var(--text-muted);">Weekly Activity</small>
            </div>
        </div>

        <div class="split-grid">
            
            <div class="card">
                <div class="section-header">
                    <h3><i class="fa-solid fa-bullhorn" style="color:var(--copper-mid); margin-right:10px;"></i> Create Notice</h3>
                </div>
                
                <form action="AddNoticesTrainerDashboardServlet" method="post">
                    <input type="hidden" name="subject_id" value="<%= request.getAttribute("subject_id") %>">

                    <div class="md-input-group">
                        <label class="md-label">Notice Title</label>
                        <input type="text" name="title" class="md-input" placeholder="e.g. Upcoming Exam Schedule" required>
                    </div>
                    
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                        <div class="md-input-group">
                            <label class="md-label">Class</label>
                            <select name="class_id" class="md-select">
                                <option value="all">All Classes</option>
                                <% for(int i=1; i<=10; i++) { %>
                                    <option value="<%= i %>">Class <%= i %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="md-input-group">
                            <label class="md-label">Priority</label>
                            <select name="priority" class="md-select">
                                <option value="normal">Standard</option>
                                <option value="high">High Priority</option>
                            </select>
                        </div>
                    </div>

                    <div class="md-input-group">
                        <label class="md-label">Message Content</label>
                        <textarea name="description" class="md-textarea" placeholder="Write your notice details here..." required></textarea>
                    </div>

                    <div style="margin-top: 10px;">
                        <button type="submit" class="btn-filled">
                            <i class="fa-solid fa-paper-plane"></i> Publish
                        </button>
                    </div>
                </form>
            </div>

            <div class="card">
                <div class="section-header">
                    <h3><i class="fa-solid fa-video" style="color:var(--patina-mid); margin-right:10px;"></i> Add Video Link</h3>
                </div>
                
                <form action="AddVideosTrainerDashboardServlet" method="post">
                    <input type="hidden" name="subject_id" value="<%= request.getAttribute("subject_id") %>">

                    <div class="md-input-group">
                        <label class="md-label">Video Title</label>
                        <input type="text" name="video_title" class="md-input" placeholder="e.g. Intro to Algebra" required>
                    </div>

                    <div class="md-input-group">
                        <label class="md-label">Video URL</label>
                        <input type="url" name="video_url" class="md-input" placeholder="https://youtube.com/..." required>
                    </div>

                    <div class="md-input-group">
                        <label class="md-label">Subject / Topic</label>
                        <input type="text" name="video_subject" class="md-input" placeholder="e.g. Mathematics" required>
                    </div>

                    <div class="md-input-group">
                        <label class="md-label">Assign to Class</label>
                        <select name="class_id" class="md-select">
                            <option value="all">All Classes</option>
                            <% for(int i=1; i<=10; i++) { %>
                                <option value="<%= i %>">Class <%= i %></option>
                            <% } %>
                        </select>
                    </div>

                    <button type="submit" class="btn-filled" style="background:linear-gradient(135deg, var(--copper-mid), var(--copper-dark));">
                        <i class="fa-solid fa-plus"></i> Add Video
                    </button>
                </form>
            </div>
        </div>

    </div>

    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const scrim = document.querySelector('.scrim');
            
            if (sidebar.classList.contains('active')) {
                sidebar.classList.remove('active');
                scrim.classList.remove('active');
            } else {
                sidebar.classList.add('active');
                scrim.classList.add('active');
            }
        }
    </script>

</body>
</html>
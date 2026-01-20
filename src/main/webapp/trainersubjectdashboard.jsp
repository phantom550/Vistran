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
    
    <style>
        :root {
            /* --- Material Design 3 Color Tokens --- */
            --md-sys-color-primary: #00639B;
            --md-sys-color-on-primary: #FFFFFF;
            --md-sys-color-primary-container: #CEE5FF;
            --md-sys-color-on-primary-container: #001D33;
            
            --md-sys-color-secondary-container: #DDE3EA;
            --md-sys-color-on-secondary-container: #1A1C1E;

            --md-sys-color-surface: #F8F9FF;
            --md-sys-color-surface-container: #FFFFFF;
            --md-sys-color-surface-container-high: #F2F5FA;
            
            --md-sys-color-outline: #74777F;
            --md-sys-color-on-surface: #1A1C1E;
            --md-sys-color-on-surface-variant: #43474E;

            /* --- Shapes --- */
            --md-sys-shape-corner-medium: 12px;
            --md-sys-shape-corner-large: 24px;
            --md-sys-shape-corner-full: 100px; 

            /* --- Elevation --- */
            --md-sys-elevation-1: 0px 1px 3px 1px rgba(0, 0, 0, 0.15), 0px 1px 2px 0px rgba(0, 0, 0, 0.3);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Roboto', sans-serif; }
        
        body { 
            background-color: var(--md-sys-color-surface); 
            color: var(--md-sys-color-on-surface);
            display: flex; 
            height: 100vh; 
            overflow: hidden; 
        }

        /* --- Sidebar --- */
        .sidebar {
            width: 280px;
            background: var(--md-sys-color-surface-container-high);
            display: flex;
            flex-direction: column;
            padding: 20px 16px;
            overflow-y: auto;
            border-right: 1px solid #E0E2E0;
            z-index: 2; 
        }

        .brand { 
            margin-bottom: 30px; 
            padding-left: 16px; 
            display: flex; align-items: center; gap: 12px; 
            font-weight: 700; font-size: 1.3rem; 
            color: var(--md-sys-color-primary);
        }
        
        .sidebar-title {
            padding: 0 16px 8px 16px;
            font-size: 0.85rem;
            font-weight: 500;
            color: var(--md-sys-color-primary);
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-top: 10px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            height: 50px;
            padding: 0 24px;
            margin-bottom: 4px;
            border-radius: var(--md-sys-shape-corner-full);
            cursor: pointer;
            transition: 0.2s;
            color: var(--md-sys-color-on-surface-variant);
            text-decoration: none;
            font-size: 0.95rem;
            font-weight: 500;
        }
        
        .menu-item:hover { background-color: rgba(0,0,0,0.05); }
        .menu-item.active { 
            background-color: var(--md-sys-color-primary-container); 
            color: var(--md-sys-color-on-primary-container);
        }
        .menu-item i { width: 24px; margin-right: 12px; font-size: 1.1rem; }
        
        /* --- Main Content --- */
        .main-content { 
            flex: 1; 
            padding: 24px; 
            overflow-y: auto; 
            border-radius: var(--md-sys-shape-corner-large) 0 0 var(--md-sys-shape-corner-large);
            background: var(--md-sys-color-surface);
            position: relative; 
        }

        /* --- Header --- */
        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        .header-text h2 { color: var(--md-sys-color-on-surface); font-weight: 400; font-size: 2rem; margin-bottom: 4px; }
        .header-text p { color: var(--md-sys-color-on-surface-variant); }
        
        .admin-profile { display: flex; align-items: center; gap: 16px; text-align: right; }
        .admin-img { width: 48px; height: 48px; border-radius: 50%; object-fit: cover; }

        /* --- Cards --- */
        .card {
            background: var(--md-sys-color-surface-container);
            padding: 24px;
            border-radius: var(--md-sys-shape-corner-large);
            box-shadow: var(--md-sys-elevation-1);
            background-color: #FDFBFF;
        }

        .grid-3 {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
            margin-bottom: 24px;
        }

        .card-head { display: flex; justify-content: space-between; margin-bottom: 16px; align-items: center; }
        .badge-icon { 
            width: 40px; height: 40px; 
            border-radius: 50%; 
            display: flex; align-items: center; justify-content: center;
            background: var(--md-sys-color-secondary-container);
            color: var(--md-sys-color-on-secondary-container);
            margin-right: 10px;
        }

        /* --- Forms --- */
        .split-grid { display: grid; grid-template-columns: 1.5fr 1fr; gap: 24px; }
        
        .section-header {
            display: flex; align-items: center; gap: 12px; margin-bottom: 24px;
            color: var(--md-sys-color-primary);
        }
        
        .md-input-group { margin-bottom: 20px; position: relative; }
        .md-input, .md-select, .md-textarea {
            width: 100%;
            padding: 14px 16px;
            background: transparent;
            border: 1px solid var(--md-sys-color-outline);
            border-radius: 4px;
            font-size: 1rem;
            color: var(--md-sys-color-on-surface);
        }
        .md-input:focus, .md-select:focus, .md-textarea:focus {
            outline: none; border-color: var(--md-sys-color-primary); border-width: 2px; padding: 13px 15px;
        }
        .md-label {
            position: absolute; left: 12px; top: -10px;
            background: var(--md-sys-color-surface-container);
            padding: 0 4px; font-size: 0.75rem;
            color: var(--md-sys-color-primary); font-weight: 500;
        }
        .md-textarea { resize: none; height: 120px; }

        .btn-filled {
            background: var(--md-sys-color-primary);
            color: var(--md-sys-color-on-primary);
            border: none; padding: 10px 24px;
            border-radius: var(--md-sys-shape-corner-full);
            font-weight: 500; cursor: pointer;
            display: flex; align-items: center; justify-content: center; gap: 8px;
            width: 100%; height: 40px;
        }
    </style>
</head>
<body>

 <div class="sidebar">
    <div class="brand">
        <i class="fa-solid fa-shapes"></i> <span>Vistran</span>
    </div>
    
    <div class="sidebar-title">Main Menu</div>
    <a href="#" class="menu-item active">
        <i class="fa-solid fa-house"></i> Overview
    </a>
    
    <div class="sidebar-title" style="margin-top: 20px;">Manage Classes</div>

    <a href="TrainerClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=1"
       class="menu-item">
        <i class="fa-solid fa-graduation-cap"></i> Class 1
    </a>

    <a href="TrainerClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=2"
       class="menu-item">
        <i class="fa-solid fa-graduation-cap"></i> Class 2
    </a>

    <a href="TrainerClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=3"
       class="menu-item">
        <i class="fa-solid fa-graduation-cap"></i> Class 3
    </a>

    <a href="TrainerClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=4"
       class="menu-item">
        <i class="fa-solid fa-graduation-cap"></i> Class 4
    </a>

    <a href="TrainerClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=5"
       class="menu-item">
        <i class="fa-solid fa-graduation-cap"></i> Class 5
    </a>

    <a href="TrainerClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=6"
       class="menu-item">
        <i class="fa-solid fa-graduation-cap"></i> Class 6
    </a>

    <a href="TrainerClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=7"
       class="menu-item">
        <i class="fa-solid fa-graduation-cap"></i> Class 7
    </a>

    <a href="TrainerClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=8"
       class="menu-item">
        <i class="fa-solid fa-graduation-cap"></i> Class 8
    </a>

    <a href="TrainerClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=9"
       class="menu-item">
        <i class="fa-solid fa-graduation-cap"></i> Class 9
    </a>

    <a href="TrainerClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=10"
       class="menu-item">
        <i class="fa-solid fa-graduation-cap"></i> Class 10
    </a>

    <div style="margin-top:auto;">
        <a href="#" class="menu-item">
            <i class="fa-solid fa-arrow-right-from-bracket"></i> Logout
        </a>
    </div>
</div>


    <div class="main-content">
        
        <div class="admin-header">
            <div class="header-text">
         <h2><%= request.getAttribute("subject") != null ? request.getAttribute("subject") : "Subject" %></h2>                
<p>Manage resources and notices for all classes</p>
            </div>
            <div class="admin-profile">
                <div>
                    <div style="font-weight:500; color:var(--md-sys-color-on-surface);">
                        User ID: <%= request.getAttribute("subject_id") %>
                    </div>
                    <small style="color: var(--md-sys-color-on-surface-variant);">Instructor</small>
                </div>
                <img src="https://ui-avatars.com/api/?name=Teacher+User&background=random" alt="Profile" class="admin-img">
            </div>
        </div>

        <div class="grid-3">
            <div class="card">
                <div class="card-head">
                    <div style="display:flex; align-items:center;">
                        <span class="badge-icon"><i class="fa-solid fa-video"></i></span> 
                        <b>Resources</b>
                    </div>
                    <i class="fa-solid fa-ellipsis-vertical" style="color:var(--md-sys-color-outline);"></i>
                </div>
                <div>
                    <h1 style="color:var(--md-sys-color-on-surface); font-size:2.5rem; font-weight:400;">
<%= request.getAttribute("totalVideos") != null ? request.getAttribute("totalVideos") : "0" %>                    </h1>
                    <small style="color:var(--md-sys-color-on-surface-variant);">Active Videos</small>
                </div>
            </div>

            <div class="card">
                <div class="card-head">
                    <div style="display:flex; align-items:center;">
                        <span class="badge-icon"><i class="fa-solid fa-bullhorn"></i></span> 
                        <b>Notices</b>
                    </div>
                    <i class="fa-solid fa-ellipsis-vertical" style="color:var(--md-sys-color-outline);"></i>
                </div>
                <div>
                    <h1 style="color:var(--md-sys-color-on-surface); font-size:2.5rem; font-weight:400;">
<%= request.getAttribute("totalNotices") != null ? request.getAttribute("totalNotices") : "0" %>                    </h1>
                    <small style="color:var(--md-sys-color-on-surface-variant);">Posted Notices</small>
                </div>
            </div>

            <div class="card">
                <div class="card-head">
                    <div style="display:flex; align-items:center;">
                        <span class="badge-icon"><i class="fa-solid fa-chart-line"></i></span> 
                        <b>Engagement</b>
                    </div>
                    <i class="fa-solid fa-ellipsis-vertical" style="color:var(--md-sys-color-outline);"></i>
                </div>
                 <svg width="100%" height="40" style="margin-top:15px;">
                    <path d="M0,30 Q30,25 50,15 T100,5" fill="none" stroke="#00639B" stroke-width="3" />
                 </svg>
                 <small style="text-align: center; display: block; margin-top: 5px;">Weekly Activity</small>
            </div>
        </div>

        <div class="split-grid">
            
            <div class="card">
                <div class="section-header">
                    <span class="badge-icon" style="background:var(--md-sys-color-primary-container); color:var(--md-sys-color-on-primary-container);"><i class="fa-solid fa-bullhorn"></i></span>
                    <h3>Create Notice</h3>
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

                    <div style="display:flex; justify-content:flex-end;">
                        <button type="submit" class="btn-filled" style="width:auto; padding: 0 32px;">
                            <i class="fa-solid fa-paper-plane"></i> Publish Notice
                        </button>
                    </div>
                </form>
            </div>

            <div class="card">
                <div class="section-header">
                    <span class="badge-icon" style="background:var(--md-sys-color-primary-container); color:var(--md-sys-color-on-primary-container);"><i class="fa-solid fa-video"></i></span>
                    <h3>Add Video Link</h3>
                </div>
                
                <form action="AddVideosTrainerDashboardServlet" method="get">
                    <input type="hidden" name="subject_id" value="<%= request.getAttribute("subject_id") %>">

                    <div class="md-input-group">
                        <label class="md-label">Video Title</label>
                        <input type="text" name="video_title" class="md-input" placeholder="e.g. Introduction to Algebra" required>
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
                            <% for(int i=1; i<=10; i++) { %>
                                <option value="<%= i %>">Class All</option>
                            <% } %>
                        </select>
                    </div>

                    <button type="submit" class="btn-filled">
                        <i class="fa-solid fa-plus"></i> Add Video to Library
                    </button>
                </form>
            </div>
        </div>

    </div>

</body>
</html>
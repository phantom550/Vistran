<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Training Portal - Unified Dashboard</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
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
            --md-sys-elevation-3: 0px 4px 8px 3px rgba(0, 0, 0, 0.15);
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
        .menu-item i, .menu-item span { width: 24px; margin-right: 12px; font-size: 1.1rem; }
        
        /* --- Main Content --- */
        .main-content { 
            flex: 1; 
            padding: 0; 
            overflow-y: auto; 
            border-radius: var(--md-sys-shape-corner-large) 0 0 var(--md-sys-shape-corner-large);
            background: var(--md-sys-color-surface);
            position: relative; 
            display: flex;
            flex-direction: column;
        }

        .content-padding {
            padding: 24px;
        }

        /* --- Top Bar Chips --- */
        .top-app-bar {
            background: var(--md-sys-color-surface);
            padding: 12px 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            top: 0;
            z-index: 10;
            border-bottom: 1px solid #E0E2E0;
        }
        
        .chips-container {
            display: flex;
            gap: 8px;
            overflow-x: auto;
            padding-bottom: 4px;
            scrollbar-width: none;
        }
        .chips-container::-webkit-scrollbar { display: none; }

        .chip {
            border: 1px solid var(--md-sys-color-outline);
            background: transparent;
            color: var(--md-sys-color-on-surface-variant);
            padding: 6px 16px;
            border-radius: 8px;
            font-size: 0.9rem;
            font-weight: 500;
            cursor: pointer;
            white-space: nowrap;
            transition: 0.2s;
            text-decoration: none;
            display: inline-block;
        }
        
        .chip:hover { background: rgba(0,0,0,0.05); }
        .chip.active {
            background: var(--md-sys-color-primary-container);
            color: var(--md-sys-color-on-primary-container);
            border-color: transparent;
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
        
        .admin-profile { 
            display: flex; align-items: center; gap: 16px; text-align: right; 
            cursor: pointer; padding: 8px; border-radius: 12px; transition: 0.2s;
        }
        .admin-profile:hover { background-color: var(--md-sys-color-secondary-container); }
        .admin-img { width: 48px; height: 48px; border-radius: 50%; object-fit: cover; }

        /* --- Cards --- */
        .card {
            background: var(--md-sys-color-surface-container);
            padding: 24px;
            border-radius: var(--md-sys-shape-corner-large);
            box-shadow: var(--md-sys-elevation-1);
            background-color: #FDFBFF;
            position: relative;
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

        /* --- Charts & List Rows --- */
        .chart-box {
            position: relative;
            height: 150px;
            width: 100%;
        }
        
        .list-row {
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            padding: 12px 0;
            border-bottom: 1px solid #E0E2E0;
        }
        .list-row:last-child { border-bottom: none; }

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
        .btn-tonal {
            background: var(--md-sys-color-secondary-container);
            color: var(--md-sys-color-on-secondary-container);
            border: none; padding: 10px 24px;
            border-radius: 20px;
            font-weight: 500; cursor: pointer;
            display: flex; align-items: center; justify-content: center;
        }

        /* --- Modals (Only for Profile) --- */
        .modal-overlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0,0,0,0.5);
            display: none; align-items: center; justify-content: center;
            z-index: 100;
            backdrop-filter: blur(2px);
        }
        .modal-box {
            background: #fff;
            padding: 24px;
            border-radius: 28px;
            width: 400px;
            max-width: 90%;
            box-shadow: var(--md-sys-elevation-3);
            animation: fadeIn 0.2s ease-out;
        }
        @keyframes fadeIn { from { opacity: 0; transform: scale(0.95); } to { opacity: 1; transform: scale(1); } }
        
        .modal-header { font-size: 1.5rem; margin-bottom: 16px; color: var(--md-sys-color-on-surface); }
        .modal-actions { display: flex; justify-content: flex-end; gap: 12px; margin-top: 24px; }
        
        .profile-detail-header { text-align: center; margin-bottom: 20px; }
        .profile-detail-header img { width: 80px; height: 80px; border-radius: 50%; margin-bottom: 10px; }
        .info-row { display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #eee; }
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="brand"><i class="fa-solid fa-shapes"></i> <span>EduDash</span></div>
        
        <div class="sidebar-title">Main Menu</div>
        <a href="#" class="menu-item active"><i class="fa-solid fa-house"></i> Overview</a>
        
        <a href="GetIssueServlet?subject=<%= request.getAttribute("subject") %>&teacher_id=<%= request.getAttribute("teacher_id") %>&classId=<%= request.getAttribute("classId") %>&subject_id=<%= request.getAttribute("subject_id") %>" 
           class="menu-item">
            <span class="material-symbols-outlined">report_problem</span> Get teachers Issues
        </a>

        <a href="TrainerGetDataServlet" 
           class="menu-item">
            <span class="material-symbols-outlined">edit_document</span>Get Teachers Data
        </a>

        <div style="margin-top:auto;">
            <a href="index.html" class="menu-item"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
        </div>
    </div>

    <div class="main-content">
        
        <div class="top-app-bar">
            <div class="chips-container">
<%
    // Current class (default = 1)
    String currentClassStr = (String) request.getAttribute("classId");
    int currentClass = 1;
    if (currentClassStr != null) {
        currentClass = Integer.parseInt(currentClassStr);
    }

    String subject = (String) request.getAttribute("subject");
    String subjectId = (String) request.getAttribute("subject_id");
%>

<a href="ClassesServlet?subject=<%=subject%>&subject_id=<%=subjectId%>&classId=1"
   class="chip <%= (currentClass == 1) ? "active" : "" %>">English</a>

<a href="ClassesServlet?subject=<%=subject%>&subject_id=<%=subjectId%>&classId=2"
   class="chip <%= (currentClass == 2) ? "active" : "" %>"> Hindi</a>

<a href="ClassesServlet?subject=<%=subject%>&subject_id=<%=subjectId%>&classId=3"
   class="chip <%= (currentClass == 3) ? "active" : "" %>">Marathi</a>

<a href="ClassesServlet?subject=<%=subject%>&subject_id=<%=subjectId%>&classId=4"
   class="chip <%= (currentClass == 4) ? "active" : "" %>"> Tamil</a>

<a href="ClassesServlet?subject=<%=subject%>&subject_id=<%=subjectId%>&classId=5"
   class="chip <%= (currentClass == 5) ? "active" : "" %>">Telugu </a>

<a href="ClassesServlet?subject=<%=subject%>&subject_id=<%=subjectId%>&classId=6"
   class="chip <%= (currentClass == 6) ? "active" : "" %>">Urdu </a>

<a href="ClassesServlet?subject=<%=subject%>&subject_id=<%=subjectId%>&classId=7"
   class="chip <%= (currentClass == 7) ? "active" : "" %>">Gujarati </a>

<a href="ClassesServlet?subject=<%=subject%>&subject_id=<%=subjectId%>&classId=8"
   class="chip <%= (currentClass == 8) ? "active" : "" %>"> Kannada</a>

<a href="ClassesServlet?subject=<%=subject%>&subject_id=<%=subjectId%>&classId=9"
   class="chip <%= (currentClass == 9) ? "active" : "" %>"> Malayalam</a>

<a href="ClassesServlet?subject=<%=subject%>&subject_id=<%=subjectId%>&classId=10"
   class="chip <%= (currentClass == 10) ? "active" : "" %>"> Bengali</a>

</div>

            <span class="material-symbols-outlined" style="cursor: pointer; color: var(--md-sys-color-on-surface-variant);">notifications</span>
        </div>

        <div class="content-padding">
            
            <div class="admin-header">
                <div class="header-text">
                    <h2><%= request.getAttribute("subject") != null ? request.getAttribute("subject") : "Subject" %> Dashboard</h2>
                    <p>Manage resources and notices for Class <%= currentClass %></p>
                </div>
                
                <div class="admin-profile" onclick="openModal('profileModal')">
                    <div>
                        <div style="font-weight:500; color:var(--md-sys-color-on-surface);">
                            Mr. <%= request.getAttribute("name") %>
                        </div>
                        <small style="color: var(--md-sys-color-on-surface-variant);">
                            <%= request.getAttribute("subject") %>
                        </small>
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
<%= request.getAttribute("videos") != null ? request.getAttribute("videos") : "0" %>                    
                        </h1>
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
<%= request.getAttribute("notice") != null ? request.getAttribute("notice") : "0" %>                    
                        </h1>
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

            <div class="grid-3">
                <div class="card">
                    <div class="card-head">
                        <div style="display:flex; align-items:center;">
                            <span class="material-symbols-outlined" style="margin-right:8px; color:var(--md-sys-color-primary);">groups</span>
                            <b>Attendance</b>
                        </div>
                    </div>
                    <div style="margin-top: 0px; margin-bottom: 10px;">
                        <span style="font-size: 1.5rem; font-weight: bold;" id="attendanceAvg">0%</span>
                        <span style="font-size: 0.9rem; color: #666;">Avg</span>
                    </div>
                    <div class="chart-box">
                        <canvas id="attendanceChart"></canvas>
                    </div>
                </div>

                <div class="card">
                    <div class="card-head">
                        <div style="display:flex; align-items:center;">
                            <span class="material-symbols-outlined" style="margin-right:8px; color:var(--md-sys-color-primary);">monitoring</span>
                            <b>Performance</b>
                        </div>
                    </div>
                    <div class="chart-box" style="margin-top: 15px;">
                        <canvas id="performanceChart"></canvas>
                    </div>
                </div>

                <div class="card">
                    <div class="card-head">
                        <div style="display:flex; align-items:center;">
                            <span class="material-symbols-outlined" style="margin-right:8px; color:var(--md-sys-color-primary);">psychology</span>
                            <b>Behavior (<%= request.getAttribute("total") %> students)</b>
                        </div>
                    </div>
                    
                    <div class="list-row">
                        <span><span class="material-symbols-outlined" style="vertical-align: -5px; color:#4caf50;">sentiment_satisfied</span> Good</span>
                        <span style="font-weight:bold;"><%= request.getAttribute("good") %></span>
                    </div>
                    <div class="list-row">
                        <span><span class="material-symbols-outlined" style="vertical-align: -5px; color:#ff9800;">sentiment_neutral</span> Average</span>
                        <span style="font-weight:bold;"><%= request.getAttribute("avg") %></span>
                    </div>
                    <div class="list-row">
                        <span><span class="material-symbols-outlined" style="vertical-align: -5px; color:#f44336;">sentiment_dissatisfied</span> Needs Work</span>
                        <span style="font-weight:bold;"><%= request.getAttribute("low") %></span>
                    </div>
                </div>
            </div>

            <div class="split-grid">
                
                <div class="card">
                    <div class="section-header">
                        <span class="badge-icon" style="background:var(--md-sys-color-primary-container); color:var(--md-sys-color-on-primary-container);"><i class="fa-solid fa-bullhorn"></i></span>
                        <h3>Create Notice</h3>
                    </div>
                    
                    <form action="AddNoticeTrainerClassesServlet" method="get">
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
                                        <option value="<%= i %>" <%= (i==currentClass) ? "selected" : "" %>>Class <%= i %></option>
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
                                    <option value="<%= i %>" <%= (i==currentClass) ? "selected" : "" %>>Class <%= i %></option>
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
    </div>

    <div class="modal-overlay" id="profileModal">
        <div class="modal-box">
            <h3 class="modal-header">Profile Details</h3>
            <div class="profile-detail-header">
                <img src="https://ui-avatars.com/api/?name=<%= request.getAttribute("name") %>&background=00639B&color=fff&rounded=true&size=128" alt="Profile">
                <div style="font-size: 1.25rem; font-weight: 500;">Mr. <%= request.getAttribute("name") %></div>
                <span style="color: #666;"><%= request.getAttribute("subject") %></span>
            </div>
            
            <div class="profile-detail-info">
                <div class="info-row">
                    <span style="font-weight: 500;">Trainer ID</span>
                    <span><%= request.getAttribute("trainer_id") %></span>
                </div>
                <div class="info-row">
                    <span style="font-weight: 500;">Email</span>
                    <span><%= request.getAttribute("email") %></span>
                </div>
                <div class="info-row">
                    <span style="font-weight: 500;">Status</span>
                    <span><%= request.getAttribute("status") %></span>
                </div>
                <div class="info-row">
                    <span style="font-weight: 500;">Primary Subject</span>
                    <span><%= request.getAttribute("subject") %></span>
                </div>
            </div>
            
            <div class="modal-actions" style="margin-top: 24px;">
                <button type="button" class="btn-tonal" onclick="location.href='edittrainer.jsp?trainer_id=<%= request.getAttribute("trainer_id") %>&classId=<%= request.getAttribute("classId") %>&subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>'">
                    <i class="fa-solid fa-pen" style="font-size: 14px; margin-right: 8px;"></i> Edit
                </button>
                <button type="button" class="btn-filled" onclick="closeModal('profileModal')" style="width: auto;">Close</button>
            </div>
        </div>
    </div>

    <script>
        // Attendance Data
        var attendanceData = [
            <%
                List<Integer> attend = (List<Integer>) request.getAttribute("attend");
                if (attend != null) {
                    for (int i = 0; i < attend.size(); i++) {
                        out.print(attend.get(i));
                        if (i < attend.size() - 1) out.print(",");
                    }
                }
            %>
        ];

        // Performance Data
        var performanceData = [
            <%
                List<Integer> perform = (List<Integer>) request.getAttribute("performance");
                if (perform != null) {
                    for (int i = 0; i < perform.size(); i++) {
                        out.print(perform.get(i));
                        if (i < perform.size() - 1) out.print(",");
                    }
                }
            %>
        ];

        // Student Names
        var studentNames = [
            <%
                List<String> studentName = (List<String>) request.getAttribute("sname");
                if (studentName != null) {
                    for (int i = 0; i < studentName.size(); i++) {
                        out.print("\"" + studentName.get(i) + "\"");
                        if (i < studentName.size() - 1) out.print(",");
                    }
                }
            %>
        ];
    </script>

    <script>
        // Modal Logic
        function openModal(id) {
            document.getElementById(id).style.display = 'flex';
        }
        function closeModal(id) {
            document.getElementById(id).style.display = 'none';
        }
        
        // Close modal when clicking outside
        window.onclick = function(event) {
            if (event.target.classList.contains('modal-overlay')) {
                event.target.style.display = 'none';
            }
        }

        // Initialize Charts
       document.addEventListener('DOMContentLoaded', function () {

    /* ========= SIDEBAR ========= */
    var menuBtn = document.getElementById('menuBtn');
    var sidebar = document.querySelector('.sidebar');
    var scrim = document.querySelector('.scrim');

    function toggleMenu() {
        sidebar.classList.toggle('active');
        scrim.classList.toggle('active');
    }

    if (menuBtn) menuBtn.addEventListener('click', toggleMenu);
    if (scrim) scrim.addEventListener('click', toggleMenu);

    /* ========= ATTENDANCE CHART ========= */
    if (typeof attendanceData !== "undefined" &&
        Array.isArray(attendanceData) &&
        attendanceData.length > 0) {

        var attendanceCanvas = document.getElementById('attendanceChart');

        new Chart(attendanceCanvas, {
            type: 'line',
            data: {
                labels: attendanceData.map((_, i) => 'Student ' + (i + 1)),
                datasets: [{
                    data: attendanceData,
                    borderColor: '#0061a4',
                    backgroundColor: 'rgba(0,97,164,0.15)',
                    fill: true,
                    tension: 0.4,
                    pointRadius: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    x: { grid: { display: false } },
                    y: { display: false }
                }
            }
        });
        
  }
    var avg =
        Math.round(attendanceData.reduce((a, b) => a + b, 0) / attendanceData.length);
    document.getElementById('attendanceAvg').innerText = avg + "%";
    
            // Performance Chart
            const ctxPerf = document.getElementById('performanceChart');
            if(ctxPerf) {
                new Chart(ctxPerf, {
                    type: 'bar',
                    data: {
                        labels: studentNames.length ? studentNames : ['S1', 'S2', 'S3', 'S4', 'S5'],
                        datasets: [{
                            label: 'Score',
                            data: performanceData.length ? performanceData : [70, 85, 60, 90, 75],
                            backgroundColor: '#00639B',
                            borderRadius: 4
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: { legend: { display: false } },
                        scales: { y: { beginAtZero: true, max: 100 } }
                    }
                });
            }
        });
    </script>
</body>
</html>
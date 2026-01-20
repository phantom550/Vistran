<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Simulated Data for the Dashboard
int issuesA = (Integer) request.getAttribute("countA");
int issuesB = (Integer) request.getAttribute("countB");

int issuesC = (Integer) request.getAttribute("countC");

    		
 
    
    int totalIssues = issuesA + issuesB + issuesC;
    
    double pctA = (double)issuesA / totalIssues * 100;
    double pctB = (double)issuesB / totalIssues * 100;
    double pctC = (double)issuesC / totalIssues * 100;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vistran - District Admin</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
    <style>
        :root {
            /* MD3 Colors */
            --md-sys-color-surface: #f8fdff;
            --md-sys-color-surface-container: #eef1f4;
            --md-sys-color-primary: #006492;
            --md-sys-color-on-primary: #ffffff;
            --md-sys-color-secondary-container: #dbe4ee;
            
            /* Cluster Colors */
            --cluster-a-color: #4285F4; /* Blue */
            --cluster-b-color: #34A853; /* Green */
            --cluster-c-color: #EA4335; /* Red/Orange */
        }

        body { 
            margin: 0; padding: 0; box-sizing: border-box; font-family: 'Roboto', sans-serif; 
            background-color: var(--md-sys-color-surface); 
            display: flex; height: 100vh; overflow: hidden;
        }

        /* --- SIDEBAR --- */
        .sidebar { 
            width: 280px; 
            background: var(--md-sys-color-surface-container); 
            padding: 24px 16px; 
            border-right: 1px solid #e0e2e5; 
            display: flex; 
            flex-direction: column; 
        }

        .brand { 
            font-size: 1.4rem; font-weight: 700; color: var(--md-sys-color-primary); 
            margin-bottom: 30px; display: flex; align-items: center; gap: 10px; padding-left: 8px;
        }

        .menu-item {
            display: flex; align-items: center; gap: 12px;
            padding: 12px 16px; margin-bottom: 4px;
            border-radius: 100px; /* Pill shape */
            color: #44474f; text-decoration: none; font-weight: 500; font-size: 0.95rem;
            transition: 0.2s;
        }
        
        .menu-item:hover { background: rgba(0,0,0,0.05); }
        .menu-item.active { background-color: #cce5ff; color: #001e30; }
        .menu-item .material-symbols-outlined { font-size: 24px; }

        /* Logout at bottom */
        .logout-section { margin-top: auto; border-top: 1px solid #d1d4d6; padding-top: 10px; }
        .logout-btn { color: #b3261e; }
        .logout-btn:hover { background-color: #f9dedc; }

        /* --- MAIN CONTENT --- */
        .main-content { flex: 1; padding: 24px 32px; overflow-y: auto; }

        /* Top Nav & Pills */
        .top-nav { display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; }
        .class-pills { display: flex; gap: 8px; }
        .pill { 
            padding: 6px 16px; border-radius: 8px; border: 1px solid #c4c7c5; 
            color: #44474f; font-size: 0.85rem; font-weight: 500; cursor: pointer; transition: 0.2s;
        }
        .pill.active { background: #cce5ff; border-color: transparent; color: #001e30; }

        /* Admin Header (Profile) */
        .admin-header {
            display: flex; justify-content: space-between; align-items: center;
            background: white; padding: 20px 24px; border-radius: 16px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1); margin-bottom: 24px;
        }
        .admin-profile { display: flex; align-items: center; gap: 16px; text-align: right; }
        .admin-img { width: 48px; height: 48px; border-radius: 50%; object-fit: cover; }
        .status-badge { 
            display: inline-flex; align-items: center; gap: 4px; 
            background: #e8f5e9; color: #1b5e20; padding: 4px 8px; 
            border-radius: 4px; font-size: 0.75rem; font-weight: 600; margin-top: 4px;
        }

        /* Dynamic Bar */
        .dynamic-bar-container {
            width: 100%; height: 24px; background: #e0e0e0; border-radius: 12px;
            display: flex; overflow: hidden; margin-bottom: 16px;
            box-shadow: inset 0 1px 3px rgba(0,0,0,0.2);
        }
        .bar-segment {
            height: 100%; display: flex; align-items: center; justify-content: center;
            color: rgba(255,255,255,0.95); font-size: 0.75rem; font-weight: bold;
        }

        /* Clickable Cluster Cards */
        .cluster-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 30px; }
        
        .cluster-link { text-decoration: none; color: inherit; display: block; transition: transform 0.2s; }
        .cluster-link:hover { transform: translateY(-4px); }

        .cluster-card {
            background: white; padding: 24px; border-radius: 16px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05); border-top: 5px solid #ccc;
            position: relative; overflow: hidden;
        }
        /* Ripple effect hover hint */
        .cluster-card::after {
            content: ""; position: absolute; top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0,0,0,0); transition: background 0.2s;
        }
        .cluster-link:hover .cluster-card::after { background: rgba(0,0,0,0.03); }

        .cluster-card h3 { margin: 0 0 8px 0; font-size: 1.1rem; }
        .issue-count { font-size: 2.5rem; font-weight: 700; color: #1f1f1f; }
        .issue-label { color: #666; font-size: 0.9rem; display: flex; justify-content: space-between; align-items: center;}

        /* AI Section */
        .ai-section { display: grid; grid-template-columns: 2fr 1fr; gap: 24px; }
        .card { background: white; padding: 24px; border-radius: 20px; box-shadow: 0 2px 10px rgba(0,0,0,0.08); }
        .input-area { width: 100%; height: 100px; padding: 12px; margin: 15px 0; border: 1px solid #ccc; border-radius: 8px; resize: vertical; font-family: inherit;}
        .cluster-select { padding: 10px; border-radius: 8px; border: 1px solid #ccc; margin-right: 10px; }
        .btn-primary { background-color: var(--md-sys-color-primary); color: white; border: none; padding: 10px 20px; border-radius: 100px; cursor: pointer; font-weight: 500; }
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="brand">
            <span class="material-symbols-outlined">school</span> Vistran
        </div>
        
        <a href="#" class="menu-item active"><span class="material-symbols-outlined">dashboard</span> Overview</a>
        <a href="#" class="menu-item"><span class="material-symbols-outlined">groups</span> Students</a>
        <a href="#" class="menu-item"><span class="material-symbols-outlined">video_library</span> Videos</a>
        <a href="#" class="menu-item"><span class="material-symbols-outlined">campaign</span> Notices</a>
        <a href="#" class="menu-item"><span class="material-symbols-outlined">analytics</span> Analytics</a>
        <a href="#" class="menu-item"><span class="material-symbols-outlined">settings</span> Settings</a>

        <div class="logout-section">
            <a href="index.html" class="menu-item logout-btn">
                <span class="material-symbols-outlined">logout</span> Logout
            </a>
        </div>
    </div>

    <div class="main-content">
        
        <div class="top-nav">
            <div class="class-pills">
                <div class="pill active">Class 1</div>
                <div class="pill">Class 2</div>
                <div class="pill">Class 3</div>
                <div class="pill">Class 4</div>
                <div class="pill">Class 5</div>
            </div>
            <span class="material-symbols-outlined" style="color:#666; cursor:pointer;">notifications</span>
        </div>

        <div class="admin-header">
            <div class="header-text">
                <h2 style="margin:0; font-weight:400; color:#1f1f1f;">District Dashboard</h2>
                <p style="margin:5px 0 0; color:#5e5e5e; font-size:0.95rem;">ABC District Institute of Education & Training</p>
            </div>
            <div class="admin-profile">
                <div>
                    <div style="font-weight: 700; color:#1f1f1f;">Dr. Kumar</div>
                    <div class="status-badge"><span class="material-symbols-outlined" style="font-size:12px;">verified</span> District Admin</div>
                </div>
                <img src="https://api.dicebear.com/7.x/avataaars/svg?seed=John" alt="Admin" class="admin-img">
            </div>
        </div>

        <h3 style="margin-bottom: 12px; color: #44474f;">Cluster Health</h3>

        <div class="dynamic-bar-container">
            <div class="bar-segment" style="width: <%= pctA %>%; background-color: var(--cluster-a-color);" title="Cluster A Issues">A</div>
            <div class="bar-segment" style="width: <%= pctB %>%; background-color: var(--cluster-b-color);" title="Cluster B Issues">B</div>
            <div class="bar-segment" style="width: <%= pctC %>%; background-color: var(--cluster-c-color);" title="Cluster C Issues">C</div>
        </div>

        <div class="cluster-grid">
            
            <a href="ClusterAServlet" class="cluster-link">
                <div class="cluster-card" style="border-color: var(--cluster-a-color);">
                    <h3 style="color: var(--cluster-a-color);">Cluster A (Urban)</h3>
                    <div class="issue-count"><%= issuesA %></div>
                    <div class="issue-label">
                        Pending Issues 
                        <span class="material-symbols-outlined" style="font-size: 20px;">arrow_forward</span>
                    </div>
                </div>
            </a>

            <a href="ClusterBServlet?id=B" class="cluster-link">
                <div class="cluster-card" style="border-color: var(--cluster-b-color);">
                    <h3 style="color: var(--cluster-b-color);">Cluster B (Semi-Rural)</h3>
                    <div class="issue-count"><%= issuesB %></div>
                    <div class="issue-label">
                        Pending Issues
                        <span class="material-symbols-outlined" style="font-size: 20px;">arrow_forward</span>
                    </div>
                </div>
            </a>

            <a href="ClusterCServlet?id=C" class="cluster-link">
                <div class="cluster-card" style="border-color: var(--cluster-c-color);">
                    <h3 style="color: var(--cluster-c-color);">Cluster C (Tribal)</h3>
                    <div class="issue-count"><%= issuesC %></div>
                    <div class="issue-label">
                        Pending Issues
                        <span class="material-symbols-outlined" style="font-size: 20px;">arrow_forward</span>
                    </div>
                </div>
            </a>
        </div>


        <h3 style="margin-bottom: 15px; color: #44474f;">AI Content Studio</h3>
        <div class="ai-section">
            
            <div class="card">
                <div style="display:flex; align-items:center; gap:10px; margin-bottom:10px;">
                    <span class="material-symbols-outlined" style="color:var(--md-sys-color-primary);">translate</span>
                    <h3 style="margin:0;">Module Localizer</h3>
                </div>
                <p style="color:#666; font-size:0.9rem;">Adapt standard content for specific regional clusters.</p>

                <form action="AdaptModuleServlet" method="post">
                    <textarea name="rawContent" class="input-area" placeholder="Paste standard English module content here..."></textarea>
                    
                    <div style="display: flex; align-items: center; justify-content: space-between;">
                        <div>
                            <label for="cluster" style="font-size:0.9rem; margin-right:5px;">Target:</label>
                            <select name="targetCluster" class="cluster-select">
                                <option value="A">Cluster A (Urban)</option>
                                <option value="B">Cluster B (Semi-Rural)</option>
                                <option value="C">Cluster C (Tribal)</option>
                            </select>
                            <input type="hidden" name="moduleId" value="101">
                        </div>
                        
                        <button type="submit" class="btn-primary">
                            <span class="material-symbols-outlined" style="vertical-align:middle; font-size:18px;">auto_fix_high</span> 
                            Localize
                        </button>
                    </div>
                </form>

                <% 
                    String localizedResult = (String) session.getAttribute("localizedResult");
                    String selectedCluster = (String) session.getAttribute("selectedCluster");
                    if (localizedResult != null) { 
                        String color = "#4285F4"; 
                        if("B".equals(selectedCluster)) color = "#34A853";
                        if("C".equals(selectedCluster)) color = "#EA4335";
                %>
                    <div style="margin-top: 20px; padding: 15px; background: #f9f9f9; border-left: 5px solid <%= color %>; border-radius: 4px;">
                        <strong style="color: <%= color %>;">Output for Cluster <%= selectedCluster %>:</strong>
                        <p style="margin-top: 5px; color: #333;"><%= localizedResult %></p>
                    </div>
                    <% session.removeAttribute("localizedResult"); %>
                <% } %>
            </div>

            <div class="card">
                <div style="display:flex; align-items:center; gap:10px; margin-bottom:10px;">
                    <span class="material-symbols-outlined" style="color:#fbc02d;">summarize</span>
                    <h3 style="margin:0;">Quick Summary</h3>
                </div>
                <p style="font-size:0.9rem; color:#666;">Upload .txt for key points.</p>
                <form action="UploadSummaryServlet" method="post" enctype="multipart/form-data">
                    <div style="margin-bottom:15px; background:#f0f0f0; padding:10px; border-radius:8px; text-align:center;">
                        <input type="file" name="documentFile" accept=".txt" style="width:100%;">
                    </div>
                    <button type="submit" class="btn-primary" style="background:#fbc02d; color:black; width:100%;">Generate</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Simulated Data for the Dashboard (Logic Preserved)
    int issuesA = (Integer) request.getAttribute("countA");
    int issuesB = (Integer) request.getAttribute("countB");
    int issuesC = (Integer) request.getAttribute("countC");
 
    int totalIssues = issuesA + issuesB + issuesC;
 
    double pctA = totalIssues > 0 ? (double)issuesA / totalIssues * 100 : 0;
    double pctB = totalIssues > 0 ? (double)issuesB / totalIssues * 100 : 0;
    double pctC = totalIssues > 0 ? (double)issuesC / totalIssues * 100 : 0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Vistran - District Admin</title>
 
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
 
    <style>
        :root {
            /* --- THEME: PATINA & BRONZE --- */
            --bg-body: #F4F7F6;
            --bg-sidebar: #1C3A36;
            --bg-card: #FFFFFF;
            
            --color-patina-light: #A3C9C2;
            --color-patina-main: #3D7870;
            --color-bronze: #C08552;
            --color-bronze-dark: #8B5E34;
            --color-bronze-light: #F3E5D8;
            
            --text-primary: #1F2927;
            --text-secondary: #5C6B68;
            
            --cluster-a-color: #2A9D8F;
            --cluster-b-color: #C08552;
            --cluster-c-color: #BC4749;
            
            --sidebar-width: 260px;
            --mobile-header-height: 60px;
        }

        * { box-sizing: border-box; -webkit-tap-highlight-color: transparent; }

        body { 
            margin: 0; padding: 0; 
            font-family: 'Roboto', sans-serif; 
            background-color: var(--bg-body); 
            color: var(--text-primary);
            display: flex; 
            height: 100vh; 
            overflow: hidden;
        }

        h2, h3 { font-family: 'Playfair Display', serif; }

        /* --- SIDEBAR (Desktop) --- */
        .sidebar { 
            width: var(--sidebar-width); 
            background: linear-gradient(180deg, var(--bg-sidebar) 0%, #112623 100%); 
            padding: 24px 16px; 
            display: flex; 
            flex-direction: column; 
            flex-shrink: 0;
            box-shadow: 4px 0 15px rgba(0,0,0,0.15);
            z-index: 100;
            transition: transform 0.3s ease;
        }

        .brand { 
            font-size: 1.6rem; font-weight: 700; color: #D4AF37; 
            margin-bottom: 40px; display: flex; align-items: center; gap: 12px; padding-left: 10px;
            font-family: 'Playfair Display', serif; letter-spacing: 1px;
        }

        .menu-item {
            display: flex; align-items: center; gap: 14px;
            padding: 14px 16px; margin-bottom: 6px;
            border-radius: 8px;
            color: var(--color-patina-light); 
            text-decoration: none; font-weight: 500; font-size: 0.95rem;
            transition: all 0.2s ease;
            border-left: 3px solid transparent;
        }
        
        .menu-item:hover, .menu-item:active { 
            background: rgba(255,255,255,0.05); color: #fff;
        }
        
        .menu-item.active { 
            background: linear-gradient(90deg, rgba(192, 133, 82, 0.15) 0%, transparent 100%);
            color: var(--color-bronze); 
            border-left: 3px solid var(--color-bronze);
        }

        .logout-section { margin-top: auto; border-top: 1px solid rgba(255,255,255,0.1); padding-top: 20px; }
        .logout-btn { color: #E76F51; }

        /* --- MOBILE HEADER (Hidden on Desktop) --- */
        .mobile-header {
            display: none;
            height: var(--mobile-header-height);
            background: var(--bg-sidebar);
            align-items: center;
            padding: 0 16px;
            color: #D4AF37;
            position: fixed; top: 0; left: 0; right: 0;
            z-index: 90;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }
        .hamburger-btn { background: none; border: none; color: white; cursor: pointer; padding: 5px; }

        /* --- OVERLAY (For Mobile Sidebar) --- */
        .overlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0,0,0,0.5); z-index: 95;
            opacity: 0; pointer-events: none; transition: opacity 0.3s;
        }
        .overlay.active { opacity: 1; pointer-events: auto; }

        /* --- MAIN CONTENT --- */
        .main-content { 
            flex: 1; 
            padding: 30px 40px; 
            overflow-y: auto; 
            background-image: radial-gradient(#dbe4ee 1px, transparent 1px);
            background-size: 20px 20px;
        }

        /* Top Nav & Pills */
        .top-nav { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
        
        .class-pills { display: flex; gap: 10px; overflow-x: auto; padding-bottom: 5px; -ms-overflow-style: none; scrollbar-width: none; }
        .class-pills::-webkit-scrollbar { display: none; }
        
        .pill { 
            padding: 8px 18px; border-radius: 50px; 
            border: 1px solid #C4C7C5; background: white;
            color: var(--text-secondary); font-size: 0.85rem; font-weight: 600; 
            cursor: pointer; transition: 0.2s; white-space: nowrap; flex-shrink: 0;
        }
        .pill.active { background: var(--bg-sidebar); border-color: var(--bg-sidebar); color: #fff; }

        /* Admin Header */
        .admin-header {
            display: flex; justify-content: space-between; align-items: center;
            background: white; padding: 24px 30px; border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.04); margin-bottom: 32px;
            border-bottom: 3px solid var(--color-bronze);
        }
        .admin-profile { display: flex; align-items: center; gap: 16px; text-align: right; }
        .admin-img { width: 52px; height: 52px; border-radius: 50%; object-fit: cover; border: 2px solid var(--color-bronze); }
        .status-badge { 
            display: inline-flex; align-items: center; gap: 4px; 
            background: var(--color-bronze-light); color: var(--color-bronze-dark); 
            padding: 4px 10px; border-radius: 20px; font-size: 0.75rem; font-weight: 700; margin-top: 4px;
        }

        /* Dynamic Bar */
        .dynamic-bar-container {
            width: 100%; height: 28px; background: #E0E5E4; border-radius: 6px;
            display: flex; overflow: hidden; margin-bottom: 24px;
        }
        .bar-segment {
            height: 100%; display: flex; align-items: center; justify-content: center;
            color: rgba(255,255,255,0.95); font-size: 0.75rem; font-weight: bold;
        }

        /* Cluster Cards */
        .cluster-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; margin-bottom: 40px; }
        .cluster-link { text-decoration: none; color: inherit; display: block; }
        .cluster-card {
            background: white; padding: 28px; border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.06); 
            border-top: 6px solid #ccc; height: 140px;
            display: flex; flex-direction: column; justify-content: space-between;
        }
        .issue-count { font-size: 3rem; font-weight: 700; color: var(--text-primary); }
        .issue-label { color: var(--text-secondary); font-size: 0.85rem; display: flex; justify-content: space-between; align-items: center; text-transform: uppercase; letter-spacing: 0.5px; }

        /* AI Section */
        .ai-section { display: grid; grid-template-columns: 2fr 1fr; gap: 24px; }
        .card { background: white; padding: 28px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.06); }
        
        .input-area { 
            width: 100%; height: 100px; padding: 14px; margin: 15px 0; 
            border: 1px solid #d0d0d0; border-radius: 8px; resize: vertical; 
            font-family: inherit; background: #FAFCFB;
        }
        .cluster-select { padding: 10px 15px; border-radius: 6px; border: 1px solid #ccc; margin-right: 10px; background: white; }
        .btn-primary { 
            background-color: var(--color-bronze); color: white; border: none; 
            padding: 12px 24px; border-radius: 6px; cursor: pointer; font-weight: 600; 
        }

        /* --- MOBILE OPTIMIZATION (Max Width 900px) --- */
        @media screen and (max-width: 900px) {
            body { flex-direction: column; height: 100vh; }

            /* Mobile Header */
            .mobile-header { display: flex; justify-content: space-between; }
            .mobile-header .brand-mobile { font-family: 'Playfair Display', serif; font-size: 1.4rem; font-weight: 700; display: flex; align-items: center; gap: 8px;}

            /* Sidebar -> Slide-out Drawer */
            .sidebar {
                position: fixed; top: 0; left: 0; height: 100%;
                transform: translateX(-100%); /* Hidden by default */
                transition: transform 0.3s ease;
                width: 280px; /* Slightly wider for ease of use */
            }
            .sidebar.active { transform: translateX(0); } /* Slide in */
            .brand { display: none; } /* Hide sidebar logo as it's in header now */

            /* Main Content */
            .main-content {
                padding: 16px;
                margin-top: var(--mobile-header-height); /* Push down for fixed header */
                height: calc(100vh - var(--mobile-header-height));
            }

            .top-nav { margin-bottom: 20px; }
            .class-pills { padding-right: 20px; } /* Space for scroll */

            /* Admin Header Compact */
            .admin-header {
                flex-direction: row; 
                padding: 16px; 
                gap: 12px;
                margin-bottom: 24px;
                align-items: center;
            }
            .header-text { flex: 1; }
            .header-text h2 { font-size: 1.2rem; }
            .header-text p { font-size: 0.8rem; }
            .admin-profile { text-align: right; gap: 10px; }
            .admin-img { width: 40px; height: 40px; }
            .status-badge { display: none; } /* Hide badge to save space */

            /* Grid Stacking */
            .cluster-grid { grid-template-columns: 1fr; gap: 16px; }
            .cluster-card { height: auto; padding: 20px; min-height: 120px; }
            .issue-count { font-size: 2.2rem; margin: 5px 0; }

            .ai-section { grid-template-columns: 1fr; gap: 16px; padding-bottom: 40px; }
            
            /* Form Elements */
            .input-area { font-size: 16px; /* Prevent zoom on iOS */ }
            form div { display: flex; flex-direction: column; gap: 10px; }
            .cluster-select { width: 100%; padding: 12px; }
            .btn-primary { width: 100%; padding: 14px; }
        }
    </style>
</head>
<body>

    <div class="overlay" onclick="toggleSidebar()"></div>

    <div class="mobile-header">
        <div class="brand-mobile">
            <button class="hamburger-btn" onclick="toggleSidebar()">
                <span class="material-symbols-outlined" style="font-size: 28px;">menu</span>
            </button>
            <span>Vistran</span>
        </div>
        <span class="material-symbols-outlined" style="color: #fff;">notifications</span>
    </div>

    <div class="sidebar" id="sidebar">
        <div class="brand">
            <span class="material-symbols-outlined" style="font-size: 32px; color: var(--color-bronze);">school</span> Vistran
        </div>
        
        <a href="#" class="menu-item active"><span class="material-symbols-outlined">dashboard</span> <span>Overview</span></a>
        <a href="#" class="menu-item"><span class="material-symbols-outlined">groups</span> <span>Students</span></a>
        <a href="#" class="menu-item"><span class="material-symbols-outlined">video_library</span> <span>Videos</span></a>
        <a href="#" class="menu-item"><span class="material-symbols-outlined">campaign</span> <span>Notices</span></a>
        <a href="#" class="menu-item"><span class="material-symbols-outlined">analytics</span> <span>Analytics</span></a>
        <a href="#" class="menu-item"><span class="material-symbols-outlined">settings</span> <span>Settings</span></a>

        <div class="logout-section">
            <a href="index.html" class="menu-item logout-btn">
                <span class="material-symbols-outlined">logout</span> <span>Logout</span>
            </a>
        </div>
    </div>

    <div class="main-content">
        
        <div class="top-nav">
            <div class="class-pills">
                <div class="pill active">English</div>
                <div class="pill">Hindi</div>
                <div class="pill">Marathi</div>
                <div class="pill">Gujrati</div>
                <div class="pill">Bengali</div>
            </div>
            <span class="material-symbols-outlined" style="color:var(--color-patina-main); cursor:pointer; display: none;">notifications</span>
            <style> @media(min-width: 901px) { .top-nav span { display: block !important; } } </style>
        </div>

        <div class="admin-header">
            <div class="header-text">
                <h2 style="margin:0; font-weight:700; color:var(--text-primary);">District Dashboard</h2>
                <p style="margin:5px 0 0; color:var(--text-secondary); font-size:0.95rem;">ABC District Institute</p>
            </div>
            <div class="admin-profile">
                <div>
                    <div style="font-weight: 700; color:var(--text-primary); font-size: 0.95rem;">Dr. Kumar</div>
                    <div class="status-badge"><span class="material-symbols-outlined" style="font-size:12px;">verified</span> Admin</div>
                </div>
                <img src="https://api.dicebear.com/7.x/avataaars/svg?seed=John" alt="Admin" class="admin-img">
            </div>
        </div>

        <h3 style="margin-bottom: 12px; color: var(--text-primary);">Cluster Health</h3>

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
                        Pending
                        <span class="material-symbols-outlined" style="font-size: 20px;">arrow_forward</span>
                    </div>
                </div>
            </a>

            <a href="ClusterBServlet?id=B" class="cluster-link">
                <div class="cluster-card" style="border-color: var(--cluster-b-color);">
                    <h3 style="color: var(--cluster-b-color);">Cluster B (Semi-Rural)</h3>
                    <div class="issue-count"><%= issuesB %></div>
                    <div class="issue-label">
                        Pending
                        <span class="material-symbols-outlined" style="font-size: 20px;">arrow_forward</span>
                    </div>
                </div>
            </a>

            <a href="ClusterCServlet?id=C" class="cluster-link">
                <div class="cluster-card" style="border-color: var(--cluster-c-color);">
                    <h3 style="color: var(--cluster-c-color);">Cluster C (Tribal)</h3>
                    <div class="issue-count"><%= issuesC %></div>
                    <div class="issue-label">
                        Pending
                        <span class="material-symbols-outlined" style="font-size: 20px;">arrow_forward</span>
                    </div>
                </div>
            </a>
        </div>


        <h3 style="margin-bottom: 15px; color: var(--text-primary);">AI Content Studio</h3>
        <div class="ai-section">
            
            <div class="card">
                <div style="display:flex; align-items:center; gap:10px; margin-bottom:10px;">
                    <span class="material-symbols-outlined" style="color:var(--color-patina-main);">translate</span>
                    <h3 style="margin:0;">Module Localizer</h3>
                </div>
                <p style="color:var(--text-secondary); font-size:0.9rem;">Adapt standard content for regional clusters.</p>

                <form action="AdaptModuleServlet" method="post">
                    <textarea name="rawContent" class="input-area" placeholder="Paste standard English module content here..."></textarea>
                    
                    <div style="display: flex; align-items: center; justify-content: space-between;">
                        <div>
                            <label for="cluster" style="font-size:0.9rem; margin-right:5px; color: var(--text-secondary); display:none;">Target:</label>
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
                        // Updated colors to match theme variables manually here because these are strings
                        String color = "#2A9D8F"; 
                        if("B".equals(selectedCluster)) color = "#C08552";
                        if("C".equals(selectedCluster)) color = "#BC4749";
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
                    <span class="material-symbols-outlined" style="color:var(--color-bronze);">summarize</span>
                    <h3 style="margin:0;">Quick Summary</h3>
                </div>
                <p style="font-size:0.9rem; color:var(--text-secondary);">Upload .txt for key points.</p>
                <form action="UploadSummaryServlet" method="post" enctype="multipart/form-data">
                    <div style="margin-bottom:15px; background:var(--bg-body); padding:10px; border-radius:8px; text-align:center; border: 1px dashed #ccc;">
                        <input type="file" name="documentFile" accept=".txt" style="width:100%;">
                    </div>
                    <button type="submit" class="btn-primary" style="background:var(--color-bronze-light); color:var(--color-bronze-dark); width:100%; box-shadow:none; border:1px solid var(--color-bronze);">Generate</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const overlay = document.querySelector('.overlay');
            
            if (sidebar.classList.contains('active')) {
                sidebar.classList.remove('active');
                overlay.classList.remove('active');
            } else {
                sidebar.classList.add('active');
                overlay.classList.add('active');
            }
        }
    </script>

</body>
</html>
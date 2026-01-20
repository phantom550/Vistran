<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Training Portal</title>
    <link rel="stylesheet" href="subjectdashboard.css">
</head>
<body>

<!-- Navigation Bar -->
<nav>
    <div class="nav-subject">Subject: <%= request.getAttribute("subject") %></div>
    <div class="profile-container">
        <span>User Id : <%= request.getAttribute("subject_id") %></span>
        <img src="https://ui-avatars.com/api/?name=Teacher+User&background=random"
             alt="Profile" class="profile-photo">
    </div>
</nav>

<div class="main-container">

    <!-- Sidebar -->
    <aside class="sidebar">
        <h3>Grades</h3>
        <% for (int i = 1; i <= 10; i++) { %>
            <button class="class-btn"
                onclick="location.href='ClassesServlet?subject=<%= request.getAttribute("subject") %>&subject_id=<%= request.getAttribute("subject_id") %>&classId=<%= i %>'">
                <%= i %><sup>th</sup> Std
            </button>
        <% } %>
    </aside>

    <!-- Content Area -->
    <main class="content-area">

        <!-- Video Section -->
        <section class="video-section">
            <h2 class="section-header">Resources & Lessons</h2>

            <div class="video-list">
                <%
                    List<Map<String, String>> videos =
                        (List<Map<String, String>>) request.getAttribute("videos");

                    if (videos != null && !videos.isEmpty()) {
                        for (Map<String, String> video : videos) {
                %>

                <div class="video-card">
                    <div class="thumbnail-box">
                        <%
                            String url = video.get("url");
                            String embedUrl = "";

                            if (url != null && url.endsWith(".mp4")) {
                        %>
                            <video width="100%" controls
                                   onclick="openVideo('<%= url %>', 'mp4')">
                                <source src="<%= url %>" type="video/mp4">
                            </video>
                        <%
                            } else if (url != null) {

                                if (url.contains("youtube.com/watch")) {
                                    embedUrl = "https://www.youtube.com/embed/" +
                                               url.substring(url.indexOf("v=") + 2).split("&")[0];
                                } else if (url.contains("youtu.be/")) {
                                    embedUrl = "https://www.youtube.com/embed/" +
                                               url.substring(url.lastIndexOf("/") + 1);
                                }
                        %>
                            <iframe width="100%" height="180"
                                    src="<%= embedUrl %>?controls=1&modestbranding=1&rel=0"
                                    frameborder="0"
                                    allowfullscreen
                                    onclick="openVideo('<%= embedUrl %>', 'yt')">
                            </iframe>
                        <%
                            }
                        %>
                    </div>

                    <div class="video-info">
                        <h4><%= video.get("title") %></h4>
                        <span class="video-link">▶ Tap to enlarge</span>
                    </div>
                </div>

                <%
                        }
                    } else {
                %>
                    <p>No videos available.</p>
                <%
                    }
                %>
            </div>
        </section>

        <!-- Notices Section -->
        <section class="notices-section">
            <h2 class="section-header">Important Notices</h2>
            <%
                List<Map<String, String>> notice =
                    (List<Map<String, String>>) request.getAttribute("notice");

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
                <p>No notices available.</p>
            <%
                }
            %>
        </section>

    </main>
</div>

<!-- ================= VIDEO MODAL ================= -->
<div id="videoModal" style="
    display:none;
    position:fixed;
    inset:0;
    background:rgba(0,0,0,0.85);
    z-index:9999;
    justify-content:center;
    align-items:center;
">
    <div style="
        width:85%;
        max-width:900px;
        height:70%;
        background:#000;
        border-radius:12px;
        position:relative;
        overflow:hidden;
    ">
        <span onclick="closeVideo()" style="
            position:absolute;
            top:12px;
            right:16px;
            color:white;
            font-size:22px;
            cursor:pointer;
            z-index:10;
        ">✕</span>

        <div id="videoContainer" style="width:100%; height:100%;"></div>
    </div>
</div>

<!-- ================= SCRIPT ================= -->
<script>
function openVideo(url, type) {
    const modal = document.getElementById("videoModal");
    const container = document.getElementById("videoContainer");

    container.innerHTML = "";

    if (type === "mp4") {
        container.innerHTML = `
            <video width="100%" height="100%" controls autoplay>
                <source src="${url}" type="video/mp4">
            </video>`;
    } else {
        container.innerHTML = `
            <iframe width="100%" height="100%"
                src="${url}?autoplay=1&controls=1&rel=0&modestbranding=1"
                frameborder="0"
                allow="autoplay; encrypted-media"
                allowfullscreen>
            </iframe>`;
    }

    modal.style.display = "flex";
}

function closeVideo() {
    document.getElementById("videoContainer").innerHTML = "";
    document.getElementById("videoModal").style.display = "none";
}
</script>

</body>
</html>

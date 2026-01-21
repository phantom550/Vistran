# 🎓 VISTRAN – Need-Based Teacher Training Platform
### 🏆 Hackathon Submission – Theme 2: DIET & SCERT Teacher Training

![Java](https://img.shields.io/badge/Language-Java_21-orange?style=flat-square) ![Server](https://img.shields.io/badge/Server-Apache_Tomcat_10.1-yellow?style=flat-square) ![Database](https://img.shields.io/badge/Database-MySQL_8.0-blue?style=flat-square) ![Status](https://img.shields.io/badge/Status-Live_Prototype-success?style=flat-square)

> **The Challenge:** "Training Fatigue." Teachers receive static, 50-page manuals irrelevant to their specific classroom realities (e.g., Tribal vs. Urban). Administrators lack a real-time feedback loop.
>
> **The Solution:** VISTRAN is a dynamic, AI-powered platform that replaces static manuals with a **"Live Training Ecosystem."** It adapts content to local contexts (Language/Culture) and provides instant AI support—all within a unified Java-based architecture.

---

## 🔗 Live Deployment
* **🚀 Live Demo:** [vistran.koyeb.app](https://vistran.koyeb.app/)
* **📂 GitHub Repository:** [https://github.com/phantom550/Vistran](https://github.com/phantom550/Vistran)

---

## 🚀 Our Approach
VISTRAN shifts the paradigm from **"Supply-Driven"** to **"Demand-Driven"** training.

### 1. Problem-First Methodology
Instead of pushing random training modules, VISTRAN pulls data from the classroom first.
* **Step 1:** Teachers report immediate blockers (e.g., "Student Absenteeism") via the **Issue Reporting System**.
* **Step 2:** The system aggregates this data for Administrators (DIET Principals) to visualize cluster-wise trends.
* **Step 3:** Training is assigned in response to these specific data points.

### 2. Demographic Contextualization
We recognize that **Cluster A (Urban)** and **Cluster C (Tribal)** have different needs.
* **Contextual AI:** We use Generative AI to rewrite content. A standard science lesson is automatically simplified and culturally adapted for a tribal context using familiar local examples to ensure high engagement.

### 3. Role-Based Architecture
* **Admin:** High-level analytics and training deployment (`AdminDashboardServlet`).
* **Trainer:** Content creation and issue resolution (`TrainerSubjectDashboardServlet`).
* **Teacher:** Learning access, issue raising, and AI assistance (`RaiseIssueServlet`).

---

## 🛠️ Solution in Detail (Technical Implementation)

### A. Smart AI Content Adaptation (Java Service)
* **File:** `src/main/java/com/user/PollinationsService.java`
* This dedicated Java service intercepts standard training materials and processes them through the **Pollinations.ai API** to generate three distinct versions:
    * **Urban (Cluster A):** Modern, practical language with high-resource examples.
    * **Semi-Urban (Cluster B):** Balanced language with everyday Indian examples.
    * **Tribal (Cluster C):** Simplified vocabulary, short sentences, and culturally familiar analogies.

### B. Integrated AI Chat System (Servlet)
* **File:** `src/main/java/com/user/GeminiChatServlet.java`
* **Replacement:** This Servlet completely replaces previous Node.js server implementations.
* **Function:** Handles all chatbot interactions directly within the Tomcat container. It acts as an intelligent **"Pedagogical Assistant,"** helping teachers troubleshoot classroom management issues instantly.

### C. Real-Time Feedback Loop
* **File:** `src/main/java/com/user/RaiseIssueServlet.java`
* **Function:** Captures specific classroom issues tagged by Class and Subject.
* **Impact:** Reduces the feedback cycle from months (paper reports) to seconds (database entry).

---

## 🏗️ System Architecture
The system follows a pure **Java MVC (Model-View-Controller)** architecture:

* **View (Frontend):** JSP Pages (`clusterC.jsp`, `subjectdashboard.jsp`), HTML5, CSS3, Material Design.
* **Controller (Backend):** Jakarta EE Servlets manage data flow and AI logic.
    * `GeminiChatServlet`: AI Chatbot controller.
    * `AdaptModuleServlet`: Training content adaptation controller.
* **Model (Data):** MySQL Database accessed via `DBConnection.java` (Singleton Pattern).

---

## 💻 How to Run Locally

### Prerequisites
* **JDK:** Version 21 or higher.
* **Web Server:** Apache Tomcat 10.1.
* **Database:** MySQL Server 8.0.
* **IDE:** Eclipse IDE (Enterprise Java edition).

### Step 1: Database Configuration
1.  Open MySQL Workbench.
2.  Create the database:
    ```sql
    CREATE DATABASE void4;
    ```
3.  Import the SQL schema provided in the `/database` folder of the repo.
4.  **Note:** The app connects via `jdbc:mysql://localhost:3306/void4` (User: root, Pass: root) by default. Update `src/main/java/com/user/DBConnection.java` if your credentials differ.

### Step 2: Server Setup (No Node.js Required)
1.  Open **Eclipse IDE**.
2.  **Import:** File > Open Projects from File System > Select 'vistran by void4'.
3.  **Build Path:** Right-click project > Build Path > Configure Build Path.
    * Add **Apache Tomcat v10.1** to Libraries.
    * Add `mysql-connector-j-9.5.0.jar` (from `WEB-INF/lib`) to Classpath.
4.  **Run:** Right-click Project > Run As > Run on Server (Select Tomcat v10.1).

### Step 3: Access the Platform
* **Home URL:** `http://localhost:8080/vistran_by_void4/`
* **Admin Login:** Access via `adminlogin.jsp`.

---

## 📸 Project Screenshots

### A. Dashboard Overview
*(Admin Dashboard showing Cluster A, B, C stats)*
![Admin Dashboard](path_to_your_image/dashboard.png)

### B. AI Content Adaptation
*(The "Adapt Module" feature showing simplified training text)*
![Adapted Content](path_to_your_image/adapt_content.png)

### C. Issue Reporting Interface
*(The "Raise Issue" form where teachers select Class/Subject)*
![Raise Issue](path_to_your_image/raise_issue.png)

### D. AI Chatbot
*(Chat Interface responding to a teacher's query)*
![AI Chatbot](path_to_your_image/chatbot.png)

---

## 🧰 Tech Stack
* **Frontend:** JSP, HTML, CSS, JavaScript
* **Backend:** Java (Jakarta Servlets)
* **Database:** MySQL
* **AI Service:** Pollinations.ai (via Java HTTP Client)
* **Server:** Apache Tomcat 10.1

---

## 👥 Team Members

| Name | Role | Links |
| :--- | :--- | :--- |
| **Om Chaudhari** | Developer | [GitHub](https://github.com/om0709) |
| **Ayush Yadav** | Developer | [LinkedIn](https://linkedin.com/in/ayush-yadav-333b72294) |
| **Siddhi Bahutule** | Developer | [GitHub](https://github.com/siddhivilas26) |
| **Aisha Inamdar** | Developer | [GitHub](https://github.com/BUGBUSTER11) |

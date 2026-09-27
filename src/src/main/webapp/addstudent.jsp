<!DOCTYPE html>
<%
    // 1. Retrieve parameters from the request
    // using a safe parsing approach to prevent errors if ID is missing
    String teacher_id = request.getParameter("teacher_id");
   

    String classId = request.getParameter("classId");
    String subject = request.getParameter("subject");
    String subject_id = request.getParameter("subject_id");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student Data - MD3</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        :root {
            /* MD3 Baseline Tokens */
            --md-sys-color-primary: #006495;
            --md-sys-color-on-primary: #ffffff;
            --md-sys-color-surface: #fcfcff;
            --md-sys-color-on-surface: #1a1c1e;
            --md-sys-color-outline: #73777f;
            --md-sys-color-surface-container: #f3f4f9;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 16px;
        }

        /* --- Container/Card --- */
        .md3-container {
            background-color: var(--md-sys-color-surface);
            border-radius: 28px;
            padding: 32px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0px 1px 3px rgba(0,0,0,0.1), 0px 4px 8px rgba(0,0,0,0.05);
        }

        .md3-header {
            margin-bottom: 28px;
        }

        .md3-title {
            font-size: 24px;
            font-weight: 400;
            color: var(--md-sys-color-on-surface);
        }

        .md3-subtitle {
            font-size: 14px;
            color: var(--md-sys-color-outline);
            margin-top: 4px;
        }

        /* --- Form Grid --- */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        /* Full-width fields */
        .full-width {
            grid-column: span 2;
        }

        /* --- MD3 Outlined Text Field --- */
        .md3-field {
            position: relative;
            width: 100%;
        }

        .md3-input {
            width: 100%;
            padding: 16px;
            font-size: 16px;
            font-family: inherit;
            color: var(--md-sys-color-on-surface);
            background: transparent;
            border: 1px solid var(--md-sys-color-outline);
            border-radius: 4px;
            outline: none;
            transition: border 0.1s ease;
        }

        .md3-input:focus {
            border: 2px solid var(--md-sys-color-primary);
            padding: 15px;
        }

        .md3-label {
            position: absolute;
            left: 12px;
            top: 16px;
            padding: 0 4px;
            background-color: var(--md-sys-color-surface);
            color: var(--md-sys-color-outline);
            font-size: 16px;
            pointer-events: none;
            transition: 0.2s ease all;
        }

        .md3-input:focus ~ .md3-label,
        .md3-input:not(:placeholder-shown) ~ .md3-label {
            top: -10px;
            left: 10px;
            font-size: 12px;
            color: var(--md-sys-color-primary);
            font-weight: 500;
        }

        /* --- Actions --- */
        .md3-actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 32px;
        }

        .btn {
            font-family: inherit;
            font-size: 14px;
            font-weight: 500;
            height: 40px;
            padding: 0 24px;
            border-radius: 20px;
            cursor: pointer;
            border: none;
            transition: all 0.2s;
        }

        .btn-text {
            background: transparent;
            color: var(--md-sys-color-primary);
        }

        .btn-text:hover {
            background-color: rgba(0, 100, 149, 0.08);
        }

        .btn-filled {
            background-color: var(--md-sys-color-primary);
            color: var(--md-sys-color-on-primary);
        }

        .btn-filled:hover {
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
            filter: brightness(1.1);
        }

        /* Mobile Responsiveness */
        @media (max-width: 480px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            .full-width {
                grid-column: span 1;
            }
        }
    </style>
</head>
<body>

    <div class="md3-container">
        <header class="md3-header">
            <h1 class="md3-title">Update Student Data</h1>
            <p class="md3-subtitle">Review and modify student record details</p>
        </header>
        
        <form action="AddStudent" method="POST">
            <div class="form-grid">
              <input type="hidden" name="classId" value="<%= (classId != null) ? classId : "" %>">
        <input type="hidden" name="teacher_id" value="<%= (teacher_id != null) ? teacher_id : "" %>">
        <input type="hidden" name="subject_id" value="<%= (subject_id != null) ? subject_id : "" %>">
         <input type="hidden" name="subject" value="<%= (subject != null) ? subject : "" %>">
                
                <div class="md3-field full-width">
                    <input type="text" name="student_name" id="name" class="md3-input" placeholder=" " required>
                    <label for="name" class="md3-label">Student Name</label>
                </div>

                <div class="md3-field">
                    <input type="number" name="student_id" id="sid" class="md3-input" placeholder=" " required>
                    <label for="sid" class="md3-label">Student ID</label>
                </div>

                <div class="md3-field">
                    <input type="text" name="college_id" id="cid" class="md3-input" placeholder=" " required>
                    <label for="cid" class="md3-label">College ID</label>
                </div>

                <div class="md3-field">
                    <input type="number" name="attendance" id="attn" class="md3-input" placeholder=" " min="0" max="100">
                    <label for="attn" class="md3-label">Attendance (%)</label>
                </div>

                <div class="md3-field">
                    <input type="number" name="marks" id="marks" class="md3-input" placeholder=" " min="0">
                    <label for="marks" class="md3-label">Marks Obtained</label>
                </div>

                <div class="md3-field full-width">
                    <input type="number" name="behaviour" id="behav" class="md3-input" placeholder=" " min="0" max="10">
                    <label for="behav" class="md3-label">Behaviour Score (1-10)</label>
                </div>

            </div>

            <div class="md3-actions">
                <input type="button" value="Discard" class="btn btn-text" onclick="window.history.back();">
                <input type="submit" value="Update Record" class="btn btn-filled">
            </div>
        </form>
    </div>

</body>
</html>
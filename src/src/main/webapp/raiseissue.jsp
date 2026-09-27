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
    <title>Raise an Issue - MD3 Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        :root {
            /* Material Design 3 Tokens */
            --md-sys-color-primary: #006495;
            --md-sys-color-on-primary: #ffffff;
            --md-sys-color-surface: #fcfcff;
            --md-sys-color-on-surface: #1a1c1e;
            --md-sys-color-outline: #73777f;
        }

        /* Box-sizing fix to prevent elements from overrunning the container */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #d1d5db;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        /* Modal Container */
        .md3-modal {
            background-color: var(--md-sys-color-surface);
            border-radius: 28px;
            padding: 24px;
            width: 100%;
            max-width: 480px; 
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        .md3-title {
            font-size: 24px;
            font-weight: 400;
            color: var(--md-sys-color-on-surface);
            margin-bottom: 24px;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            gap: 24px; 
            width: 100%;
        }

        /* MD3 Outlined Text Field Wrapper */
        .md3-text-field {
            position: relative;
            width: 100%;
        }

        .md3-input {
            width: 100%;
            display: block;
            padding: 16px;
            font-size: 16px;
            font-family: inherit;
            color: var(--md-sys-color-on-surface);
            background: transparent;
            border: 1px solid var(--md-sys-color-outline);
            border-radius: 4px;
            outline: none;
        }

        .md3-input:focus {
            border: 2px solid var(--md-sys-color-primary);
            padding: 15px; 
        }

        textarea.md3-input {
            min-height: 120px;
            resize: none;
        }

        /* Floating Label Styling */
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

        /* Button Actions Area */
        .md3-actions {
            display: flex;
            justify-content: flex-end;
            gap: 8px;
            margin-top: 24px;
        }

        /* Input Styling */
        .btn-input {
            font-family: inherit;
            font-size: 14px;
            font-weight: 500;
            height: 40px;
            padding: 0 24px;
            border-radius: 20px;
            cursor: pointer;
            border: none;
            transition: background-color 0.2s, box-shadow 0.2s;
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
            box-shadow: 0 1px 3px rgba(0,0,0,0.2);
            filter: brightness(1.1);
        }
    </style>
</head>
<body>

    <div class="md3-modal">
        <h1 class="md3-title">Raise an Issue</h1>
        
        <form class="form-container" action="RaiseIssueServlet" method="POST">
        
          <input type="hidden" name="classId" value="<%= (classId != null) ? classId : "" %>">
        <input type="hidden" name="teacher_id" value="<%= (teacher_id != null) ? teacher_id : "" %>">
        <input type="hidden" name="subject_id" value="<%= (subject_id != null) ? subject_id : "" %>">
         <input type="hidden" name="subject" value="<%= (subject != null) ? subject : "" %>">
            
            <div class="md3-text-field">
                <input type="text" name="category" id="category" class="md3-input" placeholder=" " required>
                <label for="category" class="md3-label">Category</label>
            </div>

            <div class="md3-text-field">
                <textarea name="description" id="description" class="md3-input" placeholder=" " required></textarea>
                <label for="description" class="md3-label">Description</label>
            </div>

            <div class="md3-actions">
                <input type="button" value="Cancel" class="btn-input btn-text" onclick="window.history.back();">
                
                <input type="submit" value="Submit" class="btn-input btn-filled">
            </div>

        </form>
    </div>

</body>
</html>
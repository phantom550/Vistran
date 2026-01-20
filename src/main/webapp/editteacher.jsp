<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 1. Retrieve parameters from the request
    // using a safe parsing approach to prevent errors if ID is missing
    String tIdRaw = request.getParameter("teacher_id");
    int teacher_id = (tIdRaw != null && !tIdRaw.isEmpty()) ? Integer.parseInt(tIdRaw) : 0;

    String classId = request.getParameter("classId");
    String subject = request.getParameter("subject");
    String subject_id = request.getParameter("subject_id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Teacher</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    
    <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
    
    <style>
        :root {
            --mdc-theme-primary: #6750A4;
            --mdc-theme-on-primary: #FFFFFF;
            --mdc-theme-surface: #FEF7FF;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--mdc-theme-surface);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .m3-card {
            background-color: #fff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0px 4px 8px 3px rgba(0,0,0,0.05);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            margin-top: 0;
            margin-bottom: 25px;
            color: #1D1B20;
            font-weight: 400;
            text-align: center;
        }

        .field-row {
            margin-bottom: 20px;
        }

        .mdc-text-field {
            width: 100%;
            border-radius: 4px 4px 0 0;
        }

        .mdc-button--raised {
            width: 100%;
            height: 40px;
            border-radius: 20px;
            font-weight: 500;
            letter-spacing: 0.5px;
        }
    </style>
</head>
<body>

<div class="m3-card">
    <h2>Edit Teacher</h2>

    <form action="EditTeacherServlet" method="post">

        <input type="hidden" name="classId" value="<%= (classId != null) ? classId : "" %>">
        <input type="hidden" name="subject" value="<%= (subject != null) ? subject : "" %>">
        <input type="hidden" name="subject_id" value="<%= (subject_id != null) ? subject_id : "" %>">

        <div class="field-row">
            <label class="mdc-text-field mdc-text-field--outlined mdc-text-field--disabled">
                <span class="mdc-notched-outline">
                    <span class="mdc-notched-outline__leading"></span>
                    <span class="mdc-notched-outline__notch">
                        <span class="mdc-floating-label" id="label-id">Teacher ID</span>
                    </span>
                    <span class="mdc-notched-outline__trailing"></span>
                </span>
                <input type="text" class="mdc-text-field__input" aria-labelledby="label-id" 
                       name="teacher_id" value="<%= teacher_id %>" readonly>
            </label>
        </div>

        <div class="field-row">
            <label class="mdc-text-field mdc-text-field--outlined">
                <span class="mdc-notched-outline">
                    <span class="mdc-notched-outline__leading"></span>
                    <span class="mdc-notched-outline__notch">
                        <span class="mdc-floating-label" id="label-name">Teacher Name</span>
                    </span>
                    <span class="mdc-notched-outline__trailing"></span>
                </span>
                <input type="text" class="mdc-text-field__input" aria-labelledby="label-name" 
                       name="teacher_name" required>
            </label>
        </div>

        <div class="field-row">
            <label class="mdc-text-field mdc-text-field--outlined">
                <span class="mdc-notched-outline">
                    <span class="mdc-notched-outline__leading"></span>
                    <span class="mdc-notched-outline__notch">
                        <span class="mdc-floating-label" id="label-email">Email</span>
                    </span>
                    <span class="mdc-notched-outline__trailing"></span>
                </span>
                <input type="email" class="mdc-text-field__input" aria-labelledby="label-email" 
                       name="email" required>
            </label>
        </div>

        <div class="field-row">
            <label class="mdc-text-field mdc-text-field--outlined">
                <span class="mdc-notched-outline">
                    <span class="mdc-notched-outline__leading"></span>
                    <span class="mdc-notched-outline__notch">
                        <span class="mdc-floating-label" id="label-date">Joined Date</span>
                    </span>
                    <span class="mdc-notched-outline__trailing"></span>
                </span>
                <input type="date" class="mdc-text-field__input" aria-labelledby="label-date" 
                       name="joined_date" required>
            </label>
        </div>


<div class="field-row">
    <label class="mdc-text-field mdc-text-field--outlined mdc-text-field--select">
        <span class="mdc-notched-outline">
            <span class="mdc-notched-outline__leading"></span>
            <span class="mdc-notched-outline__notch">
                <span class="mdc-floating-label" id="label-cluster">Cluster</span>
            </span>
            <span class="mdc-notched-outline__trailing"></span>
        </span>
        <select class="mdc-text-field__input" aria-labelledby="label-cluster" name="cluster" required>
                <option value="" disabled selected></option>
                <option value="A">Cluster A</option>
                <option value="B">Cluster B</option>
                <option value="C">Cluster C</option>
             </select>
         </label>
      </div>

        <button class="mdc-button mdc-button--raised" type="submit">
            <span class="mdc-button__label">Update</span>
        </button>

    </form>
</div>

      


<script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
<script>
    // Initialize Material Design Inputs
    document.querySelectorAll('.mdc-text-field').forEach(function(textField) {
        mdc.textField.MDCTextField.attachTo(textField);
    });
    // Initialize Button Ripple
    mdc.ripple.MDCRipple.attachTo(document.querySelector('.mdc-button'));
</script>

</body>
</html>
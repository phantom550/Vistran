<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

    <title>Login - Vistran</title>

    <style>
        :root {
            /* --- THEME: PATINA & BRONZE --- */
            --bg-body: #F4F7F6;            /* Mist White */
            --bg-sidebar: #1C3A36;         /* Deep Patina Green */
            
            /* Accents */
            --color-patina-main: #3D7870;
            --color-bronze: #C08552;       /* Warm Bronze */
            --color-bronze-dark: #8B5E34;
            
            /* Text */
            --text-primary: #1F2927;       /* Very dark green-grey */
            --text-secondary: #5C6B68;
        }

        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
            background-color: var(--bg-body);
            background-image: radial-gradient(#dbe4ee 1px, transparent 1px);
            background-size: 20px 20px; /* Subtle dot pattern matching dashboard */
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .login-container {
            background: white;
            padding: 40px 35px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            width: 100%;
            max-width: 380px;
            border-top: 5px solid var(--color-bronze);
            animation: fadeIn 0.6s ease-out;
        }

        /* Serif font for the heading */
        h2 {
            margin-top: 0;
            margin-bottom: 30px;
            color: var(--bg-sidebar) !important; /* Overriding inline style */
            font-family: 'Playfair Display', serif;
            font-size: 2rem;
            text-align: center;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            color: var(--text-secondary);
            font-weight: 500;
            font-size: 0.9rem;
        }

        .input-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
            color: var(--text-primary);
            box-sizing: border-box; /* Ensures padding doesn't break width */
            transition: all 0.3s ease;
            background: #FAFCFB;
        }

        .input-group input:focus {
            outline: none;
            border-color: var(--color-patina-main);
            box-shadow: 0 0 0 3px rgba(61, 120, 112, 0.1);
            background: white;
        }

        .login-button {
            width: 100%;
            padding: 14px;
            background-color: var(--color-bronze);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s;
            margin-top: 10px;
            letter-spacing: 0.5px;
        }

        .login-button:hover {
            background-color: var(--color-bronze-dark);
        }
        
        .login-button:active {
            transform: scale(0.98);
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Mobile Responsiveness */
        @media (max-width: 480px) {
            body {
                padding: 20px;
                align-items: flex-start; /* Move to top on small screens */
            }
            .login-container {
                margin-top: 40px;
                padding: 30px 20px;
            }
        }
    </style>
</head>

<body>

    <div class="login-container">
        <h2>Login</h2>

        <form class="login-form" action="AdminDashboardServlet" method="post">
            
            <div class="input-group">
                <label for="id">Admin ID</label>
                <input type="text" id="id" name="school_id" placeholder="abc" required>
            </div>
             
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="123"required>
            </div>

            <button type="submit" class="login-button">
                Sign In <i class="fa-solid fa-arrow-right" style="margin-left: 8px;"></i>
            </button>

        </form>
    </div>

</body>
</html>
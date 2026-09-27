package com.user; 

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

// CHANGED: "javax" is replaced with "jakarta"
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/GeminiChatServlet")
public class GeminiChatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Get the prompt from the HTML page
        String userPrompt = request.getParameter("prompt");
        
        if (userPrompt == null || userPrompt.trim().isEmpty()) {
            response.getWriter().write("Please type something.");
            return;
        }

        try {
            // 2. Encode and Prepare URL for Pollinations.ai
            String encodedPrompt = URLEncoder.encode(userPrompt, "UTF-8");
            String apiUrl = "https://text.pollinations.ai/" + encodedPrompt;
            
// ... inside your try block ...
            
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            
            // UPDATE THESE TWO LINES TO 60000 (60 seconds)
            conn.setConnectTimeout(60000); 
            conn.setReadTimeout(60000);

            // ... rest of the code ...

            // 3. Read the Response
            StringBuilder responseSB = new StringBuilder();
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    responseSB.append(responseLine);
                }
            }

            // 4. Send response back to HTML
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(responseSB.toString());

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500);
            response.getWriter().write("Error connecting to AI: " + e.getMessage());
        }
    }
}
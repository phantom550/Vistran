package com.user;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class PollinationsService {

    public static String adaptForTribalContext(String originalText,int clusterN) {
        try {
        	String prompt="";
        	
            if(clusterN==0) {         prompt = "give output: cluster wasn't recognisied " ;
 }
            
            if (clusterN == 1) {
                // Cluster A – Urban, high-resource
                prompt = "Rewrite the following educational content for an Indian urban (Cluster A) audience. Use clear, modern, and practical language, relatable urban examples, and concise explanations suitable for high-resource learning environments. Reduce the output to exactly half the number of words of the input. Content: "
                        + originalText;
            }
            else if (clusterN == 2) {
                // Cluster B – Semi-urban, mid-resource
                prompt = "Rewrite the following educational content for an Indian semi-urban (Cluster B) audience. Use simple, balanced language with everyday Indian examples, ensuring clarity for mid-resource learning environments. Reduce the output to exactly half the number of words of the input. Content: "
                        + originalText;
            }
            else if (clusterN == 3) {
                // Cluster C – Tribal, low-resource
                prompt = "Rewrite the following educational content for an Indian tribal (Cluster C) audience. Use very simple words, short sentences, culturally familiar examples, and explanations suitable for low-resource settings. Avoid technical terms where possible. Reduce the output to exactly half the number of words of the input. Content: "
                        + originalText;
            }

            
            
            // Encode the prompt for the URL
            String encodedPrompt = URLEncoder.encode(prompt, StandardCharsets.UTF_8.toString());
            
            // Pollinations.ai Text API URL
            URL url = new URL("https://text.pollinations.ai/" + encodedPrompt + "?model=openai");
            
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", "Vistran-Edu-Platform");
            conn.setConnectTimeout(100000); // 1 min timeout
            conn.setReadTimeout(100000);   // 1 min read timeout

            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
                String inputLine;
                StringBuilder response = new StringBuilder();
                
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();
                return response.toString();
            } else {
                return "Error: AI Service unavailable (Code " + responseCode + ")";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "Error: " + e.getMessage();
        }
    }
}
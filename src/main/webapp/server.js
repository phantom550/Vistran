const express = require('express');
const cors = require('cors');

const app = express();
const port = 3000;

// Middleware
app.use(cors());
app.use(express.json());

app.post('/api/chat', async (req, res) => {
    try {
        const { message } = req.body;
        console.log("📩 User asked:", message);

        // 1. Define the System Persona
        const systemContext = "You are a helpful School Admin Assistant. Keep answers professional and brief. Focus on school data, attendance, and notices.";
        
        // 2. Construct the URL (Pollinations uses GET requests with the prompt in the URL)
        const finalPrompt = `${systemContext}\nUser Question: ${message}`;
        const url = `https://text.pollinations.ai/${encodeURIComponent(finalPrompt)}`;

        // 3. Fetch from Pollinations (No Key Required)
        const response = await fetch(url);
        
        if (!response.ok) {
            throw new Error(`Pollinations API Error: ${response.status}`);
        }

        const text = await response.text();
        console.log("🤖 AI replied:", text.substring(0, 50) + "..."); 

        // 4. Send JSON back to frontend
        res.json({ reply: text });

    } catch (error) {
        console.error("❌ Error:", error.message);
        res.status(500).json({ reply: "I am having trouble reaching the server. Please try again." });
    }
});

app.listen(port, () => {
    console.log(`\n🚀 Pollinations Server running at http://localhost:${port}`);
    console.log(`   ✨ Free AI Mode Active (No Keys)`);
});
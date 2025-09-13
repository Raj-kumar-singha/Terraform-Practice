const express = require("express");
const bodyParser = require("body-parser");
const axios = require("axios");
const app = express();
const PORT = 3000;

app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
    res.send(`
    <h1>Raj Kumar Singha</h1>
    <form action="/submit" method="POST">
      <input type="text" name="name" placeholder="Enter your name"/>
      <button type="submit">Submit</button>
    </form>
  `);
});

app.post("/submit", async (req, res) => {
    try {
        // Encode as x-www-form-urlencoded so Flask sees request.form
        const params = new URLSearchParams();
        params.append("name", req.body.name || "");

        const response = await axios.post(
            "http://backend:5000/submit",
            params.toString(),
            { headers: { "Content-Type": "application/x-www-form-urlencoded" } }
        );

        res.send(`Response from Flask: ${response.data}`);
    } catch (err) {
        res.status(500).send("Error: " + err.message);
    }
});

// Listen on all interfaces (important in containers)
app.listen(PORT, "0.0.0.0", () => console.log(`Frontend running on ${PORT}`));

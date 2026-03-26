const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use((req, res, next) => {
  console.log(`${req.method} ${req.url}`);
  next();
});

// Root endpoint
app.get("/", (req, res) => {
  res.json({
    message: "CloudForge API running 🚀",
    timestamp: new Date(),
  });
});

// Health check (QUAN TRỌNG cho K8s)
app.get("/health", (req, res) => {
  res.status(200).json({
    status: "ok",
  });
});

// Readiness check (advanced)
app.get("/ready", (req, res) => {
  // Sau này check DB, cache...
  res.status(200).json({
    status: "ready",
  });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
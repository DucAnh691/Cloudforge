const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;

// 🔥 Thêm version để test CI/CD
const VERSION = process.env.VERSION || "v1";

// Middleware
app.use((req, res, next) => {
  console.log(`[${VERSION}] ${req.method} ${req.url}`);
  next();
});

// Root endpoint
app.get("/", (req, res) => {
  res.json({
    message: "CloudForge API running qua da 🚀",
    version: VERSION,
    timestamp: new Date(),
  });
});

// Health check (K8s dùng)
app.get("/health", (req, res) => {
  res.status(200).json({
    status: "ok",
    version: VERSION,
  });
});

// Readiness check
app.get("/ready", (req, res) => {
  res.status(200).json({
    status: "ready",
    version: VERSION,
  });
});

app.listen(PORT, () => {
  console.log(`Server ${VERSION} running on port ${PORT}`);
});
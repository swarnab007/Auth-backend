module.exports = {
    apps: [
      {
        name: "auth-backend",
        script: "./server.js", // Entry point for your application
        instances: "max", // Use all available CPUs
        exec_mode: "cluster", // Cluster mode for load balancing
        env: {
          NODE_ENV: "development", // Default environment
        },
        env_production: {
          NODE_ENV: "production", // Production environment
        },
      },
    ],
  };
  
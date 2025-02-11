import mysql from "mysql2/promise";

// Get configuration from environment variables
const config = {
  db: {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || 'rootpassword',
    database: process.env.DB_NAME || 'womens_health_db'
  }
};

// Create a connection pool with SSL settings if needed
const pool = mysql.createPool({
  host: config.db.host,
  user: config.db.user,
  password: config.db.password,
  database: config.db.database,
  connectionLimit: 10,
  ssl: process.env.NODE_ENV === 'production' ? {
    rejectUnauthorized: true,
  } : false
});

// Directly use the promise-based pool.execute
// Used for prepared queries
export const query = async (sql, params) => {
  try {
    const [results] = await pool.execute(sql, params);
    return results;
  } catch (err) {
    throw err; // Forward the error for handling elsewhere
  }
};

// Used for making queries with multiple tuples
export const bulkQuery = async (sql, params) => {
  try {
    const [results] = await pool.query(sql, params);
    return results;
  } catch (err) {
    throw err; // Forward the error for handling elsewhere
  }
};

// Optionally export the pool if you need to manage connections manually
export default pool;

import express from "express";
import cors from "cors";
import bodyParser from "body-parser";
import fruitRouter from "./routers/edibles.js";
import authRouter from "./routers/auth.js";
import appointmentRouter from "./routers/appointment.js";

import './sendEmails.js';

import dataFetchRouter from "./routers/dataFetch.js";


const app = express();

// CORS options configuration
const corsOptions = {
    origin: ['http://localhost:5173', 'http://127.0.0.1:5173'],  // Allow your frontend's origin
    methods: ['GET', 'POST', 'PUT', 'DELETE'],  // Allowed HTTP methods
    credentials: true,  // Allow credentials such as cookies or headers
    allowedHeaders: ['Content-Type', 'Authorization'],  // Allow specific headers
};

app.use(cors(corsOptions));  // Enable CORS with options
app.use(bodyParser.json());  // Parse JSON requests

// Routes
app.use("/edibles", fruitRouter);
app.use("/auth", authRouter);
app.use("/appointment", appointmentRouter);
app.use('/dataFetch', dataFetchRouter);

// Start the server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}`);
});

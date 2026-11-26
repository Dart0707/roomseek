require("dotenv").config();

const jwt = require("jsonwebtoken");
const express = require("express");
const cors = require("cors");
const bcrypt = require("bcrypt");

const { initializeApp, applicationDefault } = require("firebase-admin/app");
const { getDataConnect } = require("firebase-admin/data-connect");

// Initialize Firebase
const app = initializeApp({
    credential: applicationDefault(),
    projectId: "roomseek-233b5",
});

// Connect to Firebase Data Connect
const dc = getDataConnect(
    {
        serviceId: "appdevroomseek",
        location: "asia-southeast1",
    },
    app
);

// Initialize Express
const server = express();

server.use(cors());
server.use(express.json());

// Test endpoint
server.get("/", (req, res) => {
    res.json({
        message: "RoomSeek API is running!",
    });
});

// Get all users
server.get("/api/users", async (req, res) => {
    try {
        const result = await dc.executeGraphqlRead(`
      query {
        users {
          idNum
          name
          college
          role
        }
      }
    `);

        res.json(result.data);

    } catch (error) {
        console.error("User retrieval failed:", error);
        res.status(500).json({
            message: "Failed to retrieve users",
        });
    }
});

// Get all room schedules
server.get("/api/schedules", async (req, res) => {
    try {
        const result = await dc.executeGraphqlRead(`
            query {
                schedules {
                    schedId
                    room
                    day
                    fromTime
                    toTime
                    isOccupied
                }
            }
        `);

        res.json(result.data);

    } catch (error) {
        console.error("Schedule retrieval failed:", error);

        res.status(500).json({
            message: "Failed to retrieve room schedules",
        });
    }
});

// Create a new room schedule
server.post("/api/schedules", async (req, res) => {
    try {
        const { room, day, fromTime, toTime } = req.body;

        // Validate required fields
        if (!room || !day || !fromTime || !toTime) {
            return res.status(400).json({
                message: "Please provide all schedule details."
            });
        }

        const mutation = `
            mutation CreateSchedule(
                $room: String!
                $day: String!
                $fromTime: String!
                $toTime: String!
            ) {
                schedule_insert(
                    data: {
                        room: $room
                        day: $day
                        fromTime: $fromTime
                        toTime: $toTime
                    }
                )
            }
        `;

        const result = await dc.executeGraphql(mutation, {
            variables: {
                room,
                day,
                fromTime,
                toTime
            }
        });

        res.status(201).json({
            message: "Schedule created successfully!",
            schedule: {
                room,
                day,
                fromTime,
                toTime,
                isOccupied: false
            }
        });

    } catch (error) {
        console.error("Schedule creation failed:", error);

        res.status(500).json({
            message: "Failed to create schedule."
        });
    }
});




server.post("/api/register", async (req, res) => {
    try {
        const { idNum, name, college, email, password } = req.body;

        // Validate required fields
        if (!idNum || !name || !college || !email || !password) {
            return res.status(400).json({
                message: "All fields are required."
            });
        }

        if (password.length < 8) {
            return res.status(400).json({
                message: "Password must be at least 8 characters."
            });
        }

        const normalizedEmail = email.trim().toLowerCase();

        // Hash password
        const passwordHash = await bcrypt.hash(password, 12);

        // Create user in Firebase Data Connect
        const mutation = `
      mutation RegisterUser(
        $idNum: String!,
        $name: String!,
        $college: String!,
        $email: String!,
        $passwordHash: String!
      ) {
        user_insert(data: {
          idNum: $idNum,
          name: $name,
          college: $college,
          email: $email,
          passwordHash: $passwordHash,
          role: STUDENT
        })
      }
    `;

        await dc.executeGraphql(mutation, {
            variables: {
                idNum: idNum.trim(),
                name: name.trim(),
                college: college.trim(),
                email: normalizedEmail,
                passwordHash
            }
        });

        res.status(201).json({
            message: "Account created successfully!",
            user: {
                idNum: idNum.trim(),
                name: name.trim(),
                college: college.trim(),
                email: normalizedEmail,
                role: "STUDENT"
            }
        });

    } catch (error) {
        console.error("Registration error:", error);

        const errorMessage = String(error.message || "").toLowerCase();

        if (
            errorMessage.includes("unique") ||
            errorMessage.includes("duplicate") ||
            errorMessage.includes("already_exists")
        ) {
            return res.status(409).json({
                message: "Student ID or email is already registered."
            });
        }

        res.status(500).json({
            message: "Registration failed. Please try again."
        });
    }
});


// Login endpoint
server.post("/api/login", async (req, res) => {
    try {
        const { email, password } = req.body;

        // Validate input
        if (!email || !password) {
            return res.status(400).json({
                message: "Email and password are required."
            });
        }

        if (!process.env.JWT_SECRET) {
            throw new Error("JWT_SECRET is not configured.");
        }

        const normalizedEmail = email.trim().toLowerCase();

        // Find user by email
        const query = `
      query FindUserByEmail($email: String!) {
        users(where: { email: { eq: $email } }) {
          idNum
          name
          college
          email
          passwordHash
          role
        }
      }
    `;

        const result = await dc.executeGraphqlRead(query, {
            variables: {
                email: normalizedEmail
            }
        });

        const users = result.data?.users || [];
        const user = users[0];

        // Check account and password
        if (!user || !user.passwordHash) {
            return res.status(401).json({
                message: "Invalid email or password."
            });
        }

        const passwordMatches = await bcrypt.compare(
            password,
            user.passwordHash
        );

        if (!passwordMatches) {
            return res.status(401).json({
                message: "Invalid email or password."
            });
        }

        // Generate login token
        const token = jwt.sign(
            {
                idNum: user.idNum,
                role: user.role
            },
            process.env.JWT_SECRET,
            {
                expiresIn: process.env.JWT_EXPIRES_IN || "1d"
            }
        );

        // Return account details without password hash
        res.json({
            message: "Login successful!",
            token,
            user: {
                idNum: user.idNum,
                name: user.name,
                college: user.college,
                email: user.email,
                role: user.role
            }
        });

    } catch (error) {
        console.error("Login error:", error);

        res.status(500).json({
            message: "Login failed. Please try again."
        });
    }
});



// Start server
const PORT = process.env.PORT || 5000;

server.listen(PORT, () => {
    console.log(`RoomSeek API running on port ${PORT}`);
});

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


// Get all rooms
server.get("/api/rooms", async (req, res) => {
    try {
        const result = await dc.executeGraphqlRead(`
            query {
                rooms {
                    roomId
                    roomNumber
                    building
                    floor
                }
            }
        `);

        res.json(result.data);

    } catch (error) {
        console.error("Room retrieval failed:", error);

        res.status(500).json({
            message: "Failed to retrieve rooms."
        });
    }
});


// Create a new room
server.post("/api/rooms", async (req, res) => {
    try {
        const { roomNumber, building, floor } = req.body;

        if (!roomNumber || !building || floor == null) {
            return res.status(400).json({
                message: "Please provide all room details."
            });
        }

        // Check if room already exists
        const existingRoom = await dc.executeGraphqlRead(`
            query FindRoom($roomNumber: String!) {
                rooms(where: {
                    roomNumber: { eq: $roomNumber }
                }) {
                    roomId
                }
            }
        `, {
            variables: { roomNumber }
        });

        if (existingRoom.data?.rooms?.length > 0) {
            return res.status(409).json({
                message: "Room already exists."
            });
        }

        const mutation = `
            mutation CreateRoom(
                $roomNumber: String!
                $building: String!
                $floor: Int!
            ) {
                room_insert(data: {
                    roomNumber: $roomNumber
                    building: $building
                    floor: $floor
                })
            }
        `;

        await dc.executeGraphql(mutation, {
            variables: {
                roomNumber: roomNumber.trim(),
                building: building.trim(),
                floor: Number(floor)
            }
        });

        res.status(201).json({
            message: "Room created successfully!",
            room: {
                roomNumber: roomNumber.trim(),
                building: building.trim(),
                floor: Number(floor)
            }
        });

    } catch (error) {
        console.error("Room creation failed:", error);

        res.status(500).json({
            message: "Failed to create room."
        });
    }
});

// Delete a room schedule
server.delete("/api/schedules/:schedId", async (req, res) => {
    try {
        const { schedId } = req.params;

        const mutation = `
            mutation DeleteSchedule($schedId: String!) {
                schedule_delete(key: { schedId: $schedId })
            }
        `;

        await dc.executeGraphql(mutation, {
            variables: { schedId }
        });

        res.json({
            message: "Schedule deleted successfully!",
            schedId
        });

    } catch (error) {
        console.error("Schedule deletion failed:", error);

        res.status(500).json({
            message: "Failed to delete schedule."
        });
    }
});


// Get all room schedules with room details
server.get("/api/schedules", async (req, res) => {
    try {
        const result = await dc.executeGraphqlRead(`
            query {
                schedules {
                    schedId
                    roomId
                    roomInfo {
                        roomNumber
                        building
                        floor
                    }
                    day
                    fromTime
                    toTime
                }
            }
        `);

        res.json(result.data);

    } catch (error) {
        console.error("Schedule retrieval failed:", error);

        res.status(500).json({
            message: "Failed to retrieve room schedules"
        });
    }
});

// Create a new room schedule
// Create a new room schedule
server.post("/api/schedules", async (req, res) => {
    try {
        const { roomId, day, fromTime, toTime } = req.body;

        if (!roomId || !day || !fromTime || !toTime) {
            return res.status(400).json({
                message: "Please provide all schedule details."
            });
        }

        // Verify that the room exists
        const roomResult = await dc.executeGraphqlRead(`
            query FindRoom($roomId: String!) {
                rooms(where: {
                    roomId: { eq: $roomId }
                }) {
                    roomId
                    roomNumber
                    building
                    floor
                }
            }
        `, {
            variables: { roomId }
        });

        const room = roomResult.data.rooms[0];

        if (!room) {
            return res.status(404).json({
                message: "Room not found."
            });
        }

        const mutation = `
            mutation CreateSchedule(
                $roomId: String!
                $day: String!
                $fromTime: String!
                $toTime: String!
            ) {
                schedule_insert(data: {
                    roomId: $roomId
                    day: $day
                    fromTime: $fromTime
                    toTime: $toTime
                })
            }
        `;

        await dc.executeGraphql(mutation, {
            variables: {
                roomId,
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
                toTime
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

// Get all reservations (temporary inspection endpoint)
server.get("/api/reservations", async (req, res) => {
    try {
        const result = await dc.executeGraphqlRead(`
            query {
                reservations {
                    resId
                    schedId
                    idNum
                    reservationDate
                    status
                }
            }
        `);

        res.json(result.data);

    } catch (error) {
        console.error("Reservation retrieval failed:", error);

        res.status(500).json({
            message: "Failed to retrieve reservations"
        });
    }
});

// Start server
const PORT = process.env.PORT || 5000;

server.listen(PORT, () => {
    console.log(`RoomSeek API running on port ${PORT}`);
});

import 'package:flutter/material.dart';
import 'schedule_screen.dart';

class DashboardScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const DashboardScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF172554);
    const blue = Color(0xFF2563EB);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: navy,
        foregroundColor: Colors.white,
        title: const Text(
          'RoomSeek',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            const Text(
              'Welcome back,',
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),

            const SizedBox(height: 5),

            Text(
              user['name'] ?? 'Student',
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),

            const SizedBox(height: 24),

            // User Profile Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: navy,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: navy, size: 28),
                      ),
                      SizedBox(width: 12),
                      Text(
                        'STUDENT PROFILE',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  _profileDetail('Student ID', user['idNum']),

                  _profileDetail('College', user['college']),

                  _profileDetail('Email Address', user['email']),

                  _profileDetail('Account Role', user['role']),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Explore RoomSeek',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),

            const SizedBox(height: 15),

            // Feature Cards
            Row(
              children: [
                Expanded(
                  child: _featureCard(
                    icon: Icons.meeting_room_outlined,
                    title: 'Room Schedules',
                    description: 'View available rooms',
                    color: blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScheduleScreen(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: _featureCard(
                    icon: Icons.event_available_outlined,
                    title: 'Reservations',
                    description: 'Manage your bookings',
                    color: Colors.teal,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Coming Soon',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Room searching and reservation features '
                    'will be available here.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileDetail(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 3),
          Text(
            value?.toString() ?? 'Not available',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 155,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 32),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

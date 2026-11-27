import 'package:flutter/material.dart';
import 'schedule_screen.dart';
import 'profile_screen.dart';
// import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  final Map<String, dynamic> user;

  const DashboardScreen({super.key, required this.user});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 1; // Defaults to the middle Schedule screen

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Center(child: Text('Home Page')), // Replace with HomeScreen(user: widget.user)
      const ScheduleScreen(),
      ProfileScreen(user: widget.user), // <-- Removed 'const' here
    ];

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(icon: Icons.home_outlined, index: 0),
              _buildNavItem(icon: Icons.calendar_today_outlined, index: 1),
              _buildNavItem(icon: Icons.person_outline, index: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index}) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isSelected ? 105 : 54,
        height: 44,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFB48A18) : Colors.transparent,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Icon(
          icon,
          size: 22,
          color: isSelected ? const Color(0xFFFACC15) : const Color(0xFF9CA3AF),
        ),
      ),
    );
  }
}
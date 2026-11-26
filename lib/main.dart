import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const RoomSeekApp());
}

class RoomSeekApp extends StatelessWidget {
  const RoomSeekApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RoomSeek',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      ),
      home: const LoginScreen(),
      routes: {'/login': (context) => const LoginScreen()},
    );
  }
}

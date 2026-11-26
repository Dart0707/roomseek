
import 'dart:convert';
import 'package:http/http.dart' as http;

class ScheduleService {
  static const String baseUrl = 'http://localhost:5000/api';

  static Future<List<dynamic>> getSchedules() async {
    final response = await http.get(
      Uri.parse('$baseUrl/schedules'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['schedules'] ?? [];
    }

    throw Exception('Failed to load room schedules.');
  }
}

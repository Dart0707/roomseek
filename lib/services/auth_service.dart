
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // Local Express API
  static const String baseUrl = 'http://localhost:5000/api';

  // LOGIN
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    }

    throw Exception(data['message'] ?? 'Login failed.');
  }

  // REGISTER
  static Future<Map<String, dynamic>> register({
    required String idNum,
    required String name,
    required String college,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'idNum': idNum,
        'name': name,
        'college': college,
        'email': email,
        'password': password,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return data;
    }

    throw Exception(data['message'] ?? 'Registration failed.');
  }
}

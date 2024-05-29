import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepository {
  final String baseUrl = 'http://localhost:3003';

  AuthRepository(String s);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers:<String, String> {'Content-Type': 'application/json'},
      body: json.encode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['token']; // Return the entire response map
    } else {
      print('Failed to signup: ${response.statusCode} ${response.body}');
      throw Exception('Failed to signup with status code ${response.statusCode}');
    }
  }

  Future<String> signup(String fullname, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'fullname': fullname, 'email': email, 'password': password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['token']; // Assume the token is directly returned upon successful registration
    } else {
      print('Failed to signup with status code ${response.statusCode} and body ${response.body}');
    throw Exception('Failed to signup with status code ${response.statusCode}');
    }
  }

  Future<void> logout() async {
    // Here you might clear stored tokens or perform a server-side logout if applicable
    // Logic will depend on how your backend handles sessions or tokens
  }
}

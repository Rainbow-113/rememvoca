import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:rememvoca/Model/auth_model.dart';
import 'package:rememvoca/Model/user_model.dart';

class AuthService {
  static const String baseUrl = "https://10.0.2.2:7299/api";

  IOClient _getClient() {
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;
    return IOClient(client);
  }

  // Register
  Future<AuthResponse?> register(RegisterRequest request) async {
    try {
      final ioClient = _getClient();
      final response = await ioClient.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      print("register status: ${response.statusCode}");
      print("register body: ${response.body}");

      if (response.statusCode == 200) {
        return AuthResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  // Login
  Future<AuthResponse?> login(LoginRequest request) async {
    try {
      final ioClient = _getClient();
      final response = await ioClient.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      print("login status: ${response.statusCode}");
      print("login body: ${response.body}");

      if (response.statusCode == 200) {
        return AuthResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
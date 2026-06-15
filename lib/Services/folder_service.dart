import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:rememvoca/Model/folder_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class folderService {
  static const String baseUrl = "https://10.0.2.2:7299/api";

  IOClient _createClient() {
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;
    return IOClient(client);
  }

  Future<Map<String, String>> _authHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token') ?? '';
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }


  Future<List<folderModel>> getFolders() async {
    final headers = await _authHeaders();
    final response = await _createClient().get(
      Uri.parse('$baseUrl/folders'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => folderModel.fromJson(e)).toList();
    }
    throw Exception('Lỗi lấy danh sách folder: ${response.statusCode}');
  }

  // POST
  Future<void> createFolder(String title, String? description) async {
    final headers = await _authHeaders();
    final body = jsonEncode({
      "title":       title,
      "description": description,
      "totalWords":  0,
      "maxWords":    50,
    });
    final response = await _createClient().post(
      Uri.parse('$baseUrl/folders'),
      headers: headers,
      body: body,
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception(response.body);
    }
  }

  // DELETE
  Future<void> deleteFolder(String id) async {
    final headers = await _authHeaders();
    final response = await _createClient().delete(
      Uri.parse('$baseUrl/folders/$id'),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('Xóa thất bại: ${response.statusCode}');
    }
  }

  // PUT cập nhật folder
  Future<void> updateFolder(String id, String title, String? description) async {
    final headers = await _authHeaders();
    final body = jsonEncode({
      "title":       title,
      "description": description,
    });
    final response = await _createClient().put(
      Uri.parse('$baseUrl/folders/$id'),
      headers: headers,
      body: body,
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
  }
  //search
  Future<List<folderModel>> searchFolders(String keyword) async {
    final headers = await _authHeaders();
    final response = await _createClient().get(
      Uri.parse('$baseUrl/folders/search?keyword=$keyword'),
      headers: headers,
    );
    print("search status: ${response.statusCode}");  // thêm
    print("search body: ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => folderModel.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi tìm kiếm folder');
    }
  }
}
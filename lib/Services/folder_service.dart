// lib/Services/folder_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:rememvoca/Model/folder_model.dart';

class folderService {
  // ← thay bằng IP máy tính của bạn
  static const String baseUrl = "http://10.0.2.2:5220/api";

  // Lấy tất cả folder
  Future<List<folderModel>> getFolders() async {
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;

    final ioClient = IOClient(client);

    final response = await ioClient.get(Uri.parse('$baseUrl/folders'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => folderModel.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi lấy danh sách folder');
    }
  }
}

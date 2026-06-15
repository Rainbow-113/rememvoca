import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';
import 'package:rememvoca/Model/word_model.dart';

class wordService {
  static const String baseUrl = "https://10.0.2.2:7299/api";
  // Lấy tất cả folder
  Future<List<wordModel>> getWordsByFolderId(String folderId) async {
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;

    final ioClient = IOClient(client);

    final response = await ioClient.get(Uri.parse('$baseUrl/words/$folderId'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => wordModel.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi lấy danh sách từ vựng');
    }
  }
  //thêm mới
  Future<void> createWord(wordModel word) async {
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;
    final ioClient = IOClient(client);
    final response = await ioClient.post(
      Uri.parse('$baseUrl/words'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(word.toJson()),
    );
    print("status: ${response.statusCode}");
    print("body: ${response.body}");
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

  }
  //delete
  Future<void> deleteWord(String id) async {
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;
    final ioClient = IOClient(client);
    final response = await ioClient.delete(Uri.parse('$baseUrl/words/$id'));
    print("delete status: ${response.statusCode}");
  }
  //update
    Future<void> updateWord(String id, wordModel word) async {
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;
    final ioClient = IOClient(client);

    final response = await ioClient.put(
      Uri.parse('$baseUrl/words/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(word.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    print("update status: ${response.statusCode}");
    print("update body: ${response.body}");
  }
}

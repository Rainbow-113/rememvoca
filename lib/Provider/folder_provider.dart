import 'package:flutter/cupertino.dart';
import 'package:rememvoca/Model/folder_model.dart';
import 'package:rememvoca/Services/folder_service.dart';

class folderProvider extends ChangeNotifier {
  final folderService _folderService = folderService();
  List<folderModel> _folders = [];
  bool _isLoading = false;
  String _error = '';

  List<folderModel> get folders => _folders;
  bool get isLoading => _isLoading;
  String get error => _error;
  Future<void> loadFolders() async {
    try {
      _isLoading = true;
      notifyListeners();
      _folders = await _folderService.getFolders();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

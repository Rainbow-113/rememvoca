import 'package:flutter/cupertino.dart';
import 'package:rememvoca/Model/folder_model.dart';
import 'package:rememvoca/Services/folder_service.dart';

class folderProvider extends ChangeNotifier {
  final folderService _folderService = folderService();
  List<folderModel> _folders = [];
  List<folderModel> get folders => _folders;
  bool _isLoading = false;
  String? _error ;

  bool get isLoading => _isLoading;
  String? get error => _error;
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

  //add
  Future<String?> addFolder(String title, String? description) async {
    try {
      print("addFolder: $title");
      await _folderService.createFolder(title, description);
      await loadFolders();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  //delete
  Future<String?> removeFolder(String id) async {
    await _folderService.deleteFolder(id);
    await loadFolders();
  }

// update
  Future<String?> updateFolder(String id, String title, String? description,) async {
    try {
      await _folderService.updateFolder(id,title,description);
      await loadFolders();
      return null;
    } catch (e) {
      return e.toString().replaceFirst('Exception: ', '');
    }
  }
  // search
  Future<void> searchFolders(String keyword) async {
    if (keyword.isEmpty) {
      await loadFolders();
      return;
    }
    try {
      _isLoading = true;
      notifyListeners();
      _folders = await _folderService.searchFolders(keyword);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  void clearError() {
    _error = null;
    notifyListeners();
  }
}

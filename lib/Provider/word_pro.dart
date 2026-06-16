import 'package:flutter/cupertino.dart';
import 'package:rememvoca/Model/word_model.dart';
import 'package:rememvoca/Services/word_service.dart';

class wordProvider extends ChangeNotifier {
  final wordService _wordService = wordService();
  List<wordModel> _words = [];
  bool _isLoading = false;
  String _error = '';

  List<wordModel> get words => _words;
  bool get isLoading => _isLoading;
  String get error => _error;

  List<wordModel> _searchResults = [];
  bool _isSearching = false;
  List<wordModel> get searchResults => _searchResults;
  bool get isSearching => _isSearching;

  Future<void> loadWords(String folderId) async {
    try {
      _isLoading = true;
      notifyListeners();
      _words = await _wordService.getWordsByFolderId(folderId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  //create
  Future<void> createWord(wordModel word) async {
    try {
      await _wordService.createWord(word);
      await loadWords(word.folderId);
    } catch (e) {
      print("Lỗi createWord: $e");
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }
  //delete
  Future<void> deleteWord(String wordId, String folderId) async {
    try {
      await _wordService.deleteWord(wordId);
      await loadWords(folderId);
    } catch (e) {
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }
  //update
  Future<void> updateWord(String id, wordModel word) async {
    try {
      await _wordService.updateWord(id, word);
      await loadWords(word.folderId);
    } catch (e) {
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }
  //search
  Future<void> searchWords(String keyword) async {
    try {
      if (keyword.isEmpty) {
        _isSearching = false;
        _searchResults = [];
        notifyListeners();
        return;
      }
      _isSearching = true;
      _searchResults = await _wordService.searchWords(keyword);
    } catch (e) {
      _searchResults = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}

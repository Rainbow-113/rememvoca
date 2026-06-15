import 'package:flutter/foundation.dart';
import 'package:rememvoca/Services/auth_service.dart';

import 'package:rememvoca/Model/auth_model.dart';
import 'package:rememvoca/Model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// Trạng thái xác thực của người dùng
/// - initial       : chưa khởi tạo (app vừa mở)
/// - loading       : đang gọi API
/// - authenticated : đăng nhập thành công
/// - unauthenticated: chưa / đã đăng xuất
/// - error         : có lỗi xảy ra
enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

/// Provider quản lý toàn bộ trạng thái xác thực trong app.
/// Được đăng ký ở main.dart qua MultiProvider.
class AuthProvider extends ChangeNotifier {
  // Service thực hiện gọi API auth
  final AuthService _authService = AuthService();

  //

  AuthStatus _status = AuthStatus.initial; // trạng thái hiện tại
  AuthResponse? _authResponse;             // dữ liệu trả về sau khi login/register
  String? _errorMessage;                   // thông báo lỗi (null nếu không có lỗi)

  //

  AuthStatus get status        => _status;
  AuthResponse? get authResponse => _authResponse;
  String? get token            => _authResponse?.token;   // JWT token gửi kèm request
  String? get userId           => _authResponse?.userId;  // MongoDB _id của user
  String? get name             => _authResponse?.name;
  String? get email            => _authResponse?.email;
  String? get errorMessage     => _errorMessage;
  bool get isAuthenticated     => _status == AuthStatus.authenticated;
  bool get isLoading           => _status == AuthStatus.loading;

  //

  /// Gọi _loadFromStorage ngay khi Provider được tạo
  /// để khôi phục session nếu user đã từng đăng nhập
  AuthProvider() {
    _loadFromStorage();
  }

  //

  /// Đọc token + thông tin user đã lưu trong SharedPreferences.
  /// Nếu tồn tại → tự động set trạng thái authenticated (không cần login lại).
  Future<void> _loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();

    final savedToken  = prefs.getString('auth_token');
    final savedUserId = prefs.getString('auth_userId');
    final savedName   = prefs.getString('auth_name');
    final savedEmail  = prefs.getString('auth_email');

    if (savedToken != null && savedToken.isNotEmpty) {
      // Dựng lại AuthResponse từ dữ liệu đã lưu
      _authResponse = AuthResponse(
        token:  savedToken,
        userId: savedUserId ?? '',
        name:   savedName  ?? '',
        email:  savedEmail ?? '',
      );
      _status = AuthStatus.authenticated;
    } else {
      // Chưa có token → yêu cầu đăng nhập
      _status = AuthStatus.unauthenticated;
    }
    notifyListeners();
  }

  //

  /// Gọi API register, lưu token + thông tin user vào storage.
  /// Trả về true nếu thành công, false nếu thất bại.
  Future<bool> register(RegisterRequest request) async {
    try {
      _status = AuthStatus.loading;
      _errorMessage = null;
      notifyListeners(); // báo UI hiện loading

      final response = await _authService.register(request);

      if (response != null) {
        _authResponse = response;
        await _saveToStorage(response); // lưu vào SharedPreferences
        _status = AuthStatus.authenticated;
        notifyListeners();
        return true;
      }

      // API trả về null (không mong đợi, nhưng vẫn xử lý)
      _status = AuthStatus.error;
      _errorMessage = 'Đăng ký thất bại';
      notifyListeners();
      return false;
    } catch (e) {
      // Lỗi từ AuthService (status code != 200, network error, ...)
      _status = AuthStatus.error;
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      notifyListeners();
      return false;
    }
  }

  // Đăng nhập

  /// Gọi API login, lưu token + thông tin user vào storage.
  /// Trả về true nếu thành công, false nếu thất bại.
  Future<bool> login(LoginRequest request) async {
    try {
      _status = AuthStatus.loading;
      _errorMessage = null;
      notifyListeners(); // báo UI hiện loading

      final response = await _authService.login(request);

      if (response != null) {
        _authResponse = response;
        await _saveToStorage(response); // lưu vào SharedPreferences
        _status = AuthStatus.authenticated;
        notifyListeners();
        return true;
      }

      // API trả về null (không mong đợi, nhưng vẫn xử lý)
      _status = AuthStatus.error;
      _errorMessage = 'Đăng nhập thất bại';
      notifyListeners();
      return false;
    } catch (e) {
      // Lỗi từ AuthService (sai mật khẩu, network error, ...)
      _status = AuthStatus.error;
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      notifyListeners();
      return false;
    }
  }

  // Đăng xuấ

  /// Xoá toàn bộ dữ liệu user khỏi SharedPreferences và reset state.
  /// Sau khi gọi, app sẽ điều hướng về màn hình login.
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('auth_userId');
    await prefs.remove('auth_name');
    await prefs.remove('auth_email');

    _authResponse = null;
    _status       = AuthStatus.unauthenticated;
    _errorMessage = null;
    notifyListeners();
  }

  // Xoá lỗi

  /// Dùng khi UI muốn ẩn thông báo lỗi (vd: user bắt đầu nhập lại form).
  void clearError() {
    _errorMessage = null;
    _status       = AuthStatus.unauthenticated;
    notifyListeners();
  }

  //  Lưu vào SharedPreferences


  Future<void> _saveToStorage(AuthResponse response) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token',  response.token);
    await prefs.setString('auth_userId', response.userId);
    await prefs.setString('auth_name',   response.name);
    await prefs.setString('auth_email',  response.email);
  }


}
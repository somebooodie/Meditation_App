import 'package:flutter/material.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/authService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService authService = AuthService();
  String _token = "";
  User? _currentUser;

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _token.isNotEmpty;

  Future<String> signup({required User user}) async {
    try {
      _token = await authService.signup(user: user);
      if (_token.isNotEmpty) {
        _currentUser =
            user.copyWith(password: ''); // Clear password for security
        await saveTokenInStorage(_token);
        notifyListeners();
      }
      return _token;
    } catch (e) {
      // Log or handle the error as needed
      print('Signup Error: $e');
      return '';
    }
  }

  Future<String> signin({required User user}) async {
    try {
      _token = await authService.signin(user: user);
      if (_token.isNotEmpty) {
        _currentUser =
            user.copyWith(password: ''); // Clear password for security
        await saveTokenInStorage(_token);
        notifyListeners();
      }
      return _token;
    } catch (e) {
      // Log or handle the error as needed
      print('Signin Error: $e');
      return '';
    }
  }

  Future<void> saveTokenInStorage(String token) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString('token', token);
  }

  Future<void> readFromStorage() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    _token = sharedPrefs.getString('token') ?? "";
    if (_token.isNotEmpty) {
      // Optionally retrieve user details using the token
      // _currentUser = await fetchUserDetails();
      notifyListeners();
    }
  }

  Future<void> signout() async {
    _token = '';
    _currentUser = null;
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.remove('token');
    notifyListeners();
  }

  // Add other relevant methods as needed
}

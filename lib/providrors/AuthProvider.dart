import 'package:flutter/material.dart';
import 'package:meditation_app/models/token.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/authService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dio/dio.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService authService = AuthService();
  String token = "";
  String _username = "";

  void setUsername(String username) {
    _username = username;
    // You might want to notify listeners if the UI depends on the username
    notifyListeners();
  }

  String getUserUsername() {
    return _username;
  }

  Future<String> signup({required User user}) async {
    token = await authService.signup(user: user);
    saveTokenInStorage(token);
    notifyListeners();
    return token;
  }

  Future<String> signin({required User user}) async {
    token = await authService.signin(user: user);
    _username = user.username;
    saveTokenInStorage(token);
    notifyListeners();
    return token;
  }

  Future<void> saveTokenInStorage(String token) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString('token', token);
  }

  Future<String?> readTokenInStorage() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString('token');
  }

  Future<void> logout() async {
    // Clear the token from the local storage
    SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.remove('token');
    token = "";
    _username = ""; // Assuming you have a _username variable to clear as well
    // Notify listeners that the user has logged out
    notifyListeners();
  }

  // Future<bool> updateProfile(String username, String password) async {
  //   // Read token from storage or use the current token in memory
  //   String? storedToken = await readTokenInStorage();
  //   if (storedToken != null && storedToken.isNotEmpty) {
  //     bool success = await authService.updateProfile(
  //         username: username, password: password, token: storedToken);
  //     if (success) {
  //       // Update the username in local storage if needed
  //       _username = username;
  //       notifyListeners();
  //     }
  //     return success;
  //   }
  //   return false;
  // }

  Future<bool> updateProfile(String username, String password) async {
    String? storedToken = await readTokenInStorage();
    if (storedToken == null || storedToken.isEmpty) {
      throw Exception('Authentication token not found.');
    }

    try {
      bool success = await authService.updateProfile(
        username: username,
        password: password,
        token: storedToken,
      );

      if (success) {
        _username = username;
        notifyListeners();
        return true;
      } else {
        // You can throw a more specific exception if needed
        throw Exception(
            'Failed to update the profile. The server response was unsuccessful.');
      }
    } on DioError catch (dioError) {
      // Handle DioError specifically if you want to extract response data
      throw Exception(
          'Failed to update profile: ${dioError.response?.data['message'] ?? dioError.message}');
    } catch (e) {
      // Any other exception that might occur
      rethrow; // This will pass the exception back to the caller
    }
  }
}

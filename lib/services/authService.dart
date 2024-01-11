import 'package:dio/dio.dart';
import 'package:meditation_app/models/token.dart';
import 'package:meditation_app/models/user.dart'; // Make sure this includes UserCredentials
import 'package:meditation_app/services/client.dart';

class AuthService {
  Future<String> signup({required User user}) async {
    try {
      if (user.username.isNotEmpty && user.password.isNotEmpty) {
        final Response response =
            await ApiClient.dio.post("/signup", data: user.toJson());
        print(response.data);
        Token tokenModel = Token.fromJson(response.data);
        return tokenModel.token.toString();
      }
      return "";
    } catch (e) {
      // Handle DioError or other specific errors
      throw e.toString();
    }
  }

  Future<String> signin({required User user}) async {
    try {
      final Response response =
          await ApiClient.dio.post("/signin", data: user.toJson());
      Token tokenModel = Token.fromJson(response.data);
      return tokenModel.token.toString();
    } catch (e) {
      // Handle DioError or other specific errors
      throw e.toString();
    }
  }

  Future<bool> updateProfile(
      {required String username,
      required String password,
      required String token}) async {
    try {
      final Response response = await ApiClient.dio.put(
        "/update",
        data: {
          'username': username,
          'password': password,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.statusCode ==
          200; // Return true if the update was successful
    } catch (e) {
      // Handle DioError or other specific errors
      throw e.toString();
    }
  }
}

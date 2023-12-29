import 'package:dio/dio.dart';
import 'package:meditation_app/models/token.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/client.dart';

class AuthService {
  // Future<String> signup({required User user}) async {
  //   try {
  //     if (user.userName.isNotEmpty && user.password.isNotEmpty) {
  //       final Response response =
  //           await ApiClient.dio.post("/signup", data: user.toJson());
  //       // Removed the direct print statement
  //       Token tokenModel = Token.fromJson(response.data);
  //       return tokenModel.token?.toString() ?? "";
  //     }
  //     return "";
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
  Future<String> signup({required User user}) async {
    try {
      final Response response =
          await ApiClient.dio.post("/signup", data: user.toJson());
      print('API Response: ${response.data}'); // Debugging statement

      if (response.data != null && response.data['token'] != null) {
        // Assuming the token is in the 'token' field of the response
        String token = response.data['token'];
        print('Received token: $token'); // Confirming token receipt
        return token;
      } else {
        print('Signup response does not contain a token.');
        return "";
      }
    } catch (e) {
      print('Signup error: $e'); // Debugging statement
      return "";
    }
  }

  Future<String> signin({required User user}) async {
    try {
      final Response response =
          await ApiClient.dio.post("/signin", data: user.toJson());
      Token tokenModel = Token.fromJson(response.data);
      return tokenModel.token?.toString() ?? "";
    } catch (e) {
      throw e.toString();
    }
  }
}

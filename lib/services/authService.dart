import 'package:dio/dio.dart';
import 'package:meditation_app/models/token.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/client.dart';

class AuthService {
  Future<String> signup({required User user}) async {
    try {
      final Response response =
          await ApiClient.dio.post("/signup", data: user.toJson());
      print('API Response: ${response.data}'); // Debugging statement

      if (response.data != null && response.data['token'] != null) {
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
      print(
          'Sending request with data: ${user.toJson()}'); // Log the request data
      final Response response =
          await ApiClient.dio.post("/signin", data: user.toJson());
      print('API Response: ${response.data}'); // Debugging statement

      if (response.data != null && response.data['token'] != null) {
        String token = response.data['token'];
        print('Received token: $token'); // Confirming token receipt
        return token;
      } else {
        print('Signin response does not contain a token.');
        return "";
      }
    } catch (e) {
      print('Signin error: $e'); // Debugging statement
      return "";
    }
  }
}

//   Future signin({required User user}) async {
//     try {
//       final Response response =
//           await ApiClient.dio.post("/signin", data: user.toJson());
//       Token tokenModel = Token.fromJson(response.data);
//       return tokenModel.token;
//     } catch (e) {
//       throw e.toString();
//     }
//   }
// }

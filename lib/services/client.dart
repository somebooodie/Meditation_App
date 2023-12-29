import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static Dio dio = Dio(
    BaseOptions(baseUrl: "https://coded-meditation.eapi.joincoded.com"),
  );

  static void setAuthToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  static Future<void> init() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String? token = sharedPrefs.getString('token');
    if (token != null && token.isNotEmpty) {
      setAuthToken(token);
    }
  }
}

class NamedRoutes {
  static final String login = "signin";
}

import 'package:dio/dio.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(baseUrl: "https://coded-meditation.eapi.joincoded.com"),
  );
}

class NamedRoutes {
  static final String login = "signin";
}

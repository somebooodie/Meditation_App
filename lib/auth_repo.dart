import 'package:meditation_app/models/token.dart';
import 'package:meditation_app/services/authService.dart';

class AuthRepo {
  Future<Token?> signupRepo(user) async {
    try {
      final String response = await AuthService().signup(user: user);
      final tokenModel = Token.fromJson({'token': response});
      return tokenModel;
    } catch (e) {
      // Handle errors, e.g., display an error message or log the error
      print('Error during signupRepo: $e');
      throw e; // Rethrow the error if needed
    }
  }
}

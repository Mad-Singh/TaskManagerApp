import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AuthService {
  // Register a new user
  static Future<Map<String, dynamic>> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    final user = ParseUser(email, password, email);
    user.set('name', name);

    final response = await user.signUp();

    if (response.success) {
      return {
        'success': true,
        'message': 'Registration successful!',
        'user': response.result,
      };
    } else {
      return {
        'success': false,
        'message': response.error?.message ?? 'Registration failed',
      };
    }
  }

  // Login user
  static Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    final user = ParseUser(email, password, null);
    final response = await user.login();

    if (response.success) {
      return {
        'success': true,
        'message': 'Login successful!',
        'user': response.result,
      };
    } else {
      return {
        'success': false,
        'message': response.error?.message ?? 'Login failed',
      };
    }
  }

  // Logout user
  static Future<bool> logoutUser() async {
    final user = await ParseUser.currentUser() as ParseUser?;
    if (user != null) {
      final response = await user.logout();
      return response.success;
    }
    return false;
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final user = await ParseUser.currentUser() as ParseUser?;
    if (user == null) return false;

    final response =
        await ParseUser.getCurrentUserFromServer(user.sessionToken!);
    return response?.success ?? false;
  }

  // Get current user
  static Future<ParseUser?> getCurrentUser() async {
    return await ParseUser.currentUser() as ParseUser?;
  }
}

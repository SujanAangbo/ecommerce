import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<void> saveUserData({
    required String email,
    required String password,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('email', email);
    sharedPreferences.setString('password', password);
  }

  static Future<Map<String, dynamic>> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? email = sharedPreferences.getString('email');
    String? password = sharedPreferences.getString('password');

    return {
      'email': email,
      'password': password,
    };
  }

  static Future<void> logOutUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}

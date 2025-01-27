import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class AuthController {
  final String loginUrl = 'http://10.0.2.2:8081/auth/login';
  final String registerUrl = 'http://10.0.2.2:8081/users/user';

  Future<String?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(<String, String>{'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['token'];
      } else {
        print('Failed to login: ${response.statusCode} ${response.reasonPhrase}');
        return null;
      }
    } on SocketException catch (e) {
      print('Network error: $e');
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<bool> register(Map<String, String> userData) async {
    try {
      final response = await http.post(
        Uri.parse(registerUrl),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        print('Failed to register: ${response.statusCode} ${response.reasonPhrase}');
        return false;
      }
    } on SocketException catch (e) {
      print('Network error: $e');
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
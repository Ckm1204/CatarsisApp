import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService {
  static const String _tokenKey = "auth_token";

  /// Guarda el token JWT en SharedPreferences
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  /// Obtiene el token almacenado en SharedPreferences
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  /// Elimina el token (logout)
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  /// Verifica si el token es válido y no ha expirado
  bool isTokenValid(String token) {
    return !JwtDecoder.isExpired(token);
  }

  /// Extrae el ID del usuario del token JWT
  String? getUserId(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    return decodedToken["sub"]?.toString(); // "sub" contiene el ID del usuario
  }

  /// Extrae el nombre del usuario o rol del token JWT
  String? getUserRole(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    return decodedToken["authorities"]?.toString(); // "authorities" contiene el rol del usuario
  }
}

import 'package:catarsis/modules/auth/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:catarsis/utils/services/auth_service/auth_service.dart';
import 'package:catarsis/modules/home/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String? _errorMessage;

  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String? token = await _authService.login(email, password);

    if (token != null) {
      await _authService.saveToken(token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      setState(() {
        _errorMessage = 'Login failed. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            if (_errorMessage != null) Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              ),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
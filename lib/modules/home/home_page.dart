import 'package:flutter/material.dart';
import 'package:catarsis/utils/services/auth_service/auth_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  String? _userId;
  String? _userName;
  String? _role;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    String? token = await _authService.getToken();
    if (token != null) {
      setState(() {
        _userId = _authService.getUserId(token);
        _userName = _authService.getUserName(token);
        _role = _authService.getUserRole(token);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_userId != null) Text('User ID: $_userId'),
            if (_userName != null) Text('User Name: $_userName'),
            if (_role != null) Text('Role: $_role'),
          ],
        ),
      ),
    );
  }
}
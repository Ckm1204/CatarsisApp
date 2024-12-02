import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  final Map<String, String> _userData = {
    'firstName': '',
    'lastName': '',
    'identityDocument': '',
    'phoneNumber': '',
    'birthDate': '',
    'email': '',
    'password': '',
  };

  void _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      bool success = await _authController.register(_userData);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful!')),
        );
        Navigator.pop(context); // Regresa a la pantalla de login
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration failed. Please try again.')),
        );
      }
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    final emailRegEx = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailRegEx.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Phone number must contain only digits';
    }
    return null;
  }

  String? _validateBirthDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your birth date';
    }
    final dateRegEx = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (!dateRegEx.hasMatch(value)) {
      return 'Date format must be dd/mm/yyyy';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'First Name'),
                onSaved: (value) => _userData['firstName'] = value!,
                validator: (value) => value!.isEmpty ? 'Please enter your first name' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last Name'),
                onSaved: (value) => _userData['lastName'] = value!,
                validator: (value) => value!.isEmpty ? 'Please enter your last name' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Identity Document'),
                onSaved: (value) => _userData['identityDocument'] = value!,
                validator: (value) => value!.isEmpty ? 'Please enter your identity document' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                onSaved: (value) => _userData['phoneNumber'] = value!,
                validator: _validatePhoneNumber,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Birth Date (dd/mm/yyyy)'),
                onSaved: (value) => _userData['birthDate'] = value!,
                validator: _validateBirthDate,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (value) => _userData['email'] = value!,
                validator: _validateEmail,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) => _userData['password'] = value!,
                validator: _validatePassword,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _register,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

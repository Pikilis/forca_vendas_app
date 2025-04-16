import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';
import 'home_screen.dart';
import 'user/user_registration_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final UserController _userController = UserController();

  @override
  void initState() {
    super.initState();
    _userController.loadUsers();
  }

  void _login() {
    final name = _nameController.text;
    final password = _passwordController.text;
    if (_userController.validateUser(name, password)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserRegistrationScreen()),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
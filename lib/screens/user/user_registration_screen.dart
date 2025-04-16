import 'package:flutter/material.dart';
import '../../controllers/user_controller.dart';
import '../../models/user.dart';

class UserRegistrationScreen extends StatefulWidget {
  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final UserController _userController = UserController();

  @override
  void initState() {
    super.initState();
    _userController.loadUsers();
  }

  void _saveUser() {
    if (_formKey.currentState!.validate()) {
      final user = User(
        id: int.parse(_idController.text),
        name: _nameController.text,
        password: _passwordController.text,
      );
      _userController.addUser(user);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register User')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'ID'),
                validator: (value) =>
                    value!.isEmpty ? 'ID is required' : null,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Name is required' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) =>
                    value!.isEmpty ? 'Password is required' : null,
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveUser,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
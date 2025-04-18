import 'package:flutter/material.dart';
import '../../controllers/user_controller.dart';
import '../../models/user.dart';

class UserRegistrationScreen extends StatefulWidget {
  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final UserController _userController = UserController();
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  int _nextId = 1;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() async {
    await _userController.loadUsers();
    setState(() {
      if (_userController.users.isNotEmpty) {
        _nextId = _userController.users.map((u) => u.id).reduce((a, b) => a > b ? a : b) + 1;
      }
    });
  }

  void _saveUser() async {
    if (_formKey.currentState!.validate()) {
      final newUser = User(
        id: _nextId,
        name: _nameController.text,
        password: _passwordController.text,
      );
      await _userController.addUser(newUser);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo Usuário')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) => value == null || value.isEmpty ? 'Informe o nome' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) => value == null || value.isEmpty ? 'Informe a senha' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveUser,
                child: Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

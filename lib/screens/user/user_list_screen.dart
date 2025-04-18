import 'package:flutter/material.dart';
import '../../controllers/user_controller.dart';
import 'user_registration_screen.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserController _userController = UserController();

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() async {
    await _userController.loadUsers();
    setState(() {});
  }

  void _deleteUser(int id) async {
    await _userController.deleteUser(id);
    _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuários')),
      body: ListView.builder(
        itemCount: _userController.users.length,
        itemBuilder: (context, index) {
          final user = _userController.users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text('ID: ${user.id}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteUser(user.id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserRegistrationScreen()),
          ).then((_) => _loadUsers());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

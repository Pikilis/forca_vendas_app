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
    _userController.loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: ListView.builder(
        itemCount: _userController.users.length,
        itemBuilder: (context, index) {
          final user = _userController.users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text('ID: ${user.id}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Implement edit functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _userController.deleteUser(user.id);
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserRegistrationScreen()),
          ).then((_) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
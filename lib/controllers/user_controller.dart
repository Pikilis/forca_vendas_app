import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/user.dart';

class UserController {
  List<User> users = [];

  Future<void> loadUsers() async {
    final file = await _getFile('users.json');
    if (await file.exists()) {
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      users = json.map((e) => User.fromJson(e)).toList();
    }
  }

  Future<void> saveUsers() async {
    final file = await _getFile('users.json');
    await file.writeAsString(jsonEncode(users));
  }

  bool validateUser(String name, String password) {
    if (users.isEmpty && name == 'admin' && password == 'admin') return true;
    return users.any((user) => user.name == name && user.password == password);
  }

  void addUser(User user) {
    users.add(user);
    saveUsers();
  }

  void updateUser(int id, User updatedUser) {
    final index = users.indexWhere((user) => user.id == id);
    if (index != -1) {
      users[index] = updatedUser;
      saveUsers();
    }
  }

  void deleteUser(int id) {
    users.removeWhere((user) => user.id == id);
    saveUsers();
  }

  Future<File> _getFile(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$filename');
  }
}
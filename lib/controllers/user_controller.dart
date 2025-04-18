import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/user.dart';

class UserController {
  List<User> users = [];

  Future<void> loadUsers() async {
    final file = await _getFile('users.json');

    if (!(await file.exists())) {
      await file.writeAsString('[]'); // cria com lista vazia caso não exista
    }

    final contents = await file.readAsString();
    final List<dynamic> jsonList = jsonDecode(contents);
    users = jsonList.map((e) => User.fromJson(e)).toList();
  }

  Future<void> saveUsers() async {
    final file = await _getFile('users.json');
    await file.writeAsString(jsonEncode(users));
  }

  Future<void> addUser(User user) async {
    users.add(user);
    await saveUsers();
  }

  Future<void> updateUser(int id, User updatedUser) async {
    final index = users.indexWhere((user) => user.id == id);
    if (index != -1) {
      users[index] = updatedUser;
      await saveUsers();
    }
  }

  Future<void> deleteUser(int id) async {
    users.removeWhere((user) => user.id == id);
    await saveUsers();
  }

  bool validateUser(String name, String password) {
    if (users.isEmpty && name == 'admin' && password == 'admin') return true;
    return users.any((user) => user.name == name && user.password == password);
  }

  Future<File> _getFile(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$filename');
  }
}

import 'dart:convert';

class User {
  int id;
  String name;
  String password;

  User({required this.id, required this.name, required this.password});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'password': password,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        password: json['password'],
      );
}
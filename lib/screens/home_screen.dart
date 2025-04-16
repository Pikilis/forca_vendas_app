import 'package:flutter/material.dart';
import 'user/user_list_screen.dart';
import 'client/client_list_screen.dart';
import 'product/product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sales Force')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserListScreen()),
                );
              },
              child: Text('Manage Users'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientListScreen()),
                );
              },
              child: Text('Manage Clients'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListScreen()),
                );
              },
              child: Text('Manage Products'),
            ),
          ],
        ),
      ),
    );
  }
}
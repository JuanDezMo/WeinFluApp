import 'package:flutter/material.dart';
import '../config/app_routes.dart';
import '../models/user.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = User(name: 'WeinCoder', age: 30);
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Body - New Page'),
          onPressed: () => Navigator.of(context)
          .pushReplacementNamed(AppRoutes.otherPage, arguments: userData))
          )
    );
  }
}
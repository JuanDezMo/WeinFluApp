import 'package:flutter/material.dart';
import 'package:my_first_app/pages/home_page.dart';
import 'package:my_first_app/pages/other_page.dart';

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
          child: Text('Body - New Page'),
          onPressed: () => Navigator.of(context)
          .pushReplacementNamed(AppRoutes.otherPage, arguments: userData))
          )
    );
  }
}
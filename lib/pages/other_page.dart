import 'package:flutter/material.dart';
import 'package:my_first_app/pages/home_page.dart';

import '../models/user.dart';

class OtherPage extends StatelessWidget {
  final User userData;
  
  const OtherPage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Page'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Body - Other Page \nName: ${userData.name} - Age: ${userData.age}'),
          onPressed: () => 
          Navigator.of(context).pop())
      )
    );
  }
}
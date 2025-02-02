import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const HomePage());
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome to Home Page'),
      ),
    );
  }
}

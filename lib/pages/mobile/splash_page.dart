import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Home Page'),
      ),
      body: Center(
        child: Text('Welcome to the Mobile App Home Page!'),
      ),
    );
  }
}
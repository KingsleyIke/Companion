import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/navigation_service.dart';

class AuthPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final navigationService = Provider.of<NavigationService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Login'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              navigationService.navigateTo('/dashboard');
            },
        child: Text('Welcome to the Back Office Login Page!'),
      ),
    )
    );
  }
}
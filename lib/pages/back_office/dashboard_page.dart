import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/navigation_service.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationService = Provider.of<NavigationService>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Admin Login'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Center vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            // Center horizontally
            children: [
              ElevatedButton(
                onPressed: () {
                  navigationService.goBack(); // Go back to the previous page
                },
                child: Text('Go Back'),
              ),
              Text('Welcome to the Back Office Login Page!'),
            ],
          ),
        ));
  }
}

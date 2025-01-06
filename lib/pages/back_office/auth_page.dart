import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/navigation_service.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    final navigationService = Provider.of<NavigationService>(context);

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                // First section - at the top
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/app_icon_no_bg.png',
                        width: 60,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'MyCompanion',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                // Second section - evenly spaced and scrollable
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Welcome to My Companion',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Sign In to Companion',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          SizedBox(
                            width: 400,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.email),
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 12.0),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Email is required';
                                      }
                                      // Regex to validate email format
                                      String pattern =
                                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                                      if (!RegExp(pattern).hasMatch(value)) {
                                        return 'Enter a valid email address';
                                      }
                                      return null; // Valid email
                                    },
                                    onSaved: (value) {
                                      _email = value!;
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      suffixIcon: Icon(Icons.lock),
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 12.0),
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password is required';
                                      }
                                      if (value.length < 6) {
                                        return 'Password must be at least 6 characters long';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _password = value!;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // TODO: Handle sign-in logic here
                                navigationService.navigateTo('/dashboard');
                              }
                            },
                            child: Text('Sign In'),
                          ),
                        ])),
                  ),
                ),

                // Third section - at the bottom
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text("Powered by? "),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: Navigate to Hez-Tech page
                        },
                        child: Text('HezTech'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Second part of the screen with a blue background
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFF0C1E22),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                            "Admin Portal to manage App features and upload data",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 40,),
                        Text("Download App on Play store or App store, to get access to mobile features",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/appstore.jpeg',
                                width: 100,
                                height: 100),
                            SizedBox(height: 10),
                            Text('Download from App Store',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ],
                        ),
                        SizedBox(width: 40), // Spacing between columns
                        // Play Store Column
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/playstore.png',
                                width: 100,
                                height: 100),
                            SizedBox(height: 10),
                            Text('Download from Play Store',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ],
                        ),
                      ],
                    ),

                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

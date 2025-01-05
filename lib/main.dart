import 'package:companion/pages/back_office/dashboard_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'pages/back_office/auth_page.dart';
import 'pages/mobile/splash_page.dart';
import 'services/navigation_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<NavigationService>(create: (_) => NavigationService()),  // Provide NavigationService
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget homeScreen;

    if (kIsWeb) {
      homeScreen = AuthPage(); // Web for back office
    } else if (Platform.isIOS || Platform.isAndroid) {
      homeScreen = SplashPage(); // Mobile for Android/iOS
    } else {
      homeScreen = Scaffold(
        body: Center(
          child: Text('Unsupported platform.'),
        ),
      );
    }

    return MaterialApp(
          title: 'Catholic Companion',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          // home: homeScreen,
          navigatorKey: Provider.of<NavigationService>(context).navigatorKey,
          initialRoute: '/',
          routes: {
            '/': (context) => homeScreen,
            '/dashboard': (context) => DashboardPage(),
          },
        );
  }
}

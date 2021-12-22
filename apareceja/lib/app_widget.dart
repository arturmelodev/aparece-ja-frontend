import 'package:apareceja/home_page.dart';
import 'package:apareceja/signin_page.dart';
import 'package:apareceja/signup_page.dart';
import 'package:flutter/material.dart';

import 'app_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          brightness: AppController.instance.isDarkTheme
              ? Brightness.dark
              : Brightness.light),
      initialRoute: '/',
      routes: {
        '/': (context) => const SignInPage(),
        '/home': (context) => const HomePage(),
        '/signup': (context) => const SignUpPage(),
      },
    );
  }
}
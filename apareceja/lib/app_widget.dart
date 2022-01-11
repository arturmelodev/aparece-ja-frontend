import 'package:apareceja/screens/home_page.dart';
import 'package:apareceja/screens/signin_page.dart';
import 'package:apareceja/screens/signup_page.dart';
import 'package:flutter/material.dart';

import 'controllers/app_controller.dart';

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
      },
    );
  }
}

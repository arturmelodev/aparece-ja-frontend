import 'package:apareceja/components/background_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String firstName;

  const HomePage({Key? key, required this.firstName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundHome(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Column(
              children: [Text("Olá, $firstName")],
            )),
      ),
    );
  }
}

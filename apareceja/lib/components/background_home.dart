import 'package:flutter/material.dart';

class BackgroundHome extends StatelessWidget {
  final Widget child;

  const BackgroundHome({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [Colors.deepPurple, Colors.purple.shade300])),
    );
  }
}

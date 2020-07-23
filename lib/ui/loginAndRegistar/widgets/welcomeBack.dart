import 'package:flutter/material.dart';

class WelcomeBackText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Text(
        'Welcome back!',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 32.0,
          color: Color(0xFF8C746A),
        ),
      ),
    );
  }
}

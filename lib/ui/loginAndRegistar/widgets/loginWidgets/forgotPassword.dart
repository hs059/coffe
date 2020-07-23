

import 'package:coffe/constant.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 10),
        alignment: Alignment.centerRight,
        child: Text(
          'Forgot password?',
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }
}

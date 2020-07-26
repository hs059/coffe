

import 'package:coffe/provider/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../inputTextField.dart';

class LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context) ;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Form(
        key: provider.formKeyLogin,
        child: Column(
          children: <Widget>[
            InputTextFormField(
              label: 'Email',
              validator:provider.validateEmail ,
              onSaved: provider.saveEmail,
            ),
            SizedBox(
              height: 16,
            ),
            InputTextFormField(
              iconData: provider.iconData,
              label: 'Password',
              password: provider.toggleEye,
              validator:provider.validatePassword ,
              onSaved: provider.savePassword,
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:coffe/provider/myProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'widgets/Login_with_google.dart';
import 'widgets/login&registerButton.dart';
import 'package:coffe/constant.dart';
import 'package:coffe/ui/loginAndRegistar/widgets/registerWidgets/registerForm.dart';
import 'package:coffe/ui/loginAndRegistar/widgets/welcomeBack.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';



import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall:Provider.of<MyProvider>(context). spinner,
        child: Column(
          children: <Widget>[
            Image.asset('images/artwork.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'Get the best coffee \nin town!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFF8C746A),
                fontSize: 32.0,
              ),
            ),
            LoginAndRegister(),
            LoginGoogle(),
          ],
        ),
      ),
    );
  }
}

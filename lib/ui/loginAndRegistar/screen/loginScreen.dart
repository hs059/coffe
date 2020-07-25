import 'package:coffe/constant.dart';
import 'package:coffe/provider/myProvider.dart';
import 'package:coffe/ui/loginAndRegistar/screen/registarScreen.dart';
import 'package:coffe/ui/loginAndRegistar/widgets/loginWidgets/forgotPassword.dart';
import 'package:coffe/ui/loginAndRegistar/widgets/loginWidgets/loginButton.dart';
import 'package:coffe/ui/loginAndRegistar/widgets/loginWidgets/loginForm.dart';
import 'package:coffe/ui/loginAndRegistar/widgets/welcomeBack.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';




class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: kAppBar(context,'Login'),
      body: ModalProgressHUD(
        inAsyncCall:Provider.of<MyProvider>(context).spinner,
        child: Column(
          children: <Widget>[
            WelcomeBackText(),
            LoginForm(),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 30,
              ),
              child: Column(
                children: <Widget>[
                  ForgetPassword(),
                  SizedBox(
                    height: 10,
                  ),
                  LoginButton(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 16,
                    ),
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(text: 'Don\'t have an account? '),
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ));
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


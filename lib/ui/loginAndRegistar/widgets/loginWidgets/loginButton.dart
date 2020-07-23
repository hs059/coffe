import 'package:coffe/auth.dart';
import 'package:coffe/provider/myProvider.dart';
import 'package:coffe/ui/selectDrink/screen/selectDrinkScreen.dart';


import 'package:flutter/material.dart';

import 'package:coffe/constant.dart';



import 'package:provider/provider.dart';



class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context, listen: false);
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36),
      ),
      color: kPrimaryColor,
      onPressed: () async {
        provider.submit(provider.formKeyLogin);

        final result = await Auth.auth.loginUsingEmailAndPassword(
            email: provider.email, password: provider.password);

        result.isEmpty?
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => SelectDrinkScreen(),
        ),
        ):print('snackBar');


      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

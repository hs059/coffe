import 'package:coffe/auth.dart';
import 'package:coffe/provider/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffe/ui/selectDrink/screen/selectDrinkScreen.dart';
import 'package:coffe/constant.dart';

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context, listen: false);
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36),
      ),
      color: kPrimaryColor,
      onPressed: () async {
        provider.submit(provider.formKeyRegister);
        final result = await Auth.auth.registerUsingEmailAndPassword(
            email: provider.email, password: provider.password);
        print(result == null ? 'invaled' : result);
        result == null
            ? Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color(0xFFF0F0EC),
                  content: Text(
                    'This username is already used.\nTry another username',
                    style: TextStyle(color: Color(0xFF111328), fontSize: 18),
                  ),
                ),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectDrinkScreen(),
                ),
              );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

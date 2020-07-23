

import 'package:coffe/auth.dart';
import 'package:coffe/ui/selectDrink/screen/selectDrinkScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: FlatButton(
        color: Color(0xFFB98068),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.0),
        ),
        onPressed: () async{
         final result =  await Auth.auth.loginUsingGoogle() ;
         print('$result 2222');
         result?
         Navigator.push(context, MaterialPageRoute(
           builder: (context) => SelectDrinkScreen(),
         ),
         ):print('snackBar');
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(FontAwesomeIcons.google,color: Colors.white,),
              SizedBox(width: 15,),
              Text(
                'Connect with Gmail',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

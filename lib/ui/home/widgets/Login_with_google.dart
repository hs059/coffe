

import 'package:coffe/auth.dart';
import 'package:coffe/provider/myProvider.dart';
import 'package:coffe/ui/selectDrink/screen/selectDrinkScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


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
          Provider.of<MyProvider>(context,listen: false).toggleSpinner();
          try{
            final result =  await Auth.auth.loginUsingGoogle() ;
            result?
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => SelectDrinkScreen(),
            ),
            ):print('snackBar');
            Provider.of<MyProvider>(context,listen: false).toggleSpinner();

          }catch(e){
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Color(0xFFF0F0EC),
                content: Row(
                  children: <Widget>[
                    Text(
                      'Not connected to the internet',
                      style: TextStyle(color: Color(0xFFFF0800), fontSize: ScreenUtil().setSp(18)),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(10),),
                    Icon(Icons.signal_wifi_off,color:Color(0xFFFF0800) ,)
                  ],
                ),
              ),
            ) ;
            Provider.of<MyProvider>(context,listen: false).toggleSpinner();

          }

        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(FontAwesomeIcons.google,color: Colors.white,),
              SizedBox(width: ScreenUtil().setWidth(15),),
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

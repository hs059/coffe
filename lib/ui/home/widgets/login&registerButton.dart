
import 'package:coffe/ui/loginAndRegistar/screen/loginScreen.dart';
import 'package:coffe/ui/loginAndRegistar/screen/registarScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class LoginAndRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 360,height:692,allowFontScaling: true);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              color: Color(0xFFB98068),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(30),
          ),
          Expanded(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(
                    color: Color(0xFFB98068),
                  ),),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Color(0xFFB98068),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

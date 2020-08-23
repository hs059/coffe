import 'package:coffe/auth.dart';
import 'package:coffe/provider/myProvider.dart';
import 'package:coffe/ui/admin/adminOrderScreen.dart';
import 'package:coffe/ui/selectDrink/screen/selectDrinkScreen.dart';

import 'package:flutter/material.dart';

import 'package:coffe/constant.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context, listen: false);
    ScreenUtil.init(context,width: 360,height:692,allowFontScaling: true);

    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36),
      ),
      color: kPrimaryColor,
      onPressed: () async {
        try {
          Provider.of<MyProvider>(context, listen: false).toggleSpinner();
          provider.submit(provider.formKeyLogin);
          final result = await Auth.auth.loginUsingEmailAndPassword(
              email: provider.email, password: provider.password);
          String userId = await Auth.auth.getUserId();
          print('userId login = $userId');
          print('result login = $result');

          if (userId.isNotEmpty) {
            //Admin
            if (userId == 'tHGHQx5g9QVBtgWlcR51Lc3aAYw1') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminOrderScreen(),
                ),
              );
            } else {
              //users
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectDrinkScreen(),
                ),
              );
            }
          } else {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Color(0xFFF0F0EC),
                content: Text(
                  'This username is not already used.\nOr not connected to the network',
                  style: GoogleFonts.sourceSansPro(
                      color: Color(0xFFFF0800), fontSize:ScreenUtil().setSp(18)),
                ),
              ),
            );
          }
          Provider.of<MyProvider>(context, listen: false).toggleSpinner();
        } catch (e) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Color(0xFFF0F0EC),
              content: Text(
                'This username is not already used.\nTry another username',
                style: TextStyle(color: Color(0xFF111328), fontSize: ScreenUtil().setSp(18)),
              ),
            ),
          );
          Provider.of<MyProvider>(context, listen: false).toggleSpinner();
        }
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

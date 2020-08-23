import 'package:coffe/auth.dart';
import 'package:coffe/provider/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:coffe/ui/selectDrink/screen/selectDrinkScreen.dart';
import 'package:coffe/constant.dart';

class RegisterButton extends StatelessWidget {
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
        try{
          Provider.of<MyProvider>(context,listen: false).toggleSpinner();
          provider.submit(provider.formKeyRegister);
          final result = await Auth.auth.registerUsingEmailAndPassword(
              email: provider.email, password: provider.password);
          print(result == null ? 'invaled' : result);
          result == null
              ? Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Color(0xFFF0F0EC),
              content: Text(
                'That username is taken.\nOr not connected to the network',
                style: GoogleFonts.sourceSansPro(
                    color: Color(0xFFFF0800), fontSize: ScreenUtil().setSp(18),
                ),
              ),
            ),
          )
              : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SelectDrinkScreen(),
            ),
          );
          Provider.of<MyProvider>(context,listen: false).toggleSpinner();

        }catch(e){print(e);}

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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class WelcomeBackText extends StatelessWidget {
 String title ;
 WelcomeBackText(this.title);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 360,height:692,allowFontScaling: true);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: ScreenUtil().setSp(32.0),
          color: Color(0xFF8C746A),
        ),
      ),
    );
  }
}

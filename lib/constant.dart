

import 'package:flutter/material.dart';

AppBar kAppBar(BuildContext context,String title,{List<Widget> actions}){
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: kPrimaryTextColor,
      ),
    ),
    backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
      ),
      color: kPrimaryTextColor,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: actions,
  );
}


Color kBackgroundColor = Color(0xFFFFFFFF);

Color kPrimaryColor = Color(0xFFB98068);

Color kPrimaryTextColor = Color(0xFF8C746A);

Color kSecondTextColor = Color(0xFFB98068);

Color kSecondColor = Color(0xFFC28E79);

Color kFacebookColor = Color(0xFF4277BC);
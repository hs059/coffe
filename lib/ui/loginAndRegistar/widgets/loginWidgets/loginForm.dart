

import 'package:coffe/provider/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import '../inputTextField.dart';

class LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context) ;
    ScreenUtil.init(context,width: 360,height:692,allowFontScaling: true);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Form(
        key: provider.formKeyLogin,
        child: Column(
          children: <Widget>[
            InputTextFormField(
              label: 'Email',
              validator:provider.validateEmail ,
              onSaved: provider.saveEmail,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(16),
            ),
            InputTextFormField(
              iconData: provider.iconData,
              label: 'Password',
              password: provider.toggleEye,
              validator:provider.validatePassword ,
              onSaved: provider.savePassword,
            ),
          ],
        ),
      ),
    );
  }
}

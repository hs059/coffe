

import 'package:coffe/provider/myProvider.dart';
import 'package:coffe/ui/loginAndRegistar/widgets/inputTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';


class RegisterForm extends StatelessWidget {

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
        key: provider.formKeyRegister,
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

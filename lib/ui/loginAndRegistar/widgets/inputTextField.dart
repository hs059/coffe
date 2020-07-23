import 'package:coffe/provider/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputTextFormField extends StatelessWidget {

  const InputTextFormField({
    Key key,
    this.label,
    this.password = false, this.validator, this.onSaved, this.iconData,
  }) ;

  final String label;
  final bool password;
  final Function validator;
  final Function onSaved;
  final IconData iconData ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator(value),
      onSaved: (newValue) => onSaved(newValue),
      obscureText: password,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        suffix: GestureDetector(child: Icon( iconData),
                    onTap: () {
          Provider.of<MyProvider>(context,listen: false).fmToggleEye();
        },
        )  ,

        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF8C746A),
              width: 2,
            )),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF8C746A),
              width: 2,
            )),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 0.5,
            )),
      ),
    );
  }
}
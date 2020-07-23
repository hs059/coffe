import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:string_validator/string_validator.dart';
import 'package:provider/provider.dart';
import 'package:coffe/constant.dart';

class MyProvider extends ChangeNotifier {
  String email;

  String password;
  Color color = Colors.white;
  int numCup = 0;
  int sugar = 0;
  int size = 0;


  int total=0;
  int totalPriceInUi=0;

  totalPrize(List<Map> value) {
    for(Map map in value){
      this.total +=( map['priceColumn']*map['numCupColumn']);
      notifyListeners();
    }

  }
  getTotalPriceInUi(int value) {
    this.totalPriceInUi = value;
    notifyListeners();
  }







  IconData iconData = FontAwesomeIcons.eyeSlash;
  bool toggleEye = true;

  final formKeyLogin = GlobalKey<FormState>();
  final formKeyRegister = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  saveEmail(String value) {
    this.email = value;
    notifyListeners();
  }

  savePassword(String value) {
    this.password = value;
    notifyListeners();
  }

  validateEmail(String value) {
    if (value == null || value == '') {
      return ' this field is required ';
    } else if (!isEmail(value)) {
      return 'invalid Email ';
    }
  }

  validatePassword(String value) {
    if (value == null || value == '') {
      return ' this field is required ';
    } else if (!isAlphanumeric(value)) {
      return 'invalid Name ';
    }
  }

  submit(GlobalKey<FormState> globalKey) {
    if (globalKey.currentState.validate()) {
      globalKey.currentState.save();

      notifyListeners();
    } else {
      notifyListeners();
      return;
    }
  }

  getNumCup(int value) {
    this.numCup = value;
    notifyListeners();
  }


  addNum() {
    numCup++;
    notifyListeners();
  }

  subNum() {
    numCup--;
    notifyListeners();
  }

  selectNumSize({int num}) {
    size = num;
    notifyListeners();
  }
  selectNumSugar({int num}) {
    sugar = num;
    notifyListeners();
  }

  fmToggleEye() {
    toggleEye = !toggleEye;
    iconData = toggleEye ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye;
    notifyListeners();
  }
}

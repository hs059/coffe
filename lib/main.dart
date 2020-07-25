import 'package:coffe/auth.dart';
import 'package:coffe/provider/db_provider.dart';
import 'package:coffe/provider/myProvider.dart';
import 'package:coffe/provider/order_provider.dart';
import 'package:coffe/ui/admin/adminOrderScreen.dart';
import 'package:coffe/ui/home/homeScreen.dart';
import 'package:coffe/ui/selectDrink/screen/selectDrinkScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/splash/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool check = await Auth.auth.getIsLogin();
 String userId = await Auth.auth.getUserId() ;
  Widget screen ;


  if(userId=='tHGHQx5g9QVBtgWlcR51Lc3aAYw1'){
   screen = AdminOrderScreen();
 }else{
    if (check == null || check == false) {
      screen = HomeScreen();
    } else {
      screen = SelectDrinkScreen();
    }
  }


  runApp(MyApp(screen));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget screen;

  MyApp(this.screen);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyProvider>(
          create: (context) => MyProvider(),
        ),
        ChangeNotifierProvider<DBProvider>(
          create: (context) => DBProvider(),
        ),
        ChangeNotifierProvider<OrderProvider>(
          create: (context) => OrderProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splash(  screen ),
      ),
    );
  }
}

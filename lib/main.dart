import 'package:coffe/auth.dart';
import 'package:coffe/provider/adminProvider.dart';
import 'package:coffe/provider/db_provider.dart';
import 'package:coffe/provider/myProvider.dart';
import 'package:coffe/provider/order_provider.dart';
import 'package:coffe/ui/admin/adminOrderScreen.dart';
import 'package:coffe/ui/home/homeScreen.dart';
import 'package:coffe/ui/selectDrink/screen/selectDrinkScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';


import 'ui/admin/homeScreenAdmin.dart';
import 'ui/splash/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool check = await Auth.auth.getIsLogin();
  String userId = await Auth.auth.getUserId();
  Widget screen;

  if (userId == 'tHGHQx5g9QVBtgWlcR51Lc3aAYw1') {
    screen = HomeAdmin();
    print('Admin');
  } else {
    if (check == null || check == false) {
      screen = HomeScreen();
    } else {
      screen = SelectDrinkScreen();
    }
  }

  runApp(MyApp(screen));
}

class MyApp extends StatelessWidget {

  Widget screen;

  MyApp(this.screen);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
//        AdminProductProvider
        ChangeNotifierProvider<MyProvider>(
          create: (context) => MyProvider(),
        ),
        ChangeNotifierProvider<DBProvider>(
          create: (context) => DBProvider(),
        ),
        ChangeNotifierProvider<OrderProvider>(
          create: (context) => OrderProvider(),
        ),
        ChangeNotifierProvider<AdminProductProvider>(
          create: (context) => AdminProductProvider(),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          ScreenUtil.init(context,
              width: 360, height: 692, allowFontScaling: true);
          return Splash(screen);
        }),
      ),
    );
  }
}

import 'package:coffe/ui/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget {
 final  Widget screen;

  Splash(this.screen);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    var delay = Duration(seconds: 3);
    Future.delayed(delay, () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return widget.screen;
        },
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF8E8D4),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'images/bg.png',
            ),
          ),
        ),
        child: Center(child: SvgPicture.asset('images/logo.svg')),
      ),
    );
  }
}

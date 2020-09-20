
import 'package:coffe/auth.dart';
import 'package:coffe/constant.dart';
import 'package:coffe/ui/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'addDrink.dart';
import 'adminOrderScreen.dart';
import 'widgets/viewImage.dart';

class HomeAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Flutter coffee',
            style: GoogleFonts.pacifico(
              color: kPrimaryColor,
              fontSize: ScreenUtil().setSp(25),
              fontWeight: FontWeight.w200,
            ),
          ),
          backgroundColor: Colors.transparent,
          leading: RotatedBox(
            quarterTurns: 2,
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.signOutAlt,
              ),
              color: kPrimaryTextColor,
              onPressed: () async {
                Auth.auth.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
            ),
          ),
        ),
        body: TabBarView(children: [
          AdminOrderScreen(),
          AddDrink(),
          Container(color: Colors.green,),
        ]),
        bottomNavigationBar:  Container(
          color: Color(0xFFF0F0EC),
          child: TabBar(
            tabs: [
              Tab(
                icon:  Icon(
                  FontAwesomeIcons.list,
                  color: Color(0xFFC28E79),
                ),
              ),
              Tab(
                icon:  Icon(
                  FontAwesomeIcons.plus,
                  color: Color(0xFFC28E79),
                ),
              ),
              Tab(
                icon:  Icon(
                  FontAwesomeIcons.listAlt,
                  color: Color(0xFFC28E79),
                ),
              )
            ],
            labelColor: kPrimaryColor,
            unselectedLabelColor: kPrimaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: kPrimaryColor,

          ),
        ),
      ),

    );
  }
}

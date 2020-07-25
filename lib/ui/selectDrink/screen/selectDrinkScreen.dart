import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/auth.dart';
import 'package:coffe/constant.dart';
import 'package:coffe/provider/order_provider.dart';
import 'package:coffe/repositories/orderClient.dart';
import 'package:coffe/ui/home/homeScreen.dart';
import 'package:coffe/ui/selectDrink/screen/map.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'about.dart';
import 'allOrderScreen.dart';
import 'myCard.dart';
import 'productSection.dart';

class SelectDrinkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Flutter coffee',
            style: GoogleFonts.pacifico(
              color: kPrimaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w200,
            ),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.signOutAlt,
            ),
            color: kPrimaryTextColor,
            onPressed: ()async {
//              await Provider.of<OrderProvider>(context,listen: false).deleteAllOrder() ;
              Auth.auth.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.listAlt,
                color: Color(0xFFC28E79),
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyCard()),
                );
              },
            ),
          ],
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            AllOrderScreen(),
             MyMap(),
//            Container(
//              width: double.infinity,
//              decoration: BoxDecoration(
//                color: Color(0xFFF8E8D4),
//                image: DecorationImage(
//                  fit: BoxFit.cover,
//                  image: AssetImage(
//                    'images/cooo.png',
//                  ),
//                ),
//              ),
//            ),
            ProductSection(),
            About(),
          ],
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar:  Container(
          color: Color(0xFFF0F0EC),
          child: TabBar(
            tabs: [
              Tab(
                icon:  Icon(
                  FontAwesomeIcons.clipboardList,
                  color: Color(0xFFC28E79),
                ),
              ),
              Tab(
                icon:  Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  color: Color(0xFFC28E79),
                ),
              ),
              Tab(
                icon:  Icon(
                  FontAwesomeIcons.coffee,
                  color: Color(0xFFC28E79),
                ),
              ),
              Tab(
                icon:  Icon(
                  FontAwesomeIcons.userAlt,
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

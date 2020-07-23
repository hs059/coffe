

import 'package:coffe/auth.dart';
import 'package:coffe/constant.dart';
import 'package:coffe/ui/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'about.dart';
import 'myCard.dart';
import 'productSection.dart';

class SelectDrinkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
        length: 4,
        child: Scaffold(
          appBar:AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Menu',
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
      Auth.auth.signOut();
             Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.credit_card,
                  color: kPrimaryColor,
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
            children: [
              Container(
                color: Colors.orange,
              ),
               Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF8E8D4),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'images/cooo.png',

                    ),

                  ),
                ),
              ),
               ProductSection(),

              About(),
            ],
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: new TabBar(

            tabs: [
              Tab(
                icon: new Icon(FontAwesomeIcons.home,color: Color(0xFFC28E79),),

              ),
              Tab(
                icon: new Icon(FontAwesomeIcons.mapMarkerAlt,color: Color(0xFFC28E79),),
              ),
              Tab(
                icon: new Icon(FontAwesomeIcons.coffee,color: Color(0xFFC28E79),),
              ),
              Tab(
                icon: new Icon(FontAwesomeIcons.user,color: Color(0xFFC28E79),),
              )
            ],
            labelColor:kPrimaryColor,
            unselectedLabelColor: kPrimaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: kPrimaryColor,
          ),

        ),
      );
  }
}

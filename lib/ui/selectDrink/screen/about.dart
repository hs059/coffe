import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 360,height:692,allowFontScaling: true);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF8E8D4),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'images/bg.png',

          ),

        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/artwork.png'),
          ),
          Text(
            'Hussein .J',
            style: GoogleFonts.pacifico(
              fontSize: ScreenUtil().setSp(40),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'FLUTTER DEVELOPER',
            style: GoogleFonts.sourceSansPro(
              color: Colors.teal.shade100,
              fontSize: ScreenUtil().setSp(20.0),
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
            width: ScreenUtil().setWidth(150),
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '+970595271311',
                  style: GoogleFonts.sourceSansPro(
                    color: Colors.teal.shade900,
                    fontSize: ScreenUtil().setSp(20.0),
                  ),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  'i.7seen1997@email.com',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: ScreenUtil().setSp(20.0),
                    color: Colors.teal.shade900,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'FLUTTER DEVELOPER',
            style: GoogleFonts.sourceSansPro(
              color: Colors.teal.shade100,
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
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
                    fontSize: 20.0,
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
                    fontSize: 20.0,
                    color: Colors.teal.shade900,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

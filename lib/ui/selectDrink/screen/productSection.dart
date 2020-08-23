
import 'package:coffe/constant.dart';
import 'package:coffe/models/productsSQL.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

 import 'CustomizeDrink.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSection extends StatefulWidget {


  @override
  _ProductSectionState createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 360,height:692,allowFontScaling: true);
    return  Container(
      decoration: BoxDecoration(
        color: Color(0xFFF0F0EC),
//        color: Color(0xFFF8E8D4),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'images/bg.png',
          ),
        ),
      ),
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white30,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                ),
              ),
              child: ListTile(
                leading: Hero(
                  tag: '${products[index].image}',
                  child: Image.asset(
                    products[index].image,
                    width: 50.w ,
                  ),
                ),
                title: Text(
                  products[index].typeCoffee,

                  style: GoogleFonts.sourceSansPro(
                    color: kPrimaryColor,
                    fontSize: 20.ssp,
                  ),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomizeDrink(
                                  productA: products[index],
                                )),
                      );
                    }),
              ),
            );
          },
        ),
    );
  }
}

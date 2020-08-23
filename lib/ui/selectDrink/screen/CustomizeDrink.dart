import 'package:coffe/constant.dart';
import 'package:coffe/models/productsSQL.dart';
import 'package:coffe/provider/db_provider.dart';
import 'package:coffe/provider/myProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'myCard.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'selectDrinkScreen.dart';


class CustomizeDrink extends StatefulWidget {
  final Product productA;

  CustomizeDrink({this.productA});

  @override
  _CustomizeDrinkState createState() => _CustomizeDrinkState();
}

class _CustomizeDrinkState extends State<CustomizeDrink> {
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    DBProvider cardProvider = Provider.of<DBProvider>(context);
    ScreenUtil.init(context,width: 360,height:692,allowFontScaling: true);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Customize Drink',
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
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.listAlt,
              color: kPrimaryColor,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCard()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(200),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/header.png')),
            ),
            child: Center(
              child: Hero(
                tag: '${widget.productA.image}',
                child: Image.asset(
                  widget.productA.image,
                  height: ScreenUtil().setHeight(120),
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Container(

            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.productA.typeCoffee,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(18),
                        color: kSecondTextColor,
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Text(
                      '${widget.productA.price}\$',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(18),
                        color: Colors.brown[300],
                      ),
                    ),
                  ],
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text(
                      '${provider.numCup < 0 ? 0 : provider.numCup}',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        color: kSecondTextColor,
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    GestureDetector(
                      onTap: () {
                        provider.numCup < 0
                            ? provider.numCup = 0
                            : Provider.of<MyProvider>(context, listen: false)
                                .addNum();
                      },
                      child: Container(
                        height: ScreenUtil().setHeight(30),
                        width: ScreenUtil().setWidth(30),
                        decoration: BoxDecoration(
                          color: kSecondColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.grey[100],
                        ),
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(5)),
                    GestureDetector(
                      onTap: () {
                       Provider.of<MyProvider>(context, listen: false)
                                .subNum();
                        provider.numCup <= 0?provider.numCup = 0:provider.numCup;
                      },
                      child: Container(
                        height: ScreenUtil().setHeight(30),
                        width: ScreenUtil().setWidth(30),
                        decoration: BoxDecoration(
                          color: kSecondColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: Colors.grey[100],
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
          Container(
            //color: Colors.deepOrange,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Size',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(18),
                    color: kSecondTextColor,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: Provider.of<MyProvider>(context,
                                              listen: false)
                                          .size ==
                                      1
                                  ? kPrimaryColor
                                  : Colors.white)),
                      child: IconButton(
                          icon: Icon(
                            Icons.free_breakfast,
                            color: kSecondColor,
                          ),
                          onPressed: () {
                            Provider.of<MyProvider>(context, listen: false)
                                .selectNumSize(num: 1);
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: Provider.of<MyProvider>(context,
                                              listen: false)
                                          .size ==
                                      2
                                  ? kPrimaryColor
                                  : Colors.white)),
                      child: IconButton(
                          icon: Icon(
                            Icons.free_breakfast,
                            color: kSecondTextColor,
                            size: 30,
                          ),
                          onPressed: () {
                            Provider.of<MyProvider>(context, listen: false)
                                .selectNumSize(num: 2);
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: Provider.of<MyProvider>(context,
                                              listen: false)
                                          .size ==
                                      3
                                  ? kPrimaryColor
                                  : Colors.white)),
                      child: IconButton(
                          icon: Icon(
                            Icons.free_breakfast,
                            color: kPrimaryColor,
                            size: 40,
                          ),
                          onPressed: () {
                            Provider.of<MyProvider>(context, listen: false)
                                .selectNumSize(num: 3);
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(

            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Sugar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(18),
                        color: kSecondTextColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: Provider.of<MyProvider>(context,
                                              listen: false)
                                          .sugar ==
                                      1
                                  ? kPrimaryColor
                                  : Colors.white)),
                      child: IconButton(
                        icon: Icon(
                          Icons.clear,
                          size: 20,
                          color: kSecondColor,
                        ),
                        onPressed: () {
                          Provider.of<MyProvider>(context, listen: false)
                              .selectNumSugar(num: 1);
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: Provider.of<MyProvider>(context,
                                              listen: false)
                                          .sugar ==
                                      2
                                  ? kPrimaryColor
                                  : Colors.white)),
                      child: IconButton(
                          icon: Icon(
                            Icons.crop_square,
                            size: 30,
                            color: kSecondTextColor,
                          ),
                          onPressed: () {
                            Provider.of<MyProvider>(context, listen: false)
                                .selectNumSugar(num: 2);
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: Provider.of<MyProvider>(context,
                                              listen: false)
                                          .sugar ==
                                      3
                                  ? kPrimaryColor
                                  : Colors.white)),
                      child: IconButton(
                          icon: Icon(
                            Icons.crop_square,
                            size: 40,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            Provider.of<MyProvider>(context, listen: false)
                                .selectNumSugar(num: 3);
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'TOTAL',
                  style: TextStyle(
                    color: kSecondTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(18),
                  ),
                ),
                Text(
                  '${widget.productA.price * Provider.of<MyProvider>(context).numCup}\$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(20),
                    color: kSecondTextColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(20)),
          FlatButton(
            onPressed: () {
              try {
                Product p = Product(
                  numCup: provider.numCup,
                  price: widget.productA.price,
                  sugar: provider.sugar,
                  typeCoffee: widget.productA.typeCoffee,
                  size: provider.size,
                  image: widget.productA.image,
                );
                Provider.of<DBProvider>(context, listen: false)
                    .insertNewProduct(p);

                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.SUCCES,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Accept the request',
                  desc: 'Your request has been added',
                  btnOkOnPress: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                      builder: (context) => SelectDrinkScreen(),
                    ), (route) => false);

                  },
                )..show();

              } catch (error) {
                print(error);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(18),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
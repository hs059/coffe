import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coffe/auth.dart';
import 'package:coffe/models/order.dart';
import 'package:coffe/provider/myProvider.dart';
import 'package:coffe/provider/order_provider.dart';
import 'package:coffe/ui/selectDrink/screen/selectDrinkScreen.dart';
import 'package:flutter/material.dart';
import 'package:coffe/provider/db_provider.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:coffe/models/productsSQL.dart';
import 'package:coffe/constant.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyCard extends StatelessWidget {
  String userId;

  @override
  Widget build(BuildContext context) {
    DBProvider dbProvider = Provider.of<DBProvider>(context, listen: false);
    MyProvider myProvider = Provider.of<MyProvider>(context, listen: false);
    OrderProvider orderProvider =
        Provider.of<OrderProvider>(context, listen: false);
    ScreenUtil.init(context,width: 360,height:692,allowFontScaling: true);

    return Scaffold(
      backgroundColor: Color(0xFFF0F0EC),
      appBar: kAppBar(
        context,
        'Card',
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.grey,
              size: 35,
            ),
            onPressed: () {
              dbProvider.deleteAllProduct();
            },
          ),
        ],
      ),
      body: Consumer<DBProvider>(
        builder: (context, value, child) {
          List<Product> allProducts = value.allProducts.where((element) => element.userId == Auth.userIdMajor ).toList();
          return Column(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: ListView.builder(
                  itemCount: allProducts.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      actions: <Widget>[
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            dbProvider.deleteProduct(allProducts[index]);
                          },
                        ),
                      ],
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Add again',
                          color: Colors.blue,
                          icon:FontAwesomeIcons.plusCircle,
                          onTap: () {
                            dbProvider.insertNewProduct(allProducts[index]);
                          },
                        ),
                      ],
                      child: ExpansionTile(
                        backgroundColor: Color(0xFFF8E8D4),
                        title: Text(
                          allProducts[index].typeCoffee,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: ScreenUtil().setSp(20),
                          ),
                        ),
                        children: <Widget>[
                          Center(
                            child: Text(
                              '${allProducts[index].typeCoffee}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(25),
                                color: kSecondTextColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height:ScreenUtil().setHeight(5),
                          ),
                          Hero(
                            child: Image.asset(
                              allProducts[index].image,
                              height: ScreenUtil().setHeight(40),
                            ),
                            tag: '${allProducts[index].image}',
                          ),
                          Divider(
                            color: kPrimaryColor,
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
                                      'Price',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(18),
                                        color: kSecondTextColor,
                                      ),
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(5)),
                                    Text(
                                      '${allProducts[index].price}\$',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(18),
                                        color: Colors.brown[300],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '${allProducts[index].numCup}',
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(20),
                                        color: Colors.brown[300],
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Cups',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(18),
                                        color: kSecondTextColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: kPrimaryColor,
                          ),
                          Container(
                            //color: Colors.deepOrange,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Size',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(20),
                                    color: kSecondTextColor,
                                  ),
                                ),
                                Text(
                                  allProducts[index].size == 1
                                      ? 'Small'
                                      : allProducts[index].size == 2
                                          ? 'Middle '
                                          : 'Large',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(18),
                                    color: kSecondTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: kPrimaryColor,
                          ),
                          Container(

                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Sugar',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(20),
                                        color: kSecondTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  allProducts[index].sugar == 1
                                      ? 'Sugarless'
                                      : allProducts[index].sugar == 2
                                          ? 'Sugar cube '
                                          : '2 Sugar cubes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(18),
                                    color: kSecondTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: kPrimaryColor,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
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
                                  '${allProducts[index].price * allProducts[index].numCup}\$',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(20),
                                    color: kPrimaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () async {
                    userId = await Auth.auth.getUserId();

                    await orderProvider.setAllProductsMap();
                    List<Map<String, dynamic>> all =
                        orderProvider.allProductsMap;
                    myProvider.totalPrize(all);
                    myProvider.getTotalPriceInUi(myProvider.total);
                    DateTime orderTime = DateTime.now();

                    Order order = Order(
                      drinks: all,
                      totalNumber: all.length.toString(),
                      totalPrice: myProvider.total.toString(),
                      date: '${orderTime.hour}:${orderTime.minute}',
                      userId: userId,
                    );

                    orderProvider.addNewOrder(order);
                    myProvider.total = 0;

                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.SUCCES,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Your request has been sent',
                      desc: 'total= ${myProvider.totalPriceInUi}\$',
                      btnOkOnPress: () {
                        dbProvider.deleteAllProduct();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                          builder: (context) => SelectDrinkScreen(),
                        ), (route) => false);
                      },
                    )..show();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Text(
                      'Send the request',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:ScreenUtil().setSp(18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
 
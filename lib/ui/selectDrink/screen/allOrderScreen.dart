import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/constant.dart';
import 'package:coffe/models/order.dart';
import 'package:coffe/provider/myProvider.dart';
import 'package:coffe/provider/order_provider.dart';
import 'package:coffe/repositories/orderClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    ScreenUtil.init(context,width: 360,height:692,allowFontScaling: true);
    return FutureBuilder<List<Order>>(
      future: Provider.of<OrderProvider>(context).getAllOrder(),
      builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
        if (snapshot.hasData) {
          List<Order> orders = snapshot.data;
          if (orders.length > 0) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF0F0EC),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'images/bg.png',
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          actions: <Widget>[
                            Visibility(
                              visible:orders[index].status=='Done',
                              child: IconSlideAction(
                                caption: 'Delete',
                                color: Colors.red,
                                icon: Icons.delete,
                                onTap: () async {
                                  QuerySnapshot querySnapshot = await OrderClient
                                      .orderClient
                                      .getQuerySnapshotOrder();
                                  await orderProvider.deleteOrder(
                                      querySnapshot.documents[index].documentID);
                                },
                              ),
                            ),
                          ],
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Add again',
                              color: Colors.blue,
                              icon: FontAwesomeIcons.plusCircle,
                              onTap: () async {
                                await orderProvider
                                    .addNewOrder(orders[index]);
                                await orderProvider.getAllOrder();
                              },
                            ),
                          ],
                          child: ExpansionTile(
                            initiallyExpanded: Provider.of<MyProvider>(context)
                                    .selectExpansionTile ==
                                index,
                            backgroundColor: Color(0xFFF8E8D4),
                            onExpansionChanged: (value) {
                              if (value) {
                                Provider.of<MyProvider>(context, listen: false)
                                    .toggleSelectExpansionTile(index);
                              } else {
                                Provider.of<MyProvider>(context, listen: false)
                                    .toggleSelectExpansionTile(-2);
                              }
                            },
                            title: Text(
                              'Order ${index + 1}',
                              style: GoogleFonts.roboto(
                                color: kPrimaryColor,
                                fontSize: ScreenUtil().setSp(20),
                              ),
                            ),
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'Order${index + 1}',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(25),
                                    color: kSecondTextColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Divider(
                                  color: kPrimaryColor,
                                ),
                                width: ScreenUtil().setWidth(100),
                              ),
                              Container(
                                child: ListTile(
                                  title: Text(
                                    'Drinks',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(20),
                                      color: kSecondTextColor,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.mugHot,
                                      size: 30,
                                      color: kPrimaryColor,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: Color(0xFFF0F0EC),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            title: Text(
                                              'Drinks',
                                              style: GoogleFonts.sourceSansPro(
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(20),
                                                color: kSecondTextColor,
                                              ),
                                            ),
                                            content: Container(
                                              height: ScreenUtil().setHeight(100),
                                              child: ListView.builder(
                                                itemCount: orders[index]
                                                    .drinks
                                                    .length,
                                                itemBuilder: (context, index2) {
                                                  return Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(
                                                          '${orders[index].drinks[index2]['typeCoffee']}',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: ScreenUtil().setSp(20),
                                                            color:
                                                                kSecondTextColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${orders[index].drinks[index2]['numCupColumn']} Cups',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: ScreenUtil().setSp(18),
                                                            color:
                                                                kSecondTextColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(5),
                              ),
                              SizedBox(
                                child: Divider(
                                  color: kPrimaryColor,
                                ),
                                width: ScreenUtil().setWidth(320),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Number of Drinks',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(20),
                                        color: kSecondTextColor,
                                      ),
                                    ),
                                    SizedBox(width: ScreenUtil().setWidth(5)),
                                    Text(
                                      '${orders[index].totalNumber} Cups',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(18),
                                        color: kPrimaryTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Divider(
                                  color: kPrimaryColor,
                                ),
                                width: ScreenUtil().setWidth(320),
                              ),
                              Container(
                                //color: Colors.deepOrange,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(20),
                                        color: kSecondTextColor,
                                      ),
                                    ),
                                    Text(
                                      orders[index].status,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(18),
                                        color: kPrimaryTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Divider(
                                  color: kPrimaryColor,
                                ),
                                width: ScreenUtil().setWidth(320),
                              ),
                              Container(

                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Request time',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(20),
                                        color: kSecondTextColor,
                                      ),
                                    ),
                                    Text(
                                      '${orders[index].date}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(20),
                                        color: kPrimaryTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Divider(
                                  color: kPrimaryColor,
                                ),
                                width: ScreenUtil().setWidth(320),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      '${orders[index].totalPrice}\$',
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
                ],
              ),
            );
          } else {
            return Center(
              child: Text('No Order',
                style: GoogleFonts.sourceSansPro(
                color: kPrimaryColor,
                fontSize: ScreenUtil().setSp(20),
              ),),
            );
          }
        } else {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF0F0EC),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'images/bg.png',
                ),
              ),
            ),
            child: Center(
              child:Image(image: AssetImage('images/az.gif')),
            ),
          );
        }
      },
    );
  }
}

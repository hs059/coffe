import 'package:coffe/auth.dart';
import 'package:coffe/constant.dart';
import 'package:coffe/models/order.dart';
import 'package:coffe/provider/myProvider.dart';
import 'package:coffe/provider/order_provider.dart';
import 'file:///E:/Programming/Dart/Login/13thDay/coffe/lib/ui/admin/widgets/drinks.dart';
import 'package:coffe/ui/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    ScreenUtil.init(context,width: 360,height:692,allowFontScaling: true);

    return FutureBuilder<List<Order>>(
      future: Provider.of<OrderProvider>(context).getAllOrderAdmin(),
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
                                  await orderProvider.deleteOrder(orders[index].docId);
                                },
                              ),
                            ),
                          ],
                          child: ExpansionTile(
                            initiallyExpanded:
                            Provider.of<MyProvider>(context)
                                .selectExpansionTile ==
                                index,
                            backgroundColor: Color(0xFFF8E8D4),
                            onExpansionChanged: (value) {
                              if (value) {
                                Provider.of<MyProvider>(context,
                                    listen: false)
                                    .toggleSelectExpansionTile(index);
                              } else {
                                Provider.of<MyProvider>(context,
                                    listen: false)
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
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return Drinks(order: orders[index],);
                                          },)
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
                                    DropdownButton(
                                      value: orders[index].status,
//                                        value: 'processing',
                                      items: <DropdownMenuItem>[
                                        DropdownMenuItem(
                                          child: Text('Done'),
                                          value: 'Done',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('processing'),
                                          value: 'processing',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('reject'),
                                          value: 'reject',
                                        ),
                                      ],
                                      onChanged: (value) async {
//
                                        Provider.of<MyProvider>(context,
                                            listen: false)
                                            .changeSelcted(value);
                                        orders[index].status = Provider.of<MyProvider>(
                                            context,
                                            listen: false)
                                            .selected;
                                        Order order = Order(
                                            totalPrice:orders[index].totalPrice,
                                            totalNumber:orders[index].totalNumber,
                                            date: orders[index].date,
                                            status: orders[index].status,
                                            drinks: orders[index].drinks,
                                            userId: orders[index].userId);

                                        Provider.of<OrderProvider>(context,listen: false)
                                            .updateField(
                                            order, orders[index].docId);
                                      },
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
                                //height: 100,
                                //color: Colors.cyanAccent,
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
              child: Text(
                'No Order',
                style: GoogleFonts.sourceSansPro(
                  color: kPrimaryColor,
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
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

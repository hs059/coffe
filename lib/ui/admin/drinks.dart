import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coffe/auth.dart';
import 'package:coffe/models/order.dart';
import 'package:coffe/provider/myProvider.dart';
import 'package:coffe/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:coffe/provider/db_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:coffe/models/products.dart';
import 'package:coffe/constant.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Drinks extends StatelessWidget {
final Order order;
Drinks({ this.order});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0EC),
      appBar: kAppBar(
        context,
        'Card',
      ),
      body:
      Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: ListView.builder(
              itemCount: order.drinks.length,
              itemBuilder: (context, index2) {
                return ExpansionTile(
                  backgroundColor: Color(0xFFF8E8D4),
                  title: Text(
                    order.drinks[index2]['typeCoffee'],
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                    ),
                  ),
                  children: <Widget>[
                    Center(
                      child: Text(
                        '${order.drinks[index2]['typeCoffee']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: kSecondTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: kPrimaryColor,
                    ),
                    Container(
                      //height: 100,
                      //color: Colors.cyanAccent,
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
                                  fontSize: 18,
                                  color: kSecondTextColor,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${order.drinks[index2]['priceColumn']}\$',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.brown[300],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '${order.drinks[index2]['numCupColumn']}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.brown[300],
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Cups',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
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
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Size',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: kSecondTextColor,
                            ),
                          ),
                          Text(
                            order.drinks[index2]['sizeColumn'] == 1
                                ? 'Small'
                                : order.drinks[index2]['sizeColumn'] == 2
                                    ? 'Middle '
                                    : 'Large',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
                      //height: 100,
                      //color: Colors.cyanAccent,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'Sugar',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kSecondTextColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            order.drinks[index2]['sugarColumn'] == 1
                                ? 'Sugarless'
                                : order.drinks[index2]['sugarColumn'] == 2
                                    ? 'Sugar cube '
                                    : '2 Sugar cubes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'TOTAL',
                            style: TextStyle(
                              color: kSecondTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${order.drinks[index2]['priceColumn'] * order.drinks[index2]['numCupColumn']}\$',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: kPrimaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

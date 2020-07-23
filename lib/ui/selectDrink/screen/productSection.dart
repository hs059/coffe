
import 'package:coffe/constant.dart';
import 'package:coffe/models/products.dart';
import 'package:flutter/material.dart';

 import 'CustomizeDrink.dart';

class ProductSection extends StatefulWidget {


  @override
  _ProductSectionState createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
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
              leading: Image.asset(
                products[index].image,
                width: 50,
              ),
              title: Text(
                products[index].typeCoffee,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
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
      );
  }
}

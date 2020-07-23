import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/models/order.dart';
import 'package:coffe/models/products.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'orderClient.dart';

class OrderRepository {
  OrderRepository._();

  static final OrderRepository orderRepository = OrderRepository._();
  Firestore firestore = Firestore.instance;

  addNewProduct(Order order) async {
    try {
     await OrderClient.orderClient.addNewProduct(order.toJson());
    } catch (e) {
      print(e);
    }
  }
}

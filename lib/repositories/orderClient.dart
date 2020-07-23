import 'package:cloud_firestore/cloud_firestore.dart';

class OrderClient {
  OrderClient._();

  static final OrderClient orderClient = OrderClient._();
  Firestore firestore = Firestore.instance;



  addNewProduct(Map<String, dynamic> map) async {
    try {
      await firestore.collection('orders').add(map);
    } catch (e) {
      print(e);
    }
  }
}

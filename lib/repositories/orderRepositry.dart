import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/models/order.dart';


import 'orderClient.dart';

class OrderRepository {
  OrderRepository._();

  static final OrderRepository orderRepository = OrderRepository._();
  Firestore firestore = Firestore.instance;

  addNewOrder(Order order) async {
    try {
     await OrderClient.orderClient.addNewOrder(order.toJson());
    } catch (e) {
      print(e);
    }
  }


  updateFieldOrder(Order order,String iD) async {
    try {
      await firestore.collection('orders').document(iD).updateData(order.toJson());
    } catch (e) {
      print(e);
    }
  }


  Future<List<Order>> getAllOrder()async{
    QuerySnapshot querySnapshot = await OrderClient.orderClient.getQuerySnapshotOrder();
    List<Order> allOrder =  querySnapshot.documents.map((e) => Order.fromJson(e)).toList();
  return allOrder;
  }
  Future<List<Order>> getAllOrderAdmin()async{
    QuerySnapshot querySnapshot = await OrderClient.orderClient.getQuerySnapshotOrderAdmin();
    List<Order> allOrder =  querySnapshot.documents.map((e) => Order.fromJson(e)).toList();
  return allOrder;
  }
}

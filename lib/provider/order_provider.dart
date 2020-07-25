import 'package:coffe/models/order.dart';
import 'package:coffe/repositories/db_repository.dart';
import 'package:coffe/repositories/orderClient.dart';
import 'package:coffe/repositories/orderRepositry.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {

  addNewOrder(Order order)async {
   await  OrderRepository.orderRepository.addNewOrder(order);
   notifyListeners();
  }

  List<Map<String, dynamic>> allProductsMap = [];
  List<Order> allOrder = [];

  setAllProductsMap() async {
    this.allProductsMap = await DBRepository.dbRepository.getAllProductMap();
    notifyListeners();
  }

  getAllOrder()async{
    this.allOrder = await OrderRepository.orderRepository.getAllOrder();
    notifyListeners();
  }
  deleteOrder(String iD)async{
    await OrderClient.orderClient.deleteOrder(iD);
    getAllOrder();

  }
  deleteAllOrder()async{
    await OrderClient.orderClient.deleteAllOrder();
    notifyListeners();
  }
}

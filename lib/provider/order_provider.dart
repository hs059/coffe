import 'package:coffe/models/order.dart';
import 'package:coffe/repositories/db_repository.dart';
import 'package:coffe/repositories/orderRepositry.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {

  addNewProduct(Order order)async {
   await  OrderRepository.orderRepository.addNewProduct(order);
   notifyListeners();
  }

  List<Map<String, dynamic>> allProductsMap = [];

  setAllProductsMap() async {
    this.allProductsMap = await DBRepository.dbRepository.getAllProductMap();
    notifyListeners();
  }
}

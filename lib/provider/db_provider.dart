 import 'package:coffe/models/products.dart';
import 'package:coffe/repositories/db_repository.dart';
import 'package:flutter/material.dart';


class DBProvider extends ChangeNotifier {


  List<Product> allProducts = [];
//  List<Map<String, dynamic>> allProductsMap = [];
//
//  setAllProductsMap() async {
//    this.allProductsMap = await DBRepository.dbRepository.getAllProductMap();
//    notifyListeners();
//  }
//

  setAllProducts() async {
    this.allProducts = await DBRepository.dbRepository.getAllProduct();
    notifyListeners();
  }

  insertNewProduct(Product product) async {
    await DBRepository.dbRepository.insertNewProduct(product);
    setAllProducts();
  }


  deleteProduct( Product product) async {
    await DBRepository.dbRepository.deleteProduct(product);
    setAllProducts();
  }

  deleteAllProduct() async {
    await DBRepository.dbRepository.deleteAllProduct();
    setAllProducts();
  }


}

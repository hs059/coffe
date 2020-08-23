 import 'package:coffe/models/productsSQL.dart';
import 'package:coffe/repositories/db_repository.dart';
import 'package:flutter/material.dart';


class DBProvider extends ChangeNotifier {


  List<Product> allProducts = [];

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

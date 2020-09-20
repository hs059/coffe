import 'dart:io';

import 'package:coffe/models/adminModel.dart';
import 'package:coffe/repositories/adminClient.dart';
import 'package:coffe/repositories/adminRepository.dart';
import 'package:flutter/material.dart';

class AdminProductProvider extends ChangeNotifier {
  List<AdminProductModel> allProducts = [];
  String typeCoffee;

  String imageUrl;
  File imageFile;
  String imageAsset ;
  int price;
  int index =0 ;


  setTypeCoffee(String value) {
    this.typeCoffee = value;
    notifyListeners();
  }
  setImageAsset(String value) {
    this.imageAsset = value;
    notifyListeners();
  }

  setPrice(int num) {
    this.price = num;
    notifyListeners();
  }

  uploadImage() async {
    String imageUrl =
        await AdminProductClient.adminClient.uploadImage(this.imageFile);
    this.imageUrl = imageUrl;
    notifyListeners();
  }

  addNewProduct() async {
    AdminProductModel adminProductModel = AdminProductModel(
      image: this.imageUrl??this.imageAsset,
      price: this.price,
      typeCoffee: this.typeCoffee,
    );
    String productId = await AdminProductClient.adminClient
        .addNewProductAdmin(adminProductModel);
    if (productId != null) {
      getAllProduct();
      return true;
    } else {
      return false;
    }
  }

  getAllProduct() async {
    List<AdminProductModel> allProducts =
        await AdminRepository.adminRepository.getAllProductAdmin();
    this.allProducts = allProducts;
    notifyListeners();
  }

  deleteProduct(String documentId) async {
    await AdminProductClient.adminClient.deleteProductFS(documentId);
    getAllProduct();
  }

  editProduct(AdminProductModel adminProductModel) async {
    await AdminProductClient.adminClient.editProductFS(adminProductModel);
    getAllProduct();
  }


  setPageIndex(int index){
    this.index = index ;
  }

  List<String> imagesList = [
    'images/Espresso.png',
    'images/Cappuccino.png',
    'images/macciato.png',
    'images/Mocha.png',
    'images/latte.png',
  ];
}
//TODO:'create list image to use in imageViewer'

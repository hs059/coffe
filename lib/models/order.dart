import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/models/products.dart';

class Order {
  List<Map<String, dynamic>> drinks;
  String docId;
  String userId;
  String totalPrice;
  String status;

  String totalNumber;
  String date;

  Order(
      {this.drinks,
      this.userId,
      this.totalPrice,
      this.totalNumber,
      this.status = 'processing',
      this.date});

  Order.fromJson(DocumentSnapshot documentSnapshot) {
    this.docId = documentSnapshot.documentID;
    this.userId = documentSnapshot.data['userId'];
    this.totalPrice = documentSnapshot.data['totalPrice'];
    this.totalNumber = documentSnapshot.data['totalNumber'];
    this.date = documentSnapshot.data['date'];
    this.status = documentSnapshot.data['status'];
    if (documentSnapshot.data['drinks'] != null) {
      drinks = List<Map<String, dynamic>>();
      documentSnapshot.data['drinks'].forEach((v) {
        drinks.add(Product.fromJson(v).toJson());
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'drinks': this.drinks,
      'userId': this.userId,
      'totalPrice': this.totalPrice,
      'totalNumber': this.totalNumber,
      'date': this.date,
      'status': this.status,
    };
  }
}

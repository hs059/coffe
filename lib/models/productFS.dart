import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/repositories/db_client.dart';

class ProductFS {
  String documentId;

  String image;
  String typeCoffee;
  int price;

  ProductFS({
    this.image,
    this.typeCoffee,
    this.price,

  });

  ProductFS.fromJson(DocumentSnapshot documentSnapshot) {
    this.documentId = documentSnapshot.documentID;
    this.typeCoffee =  documentSnapshot.data['typeCoffee'];
    this.price = int.parse(documentSnapshot.data['price']);
    this.image=documentSnapshot.data['image'];
  }

  Map<String , dynamic> toJson() {
    return {
      'typeCoffee': this.typeCoffee,
      'price': this.price,
      'image': this.image,
    };
  }
}




//final List<Product> products = [
//  Product(
//    image: 'images/Espresso.png',
//    typeCoffee: 'Espresso',
//    price: 2,
//  ),
//  Product(
//    image: 'images/Cappuccino.png',
//    typeCoffee: 'Cappuccino',
//    price: 2,
//  ),
//  Product(
//    image: 'images/macciato.png',
//    typeCoffee: 'macciato',
//    price: 4,
//  ),
//  Product(
//    image: 'images/Mocha.png',
//    typeCoffee: 'Mocha',
//    price: 3,
//  ),
//  Product(
//    image: 'images/latte.png',
//    typeCoffee: 'latte',
//    price: 4,
//  ),
//];

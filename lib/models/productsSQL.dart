import 'package:coffe/repositories/db_client.dart';

class Product {
  String image;
  String typeCoffee;
  int price;
  int numCup;
  int sugar;
  int size;
  int id;
  String userId;

  Product({
    this.image,
    this.typeCoffee,
    this.price,
    this.numCup,
    this.sugar,
    this.size,
    this.userId ,
  });

  Product.fromJson(Map<String, dynamic> map) {
    this.id = map[DBClient.dbClient.productIdColumn];
    this.typeCoffee = map[DBClient.dbClient.typeCoffeeColumn];
    this.price = map[DBClient.dbClient.priceColumn];
    this.numCup = map[DBClient.dbClient.numCupColumn];
    this.sugar = map[DBClient.dbClient.sugarColumn];
    this.size = map[DBClient.dbClient.sizeColumn];
    this.image=map[DBClient.dbClient.imageColumn];
    this.userId=map[DBClient.dbClient.userIdColumn];

  }

  Map<String , dynamic> toJson() {
    return {
      DBClient.dbClient.typeCoffeeColumn: this.typeCoffee,
      DBClient.dbClient.priceColumn: this.price,
      DBClient.dbClient.numCupColumn: this.numCup,
      DBClient.dbClient.sugarColumn: this.sugar,
      DBClient.dbClient.sizeColumn: this.size,
      DBClient.dbClient.imageColumn: this.image,
      DBClient.dbClient.userIdColumn:this.userId,
    };
  }
}

final List<Product> products = [
  Product(
    image: 'images/Espresso.png',
    typeCoffee: 'Espresso',
    price: 2,
  ),
  Product(
    image: 'images/Cappuccino.png',
    typeCoffee: 'Cappuccino',
    price: 2,
  ),
  Product(
    image: 'images/macciato.png',
    typeCoffee: 'macciato',
    price: 4,
  ),
  Product(
    image: 'images/Mocha.png',
    typeCoffee: 'Mocha',
    price: 3,
  ),
  Product(
    image: 'images/latte.png',
    typeCoffee: 'latte',
    price: 4,
  ),
];



class Order {
  List<Map<String, dynamic>> drinks;

  String userId;
  String totalPrice;
  String status;

  String totalNumber;

  Order({this.drinks, this.userId, this.totalPrice, this.totalNumber,this.status='processing'});

  Map<String, dynamic> toJson() {
    return {
      'drinks': this.drinks,
      'userId': this.userId,
      'totalPrice': this.totalPrice,
      'totalNumber': this.totalNumber
    };
  }
}

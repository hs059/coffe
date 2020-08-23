



import 'package:coffe/models/productsSQL.dart';

import 'db_client.dart';


class DBRepository{
  DBRepository._();
 static final DBRepository dbRepository = DBRepository._() ;
           insertNewProduct(Product product)async{
  await DBClient.dbClient.insertNewProduct(product.toJson());
}
Future<List<Product>> getAllProduct()async{
  List<Map<String, dynamic>> results = await DBClient.dbClient.getAllProduct();
  List<Product> products = results.map((e) => Product.fromJson(e)).toList();
  return products ;
}

Future<List<Map<String, dynamic>>> getAllProductMap()async{
  List<Map<String, dynamic>> results = await DBClient.dbClient.getAllProduct();
  return results ;
}

  Future<int> deleteProduct(Product product)async{
    int x= await DBClient.dbClient.deleteProduct(product.id);
    return x ;
  }
   deleteAllProduct()async{
    await DBClient.dbClient.deleteAllProduct();
  }


}

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class DBClient {
  DBClient._();

  static final DBClient dbClient = DBClient._();

  final String productTable = 'product';
  final String productIdColumn = 'productId';
  final String typeCoffeeColumn = 'typeCoffee';
  final String numCupColumn = 'numCupColumn';
  final String sugarColumn = 'sugarColumn';
  final String priceColumn = 'priceColumn';
  final String sizeColumn = 'sizeColumn';
  final String imageColumn = 'imageColumn';

  Database database;

  initDatabase() async {
    if (database == null) {
      database = await connectToDatabase();
      return database;
    } else {
      return database;
    }
  }

  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'productsDp.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''CREATE TABLE $productTable(
          $productIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
          $typeCoffeeColumn TEXT NOT NULL,
          $numCupColumn INTEGER NOT NULL,
          $sugarColumn INTEGER NOT NULL,
          $sizeColumn INTEGER NOT NULL,
          $priceColumn INTEGER NOT NULL,
          $imageColumn TEXT NOT NULL

      )''');
      },
    );
    return database;
  }

  Future<int> insertNewProduct(Map<String, dynamic> map) async {
    try {
      database = await initDatabase();
      int rowIndex = await database.insert(productTable, map);
      return rowIndex;
    } catch (error) {
      throw 'error is $error';
    }
  }

  Future<List<Map<String, dynamic>>> getAllProduct() async {
    try {
      database = await initDatabase();
      List<Map<String, dynamic>> results = await database.query(productTable);
      return results;
    } catch (error) {
      throw 'error is $error';
    }
  }

  Future<int> deleteProduct(int id) async {
    try {
      database = await initDatabase();
      int rows = await database
          .delete(productTable, where: '$productIdColumn = ?', whereArgs: [id]);
      return rows;
    } catch (error) {
      throw 'error is $error';
    }
  }

  Future<int> deleteAllProduct() async {
    try {
      database = await initDatabase();
      int rows = await database.delete(productTable);
      return rows;
    } catch (error) {
      throw 'error is $error';
    }
  }
}

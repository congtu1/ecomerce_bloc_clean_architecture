import 'dart:io';

import 'package:flutter_ecomerce_ui/data_layer/models/cart_item_lite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LocalCartProvider {
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "LocalDatabase.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE Carts(id INTEGER PRIMARY KEY AUTOINCREMENT,idProduct INTEGER,status INTEGER,)');
      },
    );
  }

  Future<void> newLiteCart(Map<String, String> item) async {
    final db = await database;
    await db!
        .insert("Carts", item, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartItemLite>> fectAllCartItem() async {
    final db = await database;
    var response = await db!.query(
      "Carts",
    );
    List<CartItemLite> list = response.isNotEmpty
        ? response.map((e) => CartItemLite.fromJson(e)).toList()
        : [];
    return list;
  }
}

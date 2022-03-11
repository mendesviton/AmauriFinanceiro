/*import 'package:amaurifinanceiro/pages/staticpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();
  static final DB instance = DB._();

  static Database? _database;

  //método para instanciar DB
  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async{
  
    return await openDatabase(
      (await getDatabasesPath(),'amaurifinanceiro.db'),
      version: 1,






                     




            
      );
  }
}*/

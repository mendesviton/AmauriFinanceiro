import 'package:flutter/material.dart';
import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:string_validator/string_validator.dart';

const String tbusuario = "TBUSUARIO";
const String bdcodigo = "BDCODIGO";
const String bdnome = "BDNOME";
const String bdemail = "BDEMAIL";
const String bdsenha = "BDSENHA";

// classe de transição para o banco

class DBdao {
  static final DBdao _instance = DBdao.internal();

  factory DBdao() => _instance;

  DBdao.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "amaurii.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE $tbusuario($bdcodigo integer primary key,$bdnome TEXT,$bdemail TEXT,$bdsenha TEXT)");
      // "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY,$nameColumn TEXT,$emailColumn TEXT,$foneColumn TEXT,$imgColumn TEXT)");
    });
  }

  Future<Usuario?> saveContact(Usuario contact) async {
    Database? dbContact = await db;
    contact.codigo = await dbContact!.insert(tbusuario, contact.toMap());
    return contact;
  }

  Future<Usuario?> getUser(int id) async {
    Database? dbAmauri = await db;
    List<Map> maps = await dbAmauri!.query(tbusuario,
        columns: [bdcodigo, bdnome, bdemail, bdsenha],
        where: "$bdcodigo = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Usuario.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteUser(int codigo) async {
    Database? dbAmauri = await db;
    return await dbAmauri!
        .delete(tbusuario, where: "$bdcodigo = ?", whereArgs: [codigo]);
  }

  Future<int> updateUser(Usuario usuario) async {
    Database? dbAmauri = await db;
    return await dbAmauri!.update(tbusuario, usuario.toMap(),
        where: "$bdcodigo = ?", whereArgs: [usuario.codigo]);
  }

  Future<bool> ValidaLoginAmauri(String email, String senha) async {
    Database? dbAmauri = await db;
    List<Map> maps = await dbAmauri!.query(tbusuario,
        columns: [bdcodigo, bdnome, bdemail, bdsenha],
        where: "$bdemail = ? and $bdsenha = ?",
        whereArgs: [email, senha]);
    // List<Map> maps = await dbAmauri!.rawQuery(
    // "select * from TBUSUARIO where BDEMAIL LIKE UPPER('%$email')");
    if (maps.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> getUsuarioSecao(int codigo) async {
    Database? dbAmauri = await db;
    List<Map> maps = await dbAmauri!.query(tbusuario,
        columns: [bdcodigo, bdnome, bdemail, bdsenha],
        where: "$bdcodigo = ?",
        whereArgs: [codigo]);

    if (maps.length > 0) {
      return Usuario.fromMap(maps.first).nome;
    } else {
      return null;
    }
  }

  Future<List> getAllUsers() async {
    Database? dbAmauri = await db;
    List listMap = await dbAmauri!.rawQuery("SELECT * FROM $tbusuario");
    List<Usuario> listContact = [];
    for (Map m in listMap) {
      listContact.add(Usuario.fromMap(m));
    }
    return listContact;
  }

  Future<int?> getNumber() async {
    Database? dbAmauri = await db;
    return Sqflite.firstIntValue(
        await dbAmauri!.rawQuery("SELECT COUNT (*) FROM $tbusuario"));
  }

  Future close() async {
    Database? dbContact = await db;
    dbContact!.close();
  }
}

class Usuario {
  // atributo dos contatos
  late int codigo;
  late String nome;
  late String email;
  late String senha;

  Usuario();

  Usuario.fromMap(Map map) {
    codigo = map[bdcodigo];
    nome = map[bdnome];
    email = map[bdemail];
    senha = map[bdsenha];
  }

  toMap() {
    Map<String, dynamic> map = {
      bdcodigo: codigo,
      bdnome: nome,
      bdemail: email,
      bdsenha: senha,
    };
    if (codigo != null) {
      map[bdcodigo] = codigo;
    }
    return map;
  }

  @override
  String toString() {
    return "Contact(codigo: $codigo, nome: $nome, email:$email,senha:$senha";
  }
}

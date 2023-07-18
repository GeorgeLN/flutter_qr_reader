import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';

class DBProvider {
  //Estructura de un Singelton.
  static Future<Database>? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    //Path donde almacenaremos la Base de Datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db'); //Permite unir pedazos de Paths

    //print(path);

    //Crear Base de Datos.
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
      },
    );
  }

  //CRUD [Create new Scan]... Manera maluca.
  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
     final id    = nuevoScan.id;
     final tipo  = nuevoScan.tipo;
     final valor = nuevoScan.valor;

    //Verificar la base de datos. 
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scans(id, tipo, valor)
      VALUES($id, '$tipo', '$valor')
    ''');

    return res;
  }

  //MANERA SENCILLA
  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    //ID del último registro insertado.
    return res;
  }
  
  //CRUD [Select for id]
  Future<ScanModel?> getScanById(int id) async {
    final db = await database;

    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty
      ? ScanModel.fromJson(res.first)
      : null;
  }

  //CRUD [Select all]
  Future<List<ScanModel>?> getTodosLosScans() async {
    final db = await database;

    final res = await db.query('Scans');

    return res.isNotEmpty
      ? res.map( (s) => ScanModel.fromJson(s) ).toList()
      : [];
  }

  //Manera difícil de realizar un procedimiento, en éste caso el proceso de consulta [SELECT].
  Future<List<ScanModel>?> getScansPorTipo(String tipo) async {
    final db = await database;

    final res = await db.rawQuery('''
      SELECT * FROM Scans
      WHERE tipo = '$tipo'
    ''');

    return res.isNotEmpty
      ? res.map( (s) => ScanModel.fromJson(s) ).toList()
      : [];
  }

  //CRUD [Update]
  Future<int> updateScan( ScanModel nuevoScan ) async {
    final db = await database;

    final res = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id]);

    return res;
  }

  //CRUD [Delete]
  Future<int> deleteScan( int id ) async {
    final db = await database;

    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);

    return res;
  }

  //CRUD [Delete all]
  Future<int> deleteAllScans() async {
    final db = await database;

    final res = await db.delete('Scans');

    return res;
  }
}
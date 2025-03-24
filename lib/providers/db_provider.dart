import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:practicas_flutter/models/scan_model.dart';
export 'package:practicas_flutter/models/scan_model.dart';

class DbProvider {
  static Database? _database;
  static final DbProvider db = DbProvider._();

  DbProvider._();

  get getDatabase async {
    if (_database != null){
      return _database;
    }
    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    // crear DB
    return await openDatabase(path, 
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        '''
        );
      },
    );
  }


  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;
    // verificar bd
    final db = await getDatabase;

    final res = await db.rawInsert(''' 
      INSERT INTO Scans(id, tipo, valor)
        VALUES($id, $tipo, $valor)
    ''');

    return res;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await getDatabase;
    final res = await db.insert('Scans', nuevoScan.toMap()); //_TypeError (type 'String' is not a subtype of type 'Map<String, Object?>' of 'values')
    print(res);
    return res;
  }

  Future<ScanModel?> getScanId(int id) async {
    final db = await getDatabase;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    //print(res);
    return res.isNotEmpty ? ScanModel.fromMap(res.first) : null;
  }

    Future<List<ScanModel>> getAllScans() async {
      final db = await getDatabase;
      final res = await db.query('Scans');
      return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList() : [];
  }

    getScansType(String tipo) async {
      print('aa');
      final db = await getDatabase;
      final res = await db.query('Scans', where: 'tipo = ?', whereArgs: [tipo]);

      return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList() : []; 
  }

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await getDatabase;
    final res = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await getDatabase;
    final res = await db.delete('Scans');
    return res;
  }

    Future<int> deleteScanId(int id) async {
    final db = await getDatabase;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }


}
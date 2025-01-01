
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:scanner/db_scanner/scanner_entity.dart';
import 'package:sqflite/sqflite.dart';

class DBScanner extends GetxService {
  late Database dbBase;

  Future<DBScanner> init() async {
    await createScannerDB();
    return this;
  }

  createScannerDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'scanner.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createScannerTable(db);
        });
  }

  createScannerTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS scanner (id INTEGER PRIMARY KEY, createdTime TEXT, type INTEGER, image BLOB, content TEXT)');
  }

  insertScanner(ScannerEntity entity) async {
    final id = await dbBase.insert('scanner', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'image': entity.image,
      'content': entity.content,
    });
    return id;
  }

  cleanScannerData() async {
    await dbBase.delete('scanner');
  }

  Future<List<ScannerEntity>> getScannerAllData() async {
    var result = await dbBase.query('scanner', orderBy: 'createdTime DESC');
    return result.map((e) => ScannerEntity.fromJson(e)).toList();
  }
}

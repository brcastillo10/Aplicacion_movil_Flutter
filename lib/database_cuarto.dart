import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseCuarto {
  static final DatabaseCuarto _instance = DatabaseCuarto._internal();
  factory DatabaseCuarto() => _instance;

  DatabaseCuarto._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'clientes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE clientes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            apellido TEXT,
            nombre TEXT,
            correo TEXT,
            telefono TEXT,
            sexo TEXT,
            estadoCivil TEXT
          )
          '''
        );
      },
    );
  }

  Future<void> insertCliente(Map<String, dynamic> cliente) async {
    final db = await database;
    await db.insert('clientes', cliente, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getAllClientes() async {
    final db = await database;
    return await db.query('clientes');
  }

  Future<void> deleteCliente(int id) async {
    final db = await database;
    await db.delete('clientes', where: 'id = ?', whereArgs: [id]);
  }
}

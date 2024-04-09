import 'package:sqflite/sqflite.dart';

//helper para la base de datos
class DBHelper {
  static Database? _database;
  static const String dbName = "lv.db";

  //iniciar la base de datos
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _dbInitialize();
    return _database;
  }

  //consultar la tabla entera en la base de datos
  Future<List<Map<String, dynamic>>> dbQuery(String table) async {
    Database? db = await database;
    var result = await db!.query(table);
    return result;
  }

  //consulta con sql
  Future<List<Map<String, dynamic>>> sqlQuery(String sql) async {
    Database? db = await database;
    var result = await db!.rawQuery(sql);
    return result;
  }

  //insertar datos en la base de datos
  Future<int> dbInsert(String table, Map<String, dynamic> row) async {
    Database? db = await database;
    var result = await db!.insert(table, row);
    return result;
  }

  //eliminar datos de la base de datos
  Future<int> dbDelete(String table, int id) async {
    Database? db = await database;
    var result = await db!.delete(table, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  //actualizar datos de la base de datos
  Future<int> bdUpdate(String table, Map<String, dynamic> row) async {
    Database? db = await database;
    var result = 0;
    if (db != null) {
      result =
          await db.update(table, row, where: 'id = ?', whereArgs: [row['id']]);
    }

    return result;
  }

  _dbInitialize() async {
    var folder = await getDatabasesPath();
    String path = folder + dbName;
    var database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      print('inicializando BD');
      await db.execute(
        "CREATE TABLE IF NOT EXISTS resources(id INTEGER PRIMARY KEY, title TEXT, author TEXT, type TEXT, bytes INTEGER, summary TEXT, imagePath TEXT, location TEXT)");
      
      await db.execute(
        "INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(1, 'El horror de Dunwich', 'François Baranger', 'Libro', 1234, 'Un libro ilustrado de Lovecraft.La pequeña villa de Dunwich vive aterrorizada por un ser monstruoso y deforme. Pero Wilbur Whateley no sólo tiene un aspecto grotesco, sino que también guarda un oscuro secreto: el Necronomicón, el libro maldito. Si alguien lo descubre y lo usa para invocar las fuerzas del mal que retiene, el mundo conocerá su apocalipsis.', 'assets/covers/dunwich.jpg', 'FNAC')");
      await db.execute("INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(2, 'Horrorstör', 'Grady Hendrix', 'Libro', 4321, 'Lorem fugiat ad adipisicing ut commodo mollit nulla anim fugiat labore laborum ullamco.', 'assets/covers/horrorstor.jpg', 'FNAC')");
      
     });
    print('BD inicializada');
    print(database);
    return database;
  }
}

//await db.execute("CREATE TABLE IF NOT EXIST <name>()");
//await db.execute("INSERT INTO <name>() VALUES()");
//await db.execute("INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(, '', '', '', '', '', '', '')");
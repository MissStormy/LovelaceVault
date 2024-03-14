import 'package:sqflite/sqflite.dart';

//helper para la base de datos
class DBHelper {
  static Database? _database;
  static const String dbName = "lovelacevault.db";

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
    var database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      print('inicializando BD');
      //------------------------------------
      // Insercion de datos de la BBDD local
      //------------------------------------
       await db.execute(
          "CREATE TABLE IF NOT EXISTS resource(id INTEGER PRIMARY KEY, isbn TEXT, title TEXT, author TEXT, year TEXT, type TEXT, resume TEXT, cites TEXT, reads TEXT, bytes TEXT)");
       //--------------------------------------------------------------------------------------------------------------
       // PLANTILLA DE INSERCION A TABLA RESOURCE
       // await db.execute("INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('','','','','','', , , )");
       //--------------------------------------------------------------------------------------------------------------
       await db.execute(
        "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-947132-0-0','Aparoksanubhuti : autorrealización','Ráphael (1920-) ; tr', '2017','Libro','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quis lorem efficitur orci efficitur maximus id rhoncus nisi. Nam consectetur commodo lacus ac euismod. Maecenas eu leo sit amet nibh tristique ullamcorper. Etiam cursus quam ut risus mattis, vitae blandit metus consectetur. Sed ac varius mauris. Ut purus erat, varius ac pellentesque ac, blandit in erat. Aliquam vitae ligula nisi. Sed placerat interdum erat vitae lacinia. Nam consequat sapien rhoncus efficitur imperdiet. Vivamus viverra interdum ipsum, ut tincidunt est. Nullam sodales tempor tellus sit amet lobortis. Donec nec dolor enim. Integer aliquam quis quam non posuere. Praesent a vestibulum eros, eu faucibus nisl. Integer ultricies mollis turpis a tincidunt. Nullam imperdiet magna lorem.Mauris tempor eu nulla dapibus scelerisque. Vestibulum elementum consectetur nisi ac fermentum. Curabitur viverra tortor et quam pulvinar scelerisque. Mauris et sagittis urna. Vivamus felis nisi, ultrices et viverra eu, lacinia sed augue. Sed magna est, laoreet et commodo sed, sollicitudin eget sem. Phasellus nisi metus, molestie quis magna vel, placerat egestas justo. Suspendisse non nisi libero. Sed rhoncus tortor dolor, ac dignissim diam vestibulum in. Pellentesque sit amet pharetra risus. In nec nisi vehicula, rutrum metus nec, volutpat lacus. Fusce ut lobortis tellus, vitae molestie lacus.', '1234', '1234','1234' )");
       await db.execute("INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-613-4669-1',' Atmabodha : el conocimiento del Atman','Sankaracarya (700?-750?)','2009','Monografia','Proident id irure mollit id cupidatat velit enim dolore cillum labore.', '4321', '4321', '4321')");
       await db.execute("INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-7517-428-0','Los cincuenta poemas del amor furtivo','Bilhana','1998','Monografia','Excepteur labore est minim aliqua.', '1423', '1423', '1423')");
       await db.execute("INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-87915-08-6','Bhagavad gita','Desconocido','1997','Libro','Consequat do cillum minim non.', '1111', '1111', '1111')");
       await db.execute("INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-615-1098-6','Las lenguas de la arqueología','Mateo Rodríguez, Luis (1965-) ;  Arconada Martín, Teresa de Jesús','2011','Monografia','Consequat duis ad fugiat sunt eiusmod ea tempor exercitation proident.', '2222', '2222', '2222')");
       await db.execute("INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-067-177-771-5','The Jewish-Japanese Sex and Cook Book and How to Raise Wolves','Jack Douglas','1974','Libro','Sit adipisicing proident proident minim ad ipsum irure anim nulla.', '1234', '1234', '1234')");
       });
       
      print('BD inicializada');
    return database;
    
  }
}
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
      //TABLA DE RECURSOS BIBLIOGRAFICOS LOCAL (OFFLINE)
      await db.execute(
          "CREATE TABLE IF NOT EXISTS resources(id INTEGER PRIMARY KEY, title TEXT, author TEXT, type TEXT, bytes INTEGER, summary TEXT, imagePath TEXT, location TEXT)");

      await db.execute(
          "INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(1, 'El horror de Dunwich', 'François Baranger', 'Libro', 1234, 'Un libro ilustrado de Lovecraft.La pequeña villa de Dunwich vive aterrorizada por un ser monstruoso y deforme. Pero Wilbur Whateley no sólo tiene un aspecto grotesco, sino que también guarda un oscuro secreto: el Necronomicón, el libro maldito. Si alguien lo descubre y lo usa para invocar las fuerzas del mal que retiene, el mundo conocerá su apocalipsis.', 'assets/covers/dunwich.jpg', 'FNAC')");
      await db.execute(
          "INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(2, 'Horrorstör', 'Grady Hendrix', 'Libro', 4321, 'Lorem fugiat ad adipisicing ut commodo mollit nulla anim fugiat labore laborum ullamco.', 'assets/covers/horrorstor.jpg', 'FNAC')");
      await db.execute(
          "INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(3, '1984', 'George Orwell', 'Libro', 1234, 'Novela distópica que presenta un futuro totalitario en el que el gobierno controla todos los aspectos de la vida de los ciudadanos.', 'assets/covers/1984.jpg', 'Amazon')");

      await db.execute(
          "INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(4, 'La influencia de la inteligencia artificial en la sociedad contemporánea', 'María Pérez', 'Tesis', 5678, 'Estudio sobre el impacto de la inteligencia artificial en diferentes ámbitos sociales, como la educación, la medicina y el mercado laboral.', '', 'Repositorio universitario')");

      await db.execute(
          "INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(5, 'Guía práctica de programación en Python', 'Desconocido', 'Recurso en línea', 999, 'Manual de referencia para aprender los fundamentos de la programación en Python, con ejemplos prácticos y ejercicios.', '', 'Sitio web de programación')");

      await db.execute(
          "INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(6, 'El Principito', 'Antoine de Saint-Exupéry', 'Libro', 1357, 'Clásico de la literatura infantil que narra las aventuras de un joven príncipe en diferentes planetas, explorando temas como la amistad y la humanidad.', 'assets/covers/el_principito.jpg', 'Casa del Libro')");

      await db.execute(
          "INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(7, 'Impacto de la globalización en la economía mundial', 'Javier Rodríguez', 'Tesis', 2468, 'Análisis exhaustivo de los efectos de la globalización en los mercados internacionales, incluyendo aspectos económicos, sociales y culturales.', '', 'Repositorio universitario')");
      await db.execute(
          "INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(8, 'El arte de la guerra', 'Sun Tzu', 'Libro', 2010, 'Tratado militar clásico que aborda estrategias y tácticas militares, aplicables también en el ámbito empresarial y de liderazgo.', 'assets/covers/el_arte_de_la_guerra.jpg', 'Librería local')");

      await db.execute(
          "INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(9, 'Inteligencia emocional', 'Daniel Goleman', 'Libro', 1850, 'Exploración sobre la importancia de la inteligencia emocional en el éxito personal y profesional, con estrategias para su desarrollo.', 'assets/covers/inteligencia_emocional.jpg', 'Biblioteca pública')");

      await db.execute(
          "INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(10, 'El origen de las especies', 'Charles Darwin', 'Libro', 3142, 'Obra seminal que introduce la teoría de la evolución mediante la selección natural, revolucionando la comprensión de la biología y la historia natural.', 'assets/covers/el_origen_de_las_especies.jpg', 'Tienda de libros usados')");

      await db.execute(
          "INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(11, 'Cómo ganar amigos e influir sobre las personas', 'Dale Carnegie', 'Libro', 2756, 'Guía clásica sobre habilidades sociales y técnicas de persuasión, con principios prácticos para mejorar las relaciones interpersonales y la comunicación.', 'assets/covers/como_ganar_amigos.jpg', 'Librería online')");

      await db.execute(
          "INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(12, 'La teoría de la relatividad', 'Albert Einstein', 'Libro', 1875, 'Explicación accesible de la teoría de la relatividad de Einstein, que transformó nuestra comprensión del tiempo, el espacio y la gravedad.', 'assets/covers/teoria_relatividad.jpg', 'Universidad')");

      //TABLA DE USUARIOS REGISTRADOS EN LA APP
      await db.execute(
          "CREATE TABLE IF NOT EXIST usuarios(id INTEGER PRIMARY KEY, username TEXT, password TEXT, organization TEXT CHECK(organization IN ('Universidad de Leon', 'Universidad de Valladolid', 'Archivo Nacional', 'Archivo Juridico de Navarra')))");
      await db.execute(
          "INSERT INTO usuarios(id, username, password, organization) VALUES(1, 'Admin', 'Admin', 'Universidad de Leon')");
      await db.execute(
          "INSERT INTO usuarios(username, password, organization) VALUES(2, 'Usuario1', 'Password1', 'Universidad de Valladolid')");
      await db.execute(
          "INSERT INTO usuarios(username, password, organization) VALUES(3, 'Usuario2', 'Password2', 'Archivo Nacional')");
      await db.execute(
          "INSERT INTO usuarios(username, password, organization) VALUES(4, 'Usuario3', 'Password3', 'Archivo Juridico de Navarra')");
    });
    print('BD inicializada');
    print(database);
    return database;
  }
}

//await db.execute("CREATE TABLE IF NOT EXIST <name>()");
//await db.execute("INSERT INTO <name>() VALUES()");
//await db.execute("INSERT INTO resources(id, title, author, type, bytes, summary, imagePath, location) VALUES(, '', '', '', '', '', '', '')");
//await db.execute("INSERT INTO usuarios(id, username, password, organization) VALUES(1, '', '', '')");
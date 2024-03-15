import 'package:sqflite/sqflite.dart';

//helper para la base de datos
/*class DBHelper {
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
    var database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
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
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-613-4669-1',' Atmabodha : el conocimiento del Atman','Sankaracarya (700?-750?)','2009','Monografia','Proident id irure mollit id cupidatat velit enim dolore cillum labore.', '4321', '4321', '4321')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-7517-428-0','Los cincuenta poemas del amor furtivo','Bilhana','1998','Monografia','Excepteur labore est minim aliqua.', '1423', '1423', '1423')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-87915-08-6','Bhagavad gita','Desconocido','1997','Libro','Consequat do cillum minim non.', '1111', '1111', '1111')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-615-1098-6','Las lenguas de la arqueología','Mateo Rodríguez, Luis (1965-) ;  Arconada Martín, Teresa de Jesús','2011','Monografia','Consequat duis ad fugiat sunt eiusmod ea tempor exercitation proident.', '2222', '2222', '2222')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-067-177-771-5','The Jewish-Japanese Sex and Cook Book and How to Raise Wolves','Jack Douglas','1974','Libro','Sit adipisicing proident proident minim ad ipsum irure anim nulla.', '1234', '1234', '1234')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-06-091403-6','To Kill a Mockingbird','Harper Lee','1960','Book','To Kill a Mockingbird is a novel by Harper Lee published in 1960. It was immediately successful, winning the Pulitzer Prize, and has become a classic of modern American literature.', '5000', '10000', '8000')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-307-95767-1','The Great Gatsby','F. Scott Fitzgerald','1925','Book','The Great Gatsby is a novel by American author F. Scott Fitzgerald. Set in the Jazz Age on Long Island, the novel depicts narrator Nick Carraway's interactions with mysterious millionaire Jay Gatsby and Gatsby's obsession with Nick's cousin Daisy Buchanan.', '7500', '12000', '9000')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-1-86092-021-7','1984','George Orwell','1949','Book','1984 is a dystopian social science fiction novel by English novelist George Orwell. It was published on 8 June 1949 by Secker & Warburg as Orwell's ninth and final book completed in his lifetime.', '6000', '11000', '8500')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-1-930709-45-4','The Catcher in the Rye','J.D. Salinger','1951','Book','The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adults, but is often read by adolescents for its themes of angst, alienation, and as a critique on superficiality in society.', '7000', '13000', '9500')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-618-34625-0','The Hobbit','J.R.R. Tolkien','1937','Book','The Hobbit, or There and Back Again, is a children's fantasy novel by English author J. R. R. Tolkien. It was published on 21 September 1937 to wide critical acclaim, being nominated for the Carnegie Medal and awarded a prize from the New York Herald Tribune for best juvenile fiction.', '5500', '9000', '7500')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-15-602943-8','East of Eden','John Steinbeck','1952','Book','East of Eden is a novel by Nobel Prize-winning author John Steinbeck, published in September 1952. Often described as Steinbeck's most ambitious novel, East of Eden brings to life the intricate details of two families, the Trasks and the Hamiltons, and their interwoven stories.', '4800', '8200', '6800')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-316-02929-6','The Road','Cormac McCarthy','2006','Book','The Road is a 2006 post-apocalyptic novel by American writer Cormac McCarthy. The novel portrays the journey of a father and his young son over a period of several months across a landscape blasted by an unspecified cataclysm that has destroyed most of civilization and, in the intervening years, almost all life on Earth.', '4100', '7500', '6200')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-385-66029-6','Brave New World','Aldous Huxley','1932','Book','Brave New World is a dystopian social science fiction novel by English author Aldous Huxley, written in 1931 and published in 1932. Largely set in a futuristic World State, whose citizens are environmentally engineered into an intelligence-based social hierarchy, the novel anticipates huge scientific advancements in reproductive technology, sleep-learning, psychological manipulation, and classical conditioning that are combined to make a dystopian society which is challenged by only a single individual: the story's protagonist.', '5200', '8800', '7200')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-670-53257-9','Moby-Dick; or, The Whale','Herman Melville','1851','Book','Moby-Dick; or, The Whale is an 1851 novel by American writer Herman Melville. The book is the sailor Ishmael's narrative of the obsessive quest of Ahab, captain of the whaling ship Pequod, for revenge on Moby Dick, the giant white sperm whale that on the ship's previous voyage bit off Ahab's leg at the knee.', '6200', '11000', '8800')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-545-43783-2','Harry Potter and the Philosopher\'s Stone','J.K. Rowling','1997','Book','Harry Potter and the Philosopher\'s Stone is a fantasy novel written by British author J.K. Rowling. The first novel in the Harry Potter series and Rowling\'s debut novel, it follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday, when he receives a letter of acceptance to Hogwarts School of Witchcraft and Wizardry.', '9500', '15000', '12000')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-1-86092-087-3','The Lord of the Rings','J.R.R. Tolkien','1954','Book','The Lord of the Rings is an epic high-fantasy novel written by English author J.R.R. Tolkien. The story began as a sequel to Tolkien\'s 1937 fantasy novel The Hobbit, but eventually developed into a much larger work.', '8000', '13000', '10000')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-618-99489-8','Pride and Prejudice','Jane Austen','1813','Book','Pride and Prejudice is a romantic novel of manners written by Jane Austen in 1813. The novel follows the character development of Elizabeth Bennet, the dynamic protagonist of the book who learns about the repercussions of hasty judgments and eventually comes to appreciate the difference between superficial goodness and actual goodness.', '7300', '12000', '9500')");
    });

    print('BD inicializada');
    return database;
  }
}*/

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;
  static const String dbName = "lovelacevault.db";

  // Initialize the database
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initializeDatabase();
    return _database;
  }

  // Initialize the database if it's not already initialized
  Future<Database> _initializeDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);
    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE IF NOT EXISTS resource("
          "id INTEGER PRIMARY KEY, "
          "isbn TEXT, "
          "title TEXT, "
          "author TEXT, "
          "year TEXT, "
          "type TEXT, "
          "resume TEXT, "
          "cites TEXT, "
          "reads TEXT, "
          "bytes TEXT)",
        );

        await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-947132-0-0','Aparoksanubhuti : autorrealización','Ráphael (1920-) ; tr', '2017','Libro','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quis lorem efficitur orci efficitur maximus id rhoncus nisi. Nam consectetur commodo lacus ac euismod. Maecenas eu leo sit amet nibh tristique ullamcorper. Etiam cursus quam ut risus mattis, vitae blandit metus consectetur. Sed ac varius mauris. Ut purus erat, varius ac pellentesque ac, blandit in erat. Aliquam vitae ligula nisi. Sed placerat interdum erat vitae lacinia. Nam consequat sapien rhoncus efficitur imperdiet. Vivamus viverra interdum ipsum, ut tincidunt est. Nullam sodales tempor tellus sit amet lobortis. Donec nec dolor enim. Integer aliquam quis quam non posuere. Praesent a vestibulum eros, eu faucibus nisl. Integer ultricies mollis turpis a tincidunt. Nullam imperdiet magna lorem.Mauris tempor eu nulla dapibus scelerisque. Vestibulum elementum consectetur nisi ac fermentum. Curabitur viverra tortor et quam pulvinar scelerisque. Mauris et sagittis urna. Vivamus felis nisi, ultrices et viverra eu, lacinia sed augue. Sed magna est, laoreet et commodo sed, sollicitudin eget sem. Phasellus nisi metus, molestie quis magna vel, placerat egestas justo. Suspendisse non nisi libero. Sed rhoncus tortor dolor, ac dignissim diam vestibulum in. Pellentesque sit amet pharetra risus. In nec nisi vehicula, rutrum metus nec, volutpat lacus. Fusce ut lobortis tellus, vitae molestie lacus.', '1234', '1234','1234' )");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-613-4669-1',' Atmabodha : el conocimiento del Atman','Sankaracarya (700?-750?)','2009','Monografia','Proident id irure mollit id cupidatat velit enim dolore cillum labore.', '4321', '4321', '4321')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-7517-428-0','Los cincuenta poemas del amor furtivo','Bilhana','1998','Monografia','Excepteur labore est minim aliqua.', '1423', '1423', '1423')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-87915-08-6','Bhagavad gita','Desconocido','1997','Libro','Consequat do cillum minim non.', '1111', '1111', '1111')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-84-615-1098-6','Las lenguas de la arqueología','Mateo Rodríguez, Luis (1965-) ;  Arconada Martín, Teresa de Jesús','2011','Monografia','Consequat duis ad fugiat sunt eiusmod ea tempor exercitation proident.', '2222', '2222', '2222')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-067-177-771-5','The Jewish-Japanese Sex and Cook Book and How to Raise Wolves','Jack Douglas','1974','Libro','Sit adipisicing proident proident minim ad ipsum irure anim nulla.', '1234', '1234', '1234')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-06-091403-6','To Kill a Mockingbird','Harper Lee','1960','Book','To Kill a Mockingbird is a novel by Harper Lee published in 1960. It was immediately successful, winning the Pulitzer Prize, and has become a classic of modern American literature.', '5000', '10000', '8000')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-307-95767-1','The Great Gatsby','F. Scott Fitzgerald','1925','Book','The Great Gatsby is a novel by American author F. Scott Fitzgerald. Set in the Jazz Age on Long Island, the novel depicts narrator Nick Carraway's interactions with mysterious millionaire Jay Gatsby and Gatsby's obsession with Nick's cousin Daisy Buchanan.', '7500', '12000', '9000')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-1-86092-021-7','1984','George Orwell','1949','Book','1984 is a dystopian social science fiction novel by English novelist George Orwell. It was published on 8 June 1949 by Secker & Warburg as Orwell's ninth and final book completed in his lifetime.', '6000', '11000', '8500')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-1-930709-45-4','The Catcher in the Rye','J.D. Salinger','1951','Book','The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adults, but is often read by adolescents for its themes of angst, alienation, and as a critique on superficiality in society.', '7000', '13000', '9500')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-618-34625-0','The Hobbit','J.R.R. Tolkien','1937','Book','The Hobbit, or There and Back Again, is a children's fantasy novel by English author J. R. R. Tolkien. It was published on 21 September 1937 to wide critical acclaim, being nominated for the Carnegie Medal and awarded a prize from the New York Herald Tribune for best juvenile fiction.', '5500', '9000', '7500')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-15-602943-8','East of Eden','John Steinbeck','1952','Book','East of Eden is a novel by Nobel Prize-winning author John Steinbeck, published in September 1952. Often described as Steinbeck's most ambitious novel, East of Eden brings to life the intricate details of two families, the Trasks and the Hamiltons, and their interwoven stories.', '4800', '8200', '6800')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-316-02929-6','The Road','Cormac McCarthy','2006','Book','The Road is a 2006 post-apocalyptic novel by American writer Cormac McCarthy. The novel portrays the journey of a father and his young son over a period of several months across a landscape blasted by an unspecified cataclysm that has destroyed most of civilization and, in the intervening years, almost all life on Earth.', '4100', '7500', '6200')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-385-66029-6','Brave New World','Aldous Huxley','1932','Book','Brave New World is a dystopian social science fiction novel by English author Aldous Huxley, written in 1931 and published in 1932. Largely set in a futuristic World State, whose citizens are environmentally engineered into an intelligence-based social hierarchy, the novel anticipates huge scientific advancements in reproductive technology, sleep-learning, psychological manipulation, and classical conditioning that are combined to make a dystopian society which is challenged by only a single individual: the story's protagonist.', '5200', '8800', '7200')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-670-53257-9','Moby-Dick; or, The Whale','Herman Melville','1851','Book','Moby-Dick; or, The Whale is an 1851 novel by American writer Herman Melville. The book is the sailor Ishmael's narrative of the obsessive quest of Ahab, captain of the whaling ship Pequod, for revenge on Moby Dick, the giant white sperm whale that on the ship's previous voyage bit off Ahab's leg at the knee.', '6200', '11000', '8800')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-545-43783-2','Harry Potter and the Philosopher\'s Stone','J.K. Rowling','1997','Book','Harry Potter and the Philosopher\'s Stone is a fantasy novel written by British author J.K. Rowling. The first novel in the Harry Potter series and Rowling\'s debut novel, it follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday, when he receives a letter of acceptance to Hogwarts School of Witchcraft and Wizardry.', '9500', '15000', '12000')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-1-86092-087-3','The Lord of the Rings','J.R.R. Tolkien','1954','Book','The Lord of the Rings is an epic high-fantasy novel written by English author J.R.R. Tolkien. The story began as a sequel to Tolkien\'s 1937 fantasy novel The Hobbit, but eventually developed into a much larger work.', '8000', '13000', '10000')");
      await db.execute(
          "INSERT INTO resource(isbn, title, author, year, type, resume, cites, reads, bytes) VALUES ('978-0-618-99489-8','Pride and Prejudice','Jane Austen','1813','Book','Pride and Prejudice is a romantic novel of manners written by Jane Austen in 1813. The novel follows the character development of Elizabeth Bennet, the dynamic protagonist of the book who learns about the repercussions of hasty judgments and eventually comes to appreciate the difference between superficial goodness and actual goodness.', '7300', '12000', '9500')");
    
      },
    );
  }

  // Query all records from a table
  Future<List<Map<String, dynamic>>> dbQuery(String table) async {
    final Database? db = await database;
    return db!.query(table);
  }

  // Insert a record into a table
  Future<int> dbInsert(String table, Map<String, dynamic> row) async {
    final Database? db = await database;
    return db!.insert(table, row);
  }

  // Delete a record from a table
  Future<int> dbDelete(String table, int id) async {
    final Database? db = await database;
    return db!.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  // Update a record in a table
  Future<int> dbUpdate(String table, Map<String, dynamic> row) async {
    final Database? db = await database;
    return db!.update(
      table,
      row,
      where: 'id = ?',
      whereArgs: [row['id']],
    );
  }
}


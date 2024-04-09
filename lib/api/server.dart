import 'dart:convert';
import 'dart:io';

void startServer() async {
  final server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    3000,
  );

  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    handleRequest(request);
  }
}

void handleRequest(HttpRequest request) {
  if (request.method == 'GET') {
    switch (request.uri.path) {
      case '/books':
        final books = [
          {
            'id': 1,
            'title': 'El horror de Dunwich',
            'author': 'François Baranger',
            'type': 'Libro',
            'bytes': 1234,
            'isChecked': false,
            'imagePath': 'assets/covers/dunwich.jpg',
            'summary': 'aaaaaaaaaaaa',
          },
          // Agrega más libros aquí según sea necesario
        ];
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType.json
          ..write(json.encode(books));
        break;
      case '/books/1':
        final book = {
          'id': 1,
          'title': 'El horror de Dunwich',
          'author': 'François Baranger',
          'type': 'Libro',
          'bytes': 1234,
          'isChecked': false,
          'imagePath': 'assets/covers/dunwich.jpg',
          'summary': 'aaaaaaaaaaaa',
        };
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType.json
          ..write(json.encode(book));
        break;
      // Agrega más rutas para obtener libros por ID o cualquier otra ruta necesaria
      default:
        request.response
          ..statusCode = HttpStatus.notFound
          ..write('Not Found');
    }
  } else {
    request.response
      ..statusCode = HttpStatus.methodNotAllowed
      ..write('Unsupported request: ${request.method}.');
  }
  request.response.close();
}
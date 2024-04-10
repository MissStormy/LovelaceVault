import 'package:lovelacevault/data/database.dart';
import 'dart:convert';

class Usuario{
  int? id;
  late String username;
  late String password;
  late String organization;

  //CONSTRUCTOR VACIO
  Usuario(){
    username = '';
    password = '';
    organization = '';
  }

  //CONSTRUCTOR SIN ID
  Usuario.withoutId(
    this.username,
    this.password,
    this.organization
  );

  //CONSTRUCTOR CON ID
  Usuario.withId(
    this.id,
    this.username,
    this.password,
    this.organization
  );

  //RECEPCION DE DATOS Y COLOCACION EN MAP
  Usuario.fromMap(Map<String, dynamic> map) {
    id = (map['id'] != null) ? map['id'] : null;
    username = (map['username'] != null) ? map['username'] : '';
    password = (map['password'] != null) ? map['password'] : '';
    organization = (map['organization'] != null) ? map['organization'] : '';
  }

  //MAP
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['username'] = username;
    map['password'] = password;
    map['organization'] = organization;
    return map;
  }

  //SACAR LISTA
  Future<List<Usuario>> getUsuarios() async{
    List<Usuario> usuarios = [];
    DBHelper dbHelper = DBHelper();
    List<Map<String, dynamic>> usuariosDB = await dbHelper.dbQuery('usuarios');
    for(int i = 0; i < usuariosDB.length; i++){
      usuarios.add(Usuario.fromMap(usuariosDB[i]));
    }
    return usuarios;

  }

  //GUARDAR USUARIO
  saveUsuario(Usuario usuario) async{
    DBHelper dbHelper = DBHelper();
    dbHelper.dbInsert('usuarios', usuario.toMap());
  }
}
import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:lovelacevault/widgets/popup/edit_popup.dart';
import 'package:lovelacevault/widgets/ui/custom_appbar.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchValue1 =
      false; // Variable para controlar el estado del primer switch
  bool switchValue2 =
      false; // Variable para controlar el estado del segundo switch
  String selectedLanguage =
      'Español'; // Variable para almacenar el idioma seleccionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Imagen de perfil
                GestureDetector(
                  onTap: () {
                    // Acción al pulsar sobre la imagen de perfil
                  },
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.grey,
                    backgroundImage: null, // Aquí iría la imagen de perfil
                  ),
                ),
                SizedBox(height: 10.0),
                // Username
                Text(
                  "Username",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                // Container con opciones
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      buildOptionRow(Icons.edit, "Editar nombre", onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return EditPopup(
                              title: 'Editar nombre',
                              initialValue: 'Valor inicial',
                              onSubmit: (newValue) {
                                // Lógica para guardar el nuevo valor en la base de datos
                              },
                            );
                          },
                        );
                      }),
                      Divider(),
                      buildOptionRow(Icons.lock, "Cambiar contraseña",
                          onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return EditPopup(
                              title: 'Editar contraseña',
                              initialValue: 'Valor inicial',
                              onSubmit: (newValue) {
                                // Lógica para guardar el nuevo valor en la base de datos
                              },
                            );
                          },
                        );
                      }),
                      Divider(),
                      buildOptionRow(Icons.email, "Cambiar correo", onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return EditPopup(
                              title: 'Editar correo',
                              initialValue: 'Valor inicial',
                              onSubmit: (newValue) {
                                // Lógica para guardar el nuevo valor en la base de datos
                              },
                            );
                          },
                        );
                      }),
                      Divider(),
                      buildOptionRow(
                        Icons.circle,
                        "Cambiar tema",
                        isSwitch: true,
                        switchValue: switchValue1,
                        onChanged: (value) {
                          setState(() {
                            switchValue1 = value;
                          });
                          if (value) {
                            // Cambiar al tema claro
                            Provider.of<ThemeLoader>(context, listen: false)
                                .lightTheme = true;
                          } else {
                            // Cambiar al tema oscuro
                            Provider.of<ThemeLoader>(context, listen: false)
                                .darkTheme = true;
                          }
                        },
                      ),
                      Divider(),
                      buildOptionRow(Icons.notifications, "Notificaciones",
                          isSwitch: true,
                          switchValue: switchValue2, onChanged: (value) {
                        setState(() {
                          switchValue2 = value;
                        });
                      }, onTap: () {
                        // Acción al pulsar sobre "Notificaciones"
                      }),
                      Divider(),
                      buildOptionRow(Icons.language, "Idioma", isDropdown: true,
                          onTap: () {
                        // Acción al pulsar sobre "Idioma"
                      }),
                      Divider(),
                      buildOptionRow(Icons.logout, "Cerrar sesión",
                          isLogout: true, onTap: () {
                        // Acción al pulsar sobre "Cerrar sesión"
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                // Créditos y copyright
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Acción al pulsar sobre "Créditos"
                      },
                      child: Text(
                        "Créditos",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Acción al pulsar sobre "Copyright"
                      },
                      child: Text(
                        "©",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOptionRow(IconData icon, String label,
      {bool isSwitch = false,
      bool isDropdown = false,
      bool isLogout = false,
      bool? switchValue,
      Function(bool)? onChanged,
      VoidCallback? onTap}) {
    if (isSwitch) {
      return ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(label),
        trailing: Switch(
          value: switchValue ?? false,
          onChanged: onChanged,
        ),
      );
    } else if (isDropdown) {
      return ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(label),
        trailing: DropdownButton<String>(
          value: selectedLanguage,
          onChanged: (String? newValue) {
            setState(() {
              selectedLanguage = newValue!;
            });
          },
          items: <String>['Español', 'Inglés']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      );
    } else if (isLogout) {
      return ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(label),
        trailing: IconButton(
          icon: Icon(Icons.power_settings_new),
          onPressed: () {
            // Acción al pulsar sobre el botón de cerrar sesión
          },
        ),
      );
    } else {
      return ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(label),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            // Acción al pulsar sobre el botón de flecha
          },
        ),
      );
    }
  }
}

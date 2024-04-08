import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';
class CustomRoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? line1;
  final String? line2;
  final double appBarHeight;
  final Widget? action;
  final bool showBackButton; // Nuevo parámetro para mostrar o no la flecha de retroceso

  const CustomRoundedAppBar({
    this.line1,
    this.line2,
    this.appBarHeight = 80.0, // Valor predeterminado para la altura del AppBar
    this.action,
    this.showBackButton = false, // Valor predeterminado para no mostrar la flecha de retroceso
  });

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(40.0),
      ),
      child: Container(
        color: actualTheme.colorScheme.primary,
        
        child: SafeArea(
          child: Container(
            height: appBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showBackButton) // Mostrar la flecha de retroceso si showBackButton es verdadero
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Navegar hacia atrás cuando se presiona la flecha de retroceso
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                if (line1 != null || line2 != null) // Verifica si alguno de los textos no es nulo
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0), // Ajusta el espacio a la izquierda del texto
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (line1 != null) // Verifica si line1 no es nulo
                          Text(
                            line1!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0, // Tamaño del texto aumentado
                            ),
                          ),
                        if (line2 != null) // Verifica si line2 no es nulo
                          Text(
                            line2!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0, // Tamaño del texto aumentado
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ),
                action != null ? Padding(
                  padding: const EdgeInsets.only(right: 8.0), // Ajusta el espacio a la derecha del icono
                  child: SizedBox(
                    width: 50.0, // Ancho del icono reducido
                    height: 50.0, // Alto del icono reducido
                    child: action,
                  ),
                ) : SizedBox(), // Muestra el widget action si está presente, o un SizedBox si no lo está
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

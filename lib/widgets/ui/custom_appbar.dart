import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';
class CustomRoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? line1;
  final String? line2;
  final double appBarHeight;
  final Widget? action;
  final bool showBackButton; 
  final Widget? notificationButton;// Nuevo parámetro para mostrar o no la flecha de retroceso

  const CustomRoundedAppBar({
    this.line1,
    this.line2,
    this.appBarHeight = 80.0, // Valor predeterminado para la altura del AppBar
    this.action,
    this.showBackButton = false,
    this.notificationButton, 
    // Valor predeterminado para no mostrar la flecha de retroceso
  });

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return ClipRRect(
      /* borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(20.0),
      ), */
      child: Container(
        color: actualTheme.colorScheme.background.withOpacity(0.7),
        
        child: SafeArea(
          child: Container(
            height: appBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showBackButton) 
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context); 
                    },
                    icon: Icon(Icons.arrow_back, color: actualTheme.colorScheme.onError,),
                  ),
                if (line1 != null || line2 != null) 
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0), 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (line1 != null) 
                          Text(
                            line1!,
                            style: TextStyle(
                              color: actualTheme.colorScheme.onError,
                              fontSize: 18.0, 
                            ),
                          ),
                        if (line2 != null) 
                          Text(
                            line2!,
                            style: TextStyle(
                              color: actualTheme.colorScheme.onError,
                              fontSize: 20.0, 
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ),
                  notificationButton != null ? Padding( 
                  padding: const EdgeInsets.only(left: 10.0), 
                  child: SizedBox(
                    width: 50.0, 
                    height: 50.0, 
                    child: notificationButton, 
                  ),
                ) : SizedBox(),
                action != null ? Padding(
                  padding: const EdgeInsets.only(right: 8.0), 
                  child: SizedBox(
                    width: 50.0, 
                    height: 50.0, 
                    child: action,
                  ),
                ) : SizedBox(), 
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

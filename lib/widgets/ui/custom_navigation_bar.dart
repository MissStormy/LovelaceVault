import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final double navBarHeight;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    this.navBarHeight = 70.0, // Altura predeterminada del BottomNavigationBar
  });

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return ClipRRect(
      
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
      child: Container(
        
        height: navBarHeight, // Altura personalizada del BottomNavigationBar
        color: actualTheme.colorScheme.primary, // Color de fondo del BottomNavigationBar
        child: BottomNavigationBar(
          
          currentIndex: currentIndex,
          onTap: onTap,
          showSelectedLabels: false, // Oculta los labels seleccionados
          showUnselectedLabels: false, // Oculta los labels no seleccionados
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: actualTheme.colorScheme.onBackground,),
              label: 'Home',
              backgroundColor: actualTheme.colorScheme.primary,
              
            ),
            BottomNavigationBarItem(
            icon: Image.asset('assets/logoIn.png', width: 24, height: 24,),
            label: 'Editor',
            backgroundColor: actualTheme.colorScheme.primary
          ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book, color: actualTheme.colorScheme.onBackground),
              label: 'Bookshelf',
              backgroundColor: actualTheme.colorScheme.primary
            ),
            BottomNavigationBarItem(
            icon: Image.asset('assets/minerva2.png', width: 24, height: 24),
            label: 'Minerva',
            backgroundColor: actualTheme.colorScheme.primary
          ),
          ],
        ),
      ),
    );
  }
}

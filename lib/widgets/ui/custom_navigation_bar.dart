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
    this.navBarHeight = 70.0,
  });

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80.0),
        child: Container(
          height: navBarHeight,
          color: actualTheme.colorScheme.background.withOpacity(0.7),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: actualTheme.colorScheme.surface),
                label: 'Home',
                backgroundColor: actualTheme.colorScheme.background.withOpacity(0.7),
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/logoIn.png', width: 24, height: 24),
                label: 'Editor',
                backgroundColor: actualTheme.colorScheme.background.withOpacity(0.7),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book, color: actualTheme.colorScheme.surface),
                label: 'Bookshelf',
                backgroundColor: actualTheme.colorScheme.background.withOpacity(0.7),
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/minerva2.png', width: 24, height: 24),
                label: 'Minerva',
                backgroundColor: actualTheme.colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

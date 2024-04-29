import 'package:flutter/material.dart';

/// Class that loads the application theme
/// Allows switching between light and dark themes
/// If 0 is passed in the constructor, it loads the light theme
/// If 1 is passed in the constructor, it loads the dark theme
/// If any other value is passed in the constructor, it loads the light theme

class ThemeLoader with ChangeNotifier {
  late ThemeData _theme;

  bool _darkTheme = false;
  bool _lightTheme = false;

  bool get darkTheme => _darkTheme;
  ThemeData get actualTheme => _theme;

  ThemeLoader(int theme) {
    //lock active theme
    switch (theme) {
      case 0:
        _theme = _myLightTheme();
        _lightTheme = true;
        _darkTheme = false;
        break;
      case 1:
        _theme = _myDarkTheme();
        _lightTheme = false;
        _darkTheme = true;
        break;
      default:
        _theme = _myLightTheme();
        _darkTheme = true;
        break;
    }
  }

  set darkTheme(bool value) {
    _darkTheme = value;
    _lightTheme = !value;
    //lock active theme
    if (value) {
      //modify value of dark theme for our app
      _theme = _myLightTheme();
    } else {
      _theme = _myDarkTheme();
    }
    notifyListeners();
  }

  set lightTheme(bool value) {
    _lightTheme = value;
    _darkTheme = !value;
    //lock active theme
    if (value) {
      //modify value of light theme for our app
      _theme = _myDarkTheme();
    } else {
      _theme = _myLightTheme();
    }
    notifyListeners();
  }

  //Light theme: Blazing pink
  ThemeData _myLightTheme() {
    return (ThemeData.light().copyWith(
        colorScheme: const ColorScheme(
          primary: Color(0xFF772728),
          secondary: Color(0xFFe47645),
          background: Color(0xFFf09f5d),
          surface: Color(0xFFf4d2af),
          onBackground: Color(0xFFffeedc),
          onSurface: Color(0xFFaba543),
          brightness: Brightness.light,
          error: Colors.black,
          onError: Colors.black,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Typewriter',
                color: Color(0xFF0D0D0D)))));
  }

  //Palette: Cozy Coffee
  ThemeData _myDarkTheme() {
    return (ThemeData.dark().copyWith(
        colorScheme: const ColorScheme(
          primary: Color(0xFF060606),
          secondary: Color(0xFF41251a),
          background: Color(0xFF973c2d),
          surface: Color(0xFFb63f1c),
          onBackground: Color(0xFFd85e23),
          onSurface: Color(0xFFe5904f),
          brightness: Brightness.dark,
          error: Colors.black,
          onError: Color(0xFFECEFF1),
          onPrimary: Color(0xFF7a8a8c),
          onSecondary: Color(0xFF3f5354),
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Typewriter',
                color: Color(0xFFECEFF1)))));
  }
}

// Palette template
// primary: , // Text color
// secondary: , // Accent color
// background:, // Background color
// surface: , // Secondary color
// onPrimary: , // Text color on top of the primary color
// onSecondary:, // Text color on top of the secondary color
// onBackground: , // Text color on top of the background color
// onSurface: , // Text color on top of the surface color
// brightness: Brightness.light,
// error: Color(0xFFFF6E40),
// onError: Color(0xFFECEFF1),

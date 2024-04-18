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
          primary: Color(0xFF9b2b0),
          secondary: Color(0xFF9b4d5a),
          background: Color(0xFFa9667c),
          surface: Color(0xFFeef2e7),
          onBackground: Color(0xFFc8c3af),
          onSurface: Color(0xFF000000),
          brightness: Brightness.light,
          error: Colors.black,
          onError: Colors.black,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Quicksand',
                color: Color(0xFF0D0D0D)))));
  }

  //Palette: Cozy Coffee
  ThemeData _myDarkTheme() {
    return (ThemeData.dark().copyWith(
        colorScheme: const ColorScheme(
          primary: Color(0xFF071424),
          secondary: Color(0xFF425072),
          background: Color(0xFF5e6a76),
          surface: Color(0xFF030e14),
          onBackground: Color(0xFFf8ae6b),
          onSurface: Color(0xFFe67538),
          brightness: Brightness.dark,
          error: Colors.black,
          onError: Color(0xFFECEFF1),
          onPrimary: Color(0xFF7a8a8c),
          onSecondary: Color(0xFF3f5354),
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Quicksand',
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

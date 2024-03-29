import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
     final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return const Placeholder();
  }
}
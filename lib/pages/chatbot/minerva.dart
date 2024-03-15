import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

class Minerva extends StatefulWidget {
  const Minerva({super.key});

  @override
  State<Minerva> createState() => _MinervaState();
}

class _MinervaState extends State<Minerva> {
 
  @override
  Widget build(BuildContext context) {
     final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return const Placeholder();
  }
}